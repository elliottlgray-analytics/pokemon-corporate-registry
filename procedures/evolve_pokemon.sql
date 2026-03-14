--=====================================================================
-- EVOLUTION PROCEDURES
-- - Errors if pokemon_name not found
-- - Errors if branch evolution exists (lists choices)
-- - Errors if no evolution exists (checks dim_no_evolution_species)
-- - Updates BOTH registry species AND attack species
-- - Writes to evolution_log
--======================================================================

CREATE OR REPLACE PROCEDURE `pokemon-corporate-registry.pogo_corp.evolve_pokemon`
(
  p_pokemon_name STRING
)
BEGIN
  -- Declarations MUST be at the start of the block
  DECLARE current_species STRING;
  DECLARE next_species STRING;

  DECLARE option_count INT64;
  DECLARE options_string STRING;
  DECLARE is_no_evolution BOOL DEFAULT FALSE;

  -- 1: Current species lookup, error if name not found
  SET current_species = (
    SELECT pokemon_species
    FROM `pokemon-corporate-registry.pogo_corp.pokemon_registry`
    WHERE pokemon_name = p_pokemon_name
    LIMIT 1
  );

  IF current_species IS NULL THEN
    RAISE USING MESSAGE = CONCAT('No pokemon found with name: ', p_pokemon_name);
  END IF;

  -- 2: Next evolution lookup
  --    - If >1 options → branch evolution (error + list choices)
  --    - If 1 option  → linear evolution (set next_species)
  --    - If 0 options → check dim_no_evolution_species:
  --         * if present → no-evolution error
  --         * if absent  → missing mapping error

  SET option_count = (
    SELECT COUNT(*)
    FROM `pokemon-corporate-registry.pogo_corp.dim_evolution_chain`
    WHERE from_species = current_species
  );

  IF option_count > 1 THEN
    SET options_string = (
      SELECT STRING_AGG(to_species, ', ' ORDER BY to_species)
      FROM `pokemon-corporate-registry.pogo_corp.dim_evolution_chain`
      WHERE from_species = current_species
    );

    RAISE USING MESSAGE = CONCAT(
      'Branch evolution detected for species: ',
      current_species,
      '. Choose one of: ',
      options_string,
      '.'
    );
  END IF;

  IF option_count = 1 THEN
    SET next_species = (
      SELECT to_species
      FROM `pokemon-corporate-registry.pogo_corp.dim_evolution_chain`
      WHERE from_species = current_species
      LIMIT 1
    );
  END IF;

  IF option_count = 0 THEN
    SET is_no_evolution = EXISTS (
      SELECT 1
      FROM `pokemon-corporate-registry.pogo_corp.dim_no_evolution_species`
      WHERE species = current_species
      LIMIT 1
    );

    IF is_no_evolution THEN
      RAISE USING MESSAGE = CONCAT(
        'No evolution: ',
        current_species,
        ' is listed in dim_no_evolution_species.'
      );
    ELSE
      RAISE USING MESSAGE = CONCAT(
        'No evolution mapping found for species: ',
        current_species,
        '. Not found in dim_evolution_chain and not listed in dim_no_evolution_species.'
      );
    END IF;
  END IF;

  -- 3: Update species in main registry table
  UPDATE `pokemon-corporate-registry.pogo_corp.pokemon_registry`
  SET pokemon_species = next_species
  WHERE pokemon_name = p_pokemon_name;

  -- 4: Update species in pokemon attacks table
  UPDATE `pokemon-corporate-registry.pogo_corp.pokemon_attacks`
  SET pokemon_species = next_species
  WHERE pokemon_name = p_pokemon_name;

  -- 5: Add evolution to changelog
  INSERT INTO `pokemon-corporate-registry.pogo_corp.evolution_log`
    (pokemon_name, evolved_from, evolved_to, evolved_at)
  VALUES
    (p_pokemon_name, current_species, next_species, CURRENT_TIMESTAMP());

END;
