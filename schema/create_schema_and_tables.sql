--======================================================
-- HARD RESET: Drop + recreate dataset
--======================================================
--Drop dataset within the project
DROP SCHEMA IF EXISTS `pokemon-corporate-registry.pogo_corp` CASCADE;
--Recreate dataset
CREATE SCHEMA IF NOT EXISTS `pokemon-corporate-registry.pogo_corp`
OPTIONS(location="US");

--======================================================
-- CREATE TABLES
--======================================================

-- MAIN REGISTRY
CREATE TABLE IF NOT EXISTS `pokemon-corporate-registry.pogo_corp.pokemon_registry`
  (
    pokemon_name    STRING NOT NULL,
    pokemon_species STRING NOT NULL,
    species_variant STRING,
    gender          STRING NOT NULL,
    pokemon_type    STRING NOT NULL
  );

--POKEMON SPECIES
CREATE TABLE IF NOT EXISTS `pokemon-corporate-registry.pogo_corp.dim_species`
  (
    pokedex_number  INT64,
    pokemon_region  STRING NOT NULL,
    pokemon_species STRING NOT NULL,
    primary_type    STRING NOT NULL,
    secondary_type  STRING,
    can_be_shiny    BOOL DEFAULT FALSE,
    caught          BOOL DEFAULT FALSE,
    caught_shiny    BOOL DEFAULT FALSE

  );


-- POKEMON ATTACKS (species changes with evolution)
CREATE TABLE IF NOT EXISTS `pokemon-corporate-registry.pogo_corp.pokemon_attacks`
  (
    pokemon_name     STRING NOT NULL,
    pokemon_species  STRING NOT NULL,
    pokemon_type     STRING NOT NULL,
    quick_move       STRING NOT NULL,
    main_move        STRING NOT NULL
  );

-- DIM TYPES (lists the 18 possible pokemon types)
CREATE TABLE IF NOT EXISTS `pokemon-corporate-registry.pogo_corp.dim_types`
  (
    type_name STRING NOT NULL
  );

-- DIM MOVES (limited set; no regeneration)
CREATE TABLE IF NOT EXISTS `pokemon-corporate-registry.pogo_corp.dim_moves`
  (
    move_name STRING NOT NULL,
    move_type STRING NOT NULL,
    move_kind STRING NOT NULL,
    damage    INT64,
    dps       FLOAT64
  );

-- EVOLUTION CHAIN (one evolution per row)
CREATE TABLE IF NOT EXISTS `pokemon-corporate-registry.pogo_corp.dim_evolution_chain`
  (
    from_species STRING NOT NULL,
    to_species   STRING NOT NULL
  );


-- NO-EVOLUTION SPECIES
CREATE TABLE IF NOT EXISTS `pokemon-corporate-registry.pogo_corp.dim_no_evolution_species` 
  (
    species STRING NOT NULL
  );


-- EVOLUTION CHANGELOG
CREATE TABLE IF NOT EXISTS `pokemon-corporate-registry.pogo_corp.evolution_log`
  (
    pokemon_name  STRING NOT NULL,
    evolved_from  STRING NOT NULL,
    evolved_to    STRING NOT NULL,
    evolved_at    TIMESTAMP NOT NULL
  );

-- MOVE CHANGELOG
CREATE TABLE IF NOT EXISTS `pokemon-corporate-registry.pogo_corp.move_change_log`
  (
    pokemon_name    STRING NOT NULL,
    old_quick_move  STRING,
    new_quick_move  STRING,
    old_main_move   STRING,
    new_main_move   STRING,
    changed_at      TIMESTAMP NOT NULL,
    change_reason   STRING
  );


