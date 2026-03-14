-- =============================================
-- SEEDING DIM VARIANT EVOLUTION OVERRIDES
-- =============================================

MERGE `pokemon-corporate-registry.pogo_corp.dim_variant_evolution_override` AS target
USING (
  SELECT * FROM UNNEST ([
    STRUCT(0052 AS pokedex_number, 'Galar' AS variant_region, 0863 AS evolves_to),
    STRUCT(0083, 'Galar', 0865),
    STRUCT(0222, 'Galar', 0864),
    STRUCT(0264, 'Galar', 0862),
    STRUCT(0122, 'Galar', 0866),
    STRUCT(0562, 'Galar', 0867),
    STRUCT(0211, 'Hisui', 0904),
    STRUCT(0215, 'Hisui', 0903),
    STRUCT(0194, 'Paldea', 0980)
  ])
) AS source
ON target.pokedex_number = source.pokedex_number
AND target.variant_region = source.variant_region
WHEN NOT MATCHED THEN
  INSERT(
    pokedex_number,
    variant_region,
    evolves_to
  
  )
  VALUES(
    source.pokedex_number,
    source.variant_region,
    source.evolves_to
  );
