-- =======================================================================
-- EVOLUTION OVERRIDE PROCEDURE
-- - Errors if pokemon_name not found
-- - Checks variant override first using species_variant
-- - Falls back to standard dim_evolution_chain logic
-- - Errors if branch evolution exists (lists choices)
-- - Errors if no evolution exists (checks dim_no_evolution_species)
-- - Updates BOTH registry species AND attack species
-- - Clears species_variant after successful override evolution
-- - Writes to evolution_log
-- ======================================================================

CREATE OR REPLACE PROCEDURE `pokemon-corporate-registry.pogo_corp.evolve_pokemon_with_override` (
  p_pokemon_name STRING
)
BEGIN
  -- Declarations must be at the start of the block
  DECLARE current_species STRING;
  DECLARE current_variant STRING;
  DECLARE current_pokedex_number INT64;

  DECLARE next_species STRING;
  DECLARE next_pokedex_number INT64;

  DECLARE option_count INT64;
  DECLARE options_string STRING;
  DECLARE is_no_evolution BOOL DEFAULT FALSE;

  DECLARE override_count INT64 DEFAULT 0;
  DECLARE used_override BOOL DEFAULT FALSE;

  -- 1: Current pokemon lookup, error if name not found
  SET (current_species, current_variant) = (
      SELECT AS STRUCT pokemon_species, species_variant
      FROM `pokemon-corporate-registry.pogo_corp.pokemon_registry`
      WHERE pokemon_name = p_pokemon_name
      LIMIT 1
  );

  IF current_species IS NULL THEN
    RAISE USING MESSAGE = CONCAT('No pokemon found with name: ', p_pokemon_name);
  END IF;


  -- 2: Get current species pokedex number
  SET current_pokedex_number = (
      SELECT pokedex_number
      FROM `pokemon-corporate-registry.pogo_corp.dim_species`
      WHERE pokemon_species = current_species
      LIMIT 1
  );

  IF current_pokedex_number IS NULL THEN
    RAISE USING MESSAGE = CONCAT ('Current species not found in dim_species: ', current_species
    );
  END IF;


  -- 3: Check variant override first
  IF current_variant IS NOT NULL THEN
    SET override_count = (
        SELECT COUNT (*)
        FROM `pokemon-corporate-registry.pogo_corp.dim_variant_evolution_override`
        WHERE pokedex_number = current_pokedex_number
          AND variant_region = current_variant
    );

    IF override_count > 1 THEN
      RAISE USING MESSAGE = CONCAT(
        'Multiple variant evolution overrides found for species: ',
        current_species,
        ', variant: ',
        current_variant,
        '.'
      );
    END IF;

    IF override_count = 1 THEN
      SET next_pokedex_number = (
        SELECT evolves_to
        FROM `pokemon-corporate-registry.pogo_corp.dim_variant_evolution_override`
        WHERE pokedex_number = current_pokedex_number
          AND variant_region = current_variant
        LIMIT 1
      );

      SET next_species = (
        SELECT pokemon_species
        FROM `pokemon-corporate-registry.pogo_corp.dim_species`
        WHERE pokedex_number = next_pokedex_number
        LIMIT 1
      );

      IF next_species IS NULL THEN
        RAISE USING MESSAGE = CONCAT(
          'Override evolution target pokedex number not found in dim_species: ',
          CAST(next_pokedex_number AS STRING)
        );
      END IF;

      SET used_override = TRUE;
    END IF;
  END IF;

  -- 4: If no override was used, fall back to standard evolution chain
  IF NOT used_override THEN
    SET option_count = (
      SELECT COUNT (*)
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
          '. Not found in dim_evolution_chain, dim_variant_evolution_override, and not listed in dim_no_evolution_species.'
        );
      END IF;
    END IF;
  END IF;


  -- 5: Update species in main registry table
  UPDATE `pokemon-corporate-registry.pogo_corp.pokemon_registry`
  SET
    pokemon_species = next_species,
    species_variant = CASE
      WHEN used_override THEN NULL
      ELSE species_variant
    END
  WHERE pokemon_name = p_pokemon_name;


  -- 6: Update species in pokemon attacks table
  UPDATE `pokemon-corporate-registry.pogo_corp.pokemon_attacks`
  SET pokemon_species = next_species
  WHERE pokemon_name = p_pokemon_name;


  -- 7: Add evolution to changelog
  INSERT INTO `pokemon-corporate-registry.pogo_corp.evolution_log`
    (pokemon_name, evolved_from, evolved_to, evolved_at)
  VALUES
    (p_pokemon_name, current_species, next_species, CURRENT_TIMESTAMP());

END;
    
