-- ===================================================
-- ADD species_form TO MAIN REGISTRY
-- ===================================================

ALTER TABLE `pokemon-corporate-registry.pogo_corp.pokemon_registry`
ADD COLUMN species_form STRING;


-- ===================================================
-- DROP OLD SPECIES REFERENCE TABLES
-- ===================================================

DROP TABLE IF EXISTS `pokemon-corporate-registry.pogo_corp.dim_species`;
DROP TABLE IF EXISTS `pokemon-corporate-registry.pogo_corp.dim_species_variants`;


-- ===================================================
-- CREATE UNIFIED SPECIES IDENTITY TABLE
-- ===================================================

CREATE TABLE IF NOT EXISTS `pokemon-corporate-registry.pogo_corp.dim_species_identity`
(
  pokedex_number   INT64,
  pokemon_species  STRING NOT NULL,
  species_variant  STRING,
  species_form     STRING,
  primary_type     STRING NOT NULL,
  secondary_type   STRING
);
