-- ===========================================
-- SEEDING DIM SPECIES VARIANTS
-- MERGE for rerun proofing
-- ===========================================

MERGE `pokemon-corporate-registry.pogo_corp.dim_species_variants` AS target
USING (
  SELECT * FROM UNNEST([
    STRUCT(0020 AS pokedex_number, 'Alola' AS variant_region, 'Dark' AS primary_type, 'Normal' AS secondary_type),

    -- ALOLA VARIANTS
    STRUCT(0019, 'Alola', 'Dark', NULL),
    STRUCT(0026, 'Alola', 'Electric', 'Psychic'),
    STRUCT(0027, 'Alola', 'Ice', 'Steel'),
    STRUCT(0028, 'Alola', 'Ice', 'Steel'),
    STRUCT(0037, 'Alola', 'Ice', NULL),
    STRUCT(0038, 'Alola', 'Ice', 'Fairy'),
    STRUCT(0050, 'Alola', 'Ground', 'Steel'),
    STRUCT(0051, 'Alola', 'Ground', 'Steel'),
    STRUCT(0052, 'Alola', 'Dark', NULL),
    STRUCT(0053, 'Alola', 'Dark', NULL),
    STRUCT(0074, 'Alola', 'Rock', 'Electric'),
    STRUCT(0075, 'Alola', 'Rock', 'Electric'),
    STRUCT(0076, 'Alola', 'Rock', 'Electric'),
    STRUCT(0088, 'Alola', 'Poison', 'Dark'),
    STRUCT(0089, 'Alola', 'Poison', 'Dark'),

    -- GALAR VARIANTS
    STRUCT(0077, 'Galar', 'Psychic', NULL),
    STRUCT(0078, 'Galar', 'Psychic', 'Fairy'),
    STRUCT(0079, 'Galar', 'Psychic', NULL),
    STRUCT(0080, 'Galar', 'Psychic', NULL),
    STRUCT(0083, 'Galar', 'Fighting', 'Flying'),
    STRUCT(0110, 'Galar', 'Poison', 'Fairy'),
    STRUCT(0122, 'Galar', 'Ice', 'Psychic'),
    STRUCT(0144, 'Galar', 'Psychic', 'Flying'),
    STRUCT(0145, 'Galar', 'Fighting', 'Flying'),
    STRUCT(0146, 'Galar', 'Dark', 'Flying'),
    STRUCT(0199, 'Galar', 'Poison', 'Psychic'),
    STRUCT(0222, 'Galar', 'Ghost', NULL),
    STRUCT(0263, 'Galar', 'Dark', 'Normal'),
    STRUCT(0264, 'Galar', 'Dark', 'Normal'),
    STRUCT(0554, 'Galar', 'Ice', NULL),
    STRUCT(0555, 'Galar', 'Ice', NULL),
    STRUCT(0562, 'Galar', 'Ground', 'Ghost'),
    STRUCT(0563, 'Galar', 'Ground', 'Ghost'),
    STRUCT(0618, 'Galar', 'Ground', 'Steel'),
    STRUCT(0863, 'Galar', 'Dark', 'Steel'),


    --HISUI VARIANTS
    STRUCT(0058, 'Hisui', 'Fire', 'Rock'),
    STRUCT(0059, 'Hisui', 'Fire', 'Rock'),
    STRUCT(0100, 'Hisui', 'Electric', 'Grass'),
    STRUCT(0101, 'Hisui', 'Electric', 'Grass'),
    STRUCT(0157, 'Hisui', 'Fire', 'Ghost'),
    STRUCT(0211, 'Hisui', 'Dark', 'Poison'),
    STRUCT(0215, 'Hisui', 'Fighting', 'Poison'),
    STRUCT(0503, 'Hisui', 'Water', 'Dark'),
    STRUCT(0549, 'Hisui', 'Grass', 'Fighting'),
    STRUCT(0570, 'Hisui', 'Normal', 'Ghost'),
    STRUCT(0571, 'Hisui', 'Normal', 'Ghost'),
    STRUCT(0628, 'Hisui', 'Psychic', 'Flying'),
    STRUCT(0705, 'Hisui', 'Steel', 'Dragon'),
    STRUCT(0706, 'Hisui', 'Steel', 'Dragon'),
    STRUCT(0713, 'Hisui', 'Ice', 'Rock'),
    STRUCT(0724, 'Hisui', 'Grass', 'Fighting'),

    
    --PALDEA VARIANTS
    STRUCT(0128, 'Paldea', 'Fighting', NULL),
    STRUCT(0194, 'Paldea', 'Poison', 'Ground'),
    STRUCT(0195, 'Paldea', 'Poison', 'Ground')


  ])
) AS source
ON target.pokedex_number = source.pokedex_number
AND target.variant_region = source.variant_region
WHEN NOT MATCHED THEN
  INSERT(
    pokedex_number,
    variant_region,
    primary_type,
    secondary_type
  )
  VALUES (
    source.pokedex_number,
    source.variant_region,
    source.primary_type,
    source.secondary_type
  );


