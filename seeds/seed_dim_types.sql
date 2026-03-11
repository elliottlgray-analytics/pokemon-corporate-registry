-- ======================================================
-- SEED DIM_TYPES
-- Pokémon Corporate Registry
-- Inserts Pokémon type reference data
-- ======================================================

MERGE `pokemon-corporate-registry.pogo_corp.dim_types` AS T
USING (
  SELECT 'Normal'  AS type_name UNION ALL
  SELECT 'Fire'      UNION ALL
  SELECT 'Water'     UNION ALL
  SELECT 'Electric'  UNION ALL
  SELECT 'Grass'     UNION ALL
  SELECT 'Ice'       UNION ALL
  SELECT 'Fighting'  UNION ALL
  SELECT 'Poison'    UNION ALL
  SELECT 'Ground'    UNION ALL
  SELECT 'Flying'    UNION ALL
  SELECT 'Psychic'   UNION ALL
  SELECT 'Bug'       UNION ALL
  SELECT 'Rock'      UNION ALL
  SELECT 'Ghost'     UNION ALL
  SELECT 'Dragon'    UNION ALL
  SELECT 'Dark'      UNION ALL
  SELECT 'Steel'     UNION ALL
  SELECT 'Fairy'
) AS S
ON T.type_name = S.type_name

WHEN NOT MATCHED THEN
  INSERT (type_name)
  VALUES (S.type_name);
