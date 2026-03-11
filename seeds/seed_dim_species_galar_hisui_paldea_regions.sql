-- =============================================
-- SEEDING DIM SPECIES LIST
-- Galar, Hisui, Paldea Regions
-- =============================================


MERGE `pokemon-corporate-registry.pogo_corp.dim_species` target
USING ( 
  SELECT * FROM UNNEST ([
    --GALAR REGION
    STRUCT(0823 AS pokedex_number, 'Galar' AS pokemon_region, 'Corviknight' AS pokemon_species, 'Flying' AS primary_type, 'Steel'  AS secondary_type),
    STRUCT(0810, 'Galar', 'Grookey', 'Grass', NULL),
    STRUCT(0811, 'Galar', 'Thwackey', 'Grass', NULL),
    STRUCT(0812, 'Galar', 'Rillaboom', 'Grass', NULL),
    STRUCT(0813, 'Galar', 'Scorbunny', 'Fire', NULL),
    STRUCT(0814, 'Galar', 'Raboot', 'Fire', NULL),
    STRUCT(0815, 'Galar', 'Cinderace', 'Fire', NULL),
    STRUCT(0816, 'Galar', 'Sobble', 'Water', NULL),
    STRUCT(0817, 'Galar', 'Drizzile', 'Water', NULL),
    STRUCT(0818, 'Galar', 'Inteleon', 'Water', NULL),
    STRUCT(0819, 'Galar', 'Skwovet', 'Normal', NULL),

    STRUCT(0820, 'Galar', 'Greedent', 'Normal', NULL),
    STRUCT(0821, 'Galar', 'Rookidee', 'Flying', NULL),
    STRUCT(0822, 'Galar', 'Corvisquire', 'Flying', NULL),
    
    STRUCT(0824, 'Galar', 'Blipbug', 'Bug', NULL),
    STRUCT(0825, 'Galar', 'Dottler', 'Bug', 'Psychic'),
    STRUCT(0826, 'Galar', 'Orbeetle', 'Bug', 'Psychic'),
    STRUCT(0827, 'Galar', 'Nickit', 'Dark', NULL),
    STRUCT(0828, 'Galar', 'Thievul', 'Dark', NULL),
    STRUCT(0829, 'Galar', 'Gossifleur', 'Grass', NULL),

    STRUCT(0830, 'Galar', 'Eldegoss', 'Grass', NULL),
    STRUCT(0831, 'Galar', 'Wooloo', 'Normal', NULL),
    STRUCT(0832, 'Galar', 'Dubwool', 'Normal', NULL),
    STRUCT(0833, 'Galar', 'Chewtle', 'Water', NULL),
    STRUCT(0834, 'Galar', 'Drednaw', 'Water', 'Rock'),
    STRUCT(0835, 'Galar', 'Yamper', 'Electric', NULL),
    STRUCT(0836, 'Galar', 'Boltund', 'Electric', NULL),
    STRUCT(0837, 'Galar', 'Rolycoly', 'Rock', NULL),
    STRUCT(0838, 'Galar', 'Carkol', 'Rock', 'Fire'),
    STRUCT(0839, 'Galar', 'Coalossal', 'Rock', 'Fire'),

    STRUCT(0840, 'Galar', 'Applin', 'Grass', 'Dragon'),
    STRUCT(0841, 'Galar', 'Flapple', 'Grass', 'Dragon'),
    STRUCT(0842, 'Galar', 'Appletun', 'Grass', 'Dragon'),
    STRUCT(0843, 'Galar', 'Silicobra', 'Ground', NULL),
    STRUCT(0844, 'Galar', 'Sandaconda', 'Ground', NULL),
    STRUCT(0845, 'Galar', 'Cramorant', 'Flying', 'Water'),
    STRUCT(0846, 'Galar', 'Arrokuda', 'Water', NULL),
    STRUCT(0847, 'Galar', 'Barraskewda', 'Water', NULL),
    STRUCT(0848, 'Galar', 'Toxel', 'Electric', 'Poison'),
    STRUCT(0849, 'Galar', 'Toxtricity', 'Electric', 'Poison'),

    STRUCT(0850, 'Galar', 'Sizzlipede', 'Fire', 'Bug'),
    STRUCT(0851, 'Galar', 'Centiskorch', 'Fire', 'Bug'),
    STRUCT(0852, 'Galar', 'Clobbopus', 'Fighting', NULL),
    STRUCT(0853, 'Galar', 'Grapploct', 'Fighting', NULL),
    STRUCT(0854, 'Galar', 'Sinistea', 'Ghost', NULL),
    STRUCT(0855, 'Galar', 'Polteageist', 'Ghost', NULL),
    STRUCT(0856, 'Galar', 'Hatenna', 'Psychic', NULL),
    STRUCT(0857, 'Galar', 'Hattrem', 'Psychic', NULL),
    STRUCT(0858, 'Galar', 'Hatterene', 'Psychic', 'Fairy'),
    STRUCT(0859, 'Galar', 'Impidimp', 'Dark', 'Fairy'),

    STRUCT(0860, 'Galar', 'Morgrem', 'Dark', 'Fairy'),
    STRUCT(0861, 'Galar', 'Grimmsnarl', 'Dark', 'Fairy'),
    STRUCT(0862, 'Galar', 'Obstagoon', 'Dark', 'Normal'),
    STRUCT(0863, 'Galar', 'Perrserker', 'Steel', NULL),
    STRUCT(0864, 'Galar', 'Cursola', 'Ghost', NULL),
    STRUCT(0865, 'Galar', "Sirfetch'd", 'Fighting', NULL),
    STRUCT(0866, 'Galar', "Mr. Rime", 'Ice', 'Psychic'),
    STRUCT(0867, 'Galar', 'Runerigus', 'Ground', 'Ghost'),
    STRUCT(0868, 'Galar', 'Milcery', 'Fairy', NULL),
    STRUCT(0869, 'Galar', 'Alcremie', 'Fairy', NULL),

    STRUCT(0870, 'Galar', 'Falinks', 'Fighting', NULL),
    STRUCT(0871, 'Galar', 'Pincurchin', 'Electric', NULL),
    STRUCT(0872, 'Galar', 'Snom', 'Ice', 'Bug'),
    STRUCT(0873, 'Galar', 'Frosmoth', 'Ice', 'Bug'),
    STRUCT(0874, 'Galar', 'Stonjourner', 'Rock', NULL),
    STRUCT(0875, 'Galar', 'Eiscue', 'Ice', NULL),
    STRUCT(0876, 'Galar', 'Indeedee', 'Psychic', 'Normal'),
    STRUCT(0877, 'Galar', 'Morpeko', 'Electric', 'Dark'),
    STRUCT(0878, 'Galar', 'Cufant', 'Steel', NULL),
    STRUCT(0879, 'Galar', 'Copperajah', 'Steel', NULL),

    STRUCT(0880, 'Galar', 'Dracozolt', 'Electric', 'Dragon'),
    STRUCT(0881, 'Galar', 'Arctozolt', 'Electric', 'Ice'),
    STRUCT(0882, 'Galar', 'Dracovish', 'Water', 'Dragon'),
    STRUCT(0883, 'Galar', 'Arctovish', 'Water', 'Ice'),
    STRUCT(0884, 'Galar', 'Duraludon', 'Steel', 'Dragon'),
    STRUCT(0885, 'Galar', 'Dreepy', 'Dragon', 'Ghost'),
    STRUCT(0886, 'Galar', 'Drakloak', 'Dragon', 'Ghost'),
    STRUCT(0887, 'Galar', 'Dragapult', 'Dragon', 'Ghost'),
    STRUCT(0888, 'Galar', 'Zacian', 'Fairy', NULL),
    STRUCT(0889, 'Galar', 'Zamazenta', 'Fighting', NULL),

    STRUCT(0890, 'Galar', 'Eternatus', 'Poison', 'Dragon'),
    STRUCT(0891, 'Galar', 'Kubfu', 'Fighting', NULL),
    STRUCT(0892, 'Galar', 'Urshifu', 'Fighting', 'Dark'),
    STRUCT(0893, 'Galar', 'Zarude', 'Dark', 'Grass'),
    STRUCT(0894, 'Galar', 'Regieleki', 'Electric', NULL),
    STRUCT(0895, 'Galar', 'Regidrago', 'Dragon', NULL),
    STRUCT(0896, 'Galar', 'Glastrier', 'Ice', NULL),
    STRUCT(0897, 'Galar', 'Spectrier', 'Ghost', NULL),





    --HISUI REGION
    STRUCT(0898, 'Hisui', 'Calyrex', 'Psychic', 'Grass'),
    STRUCT(0899, 'Hisui', 'Wyrdeer', 'Normal', 'Psychic'),

    STRUCT(0900, 'Hisui', 'Kleavor', 'Bug', 'Rock'),
    STRUCT(0901, 'Hisui', 'Ursaluna', 'Ground', 'Normal'),
    STRUCT(0902, 'Hisui', 'Basculegion', 'Water', 'Ghost'),
    STRUCT(0903, 'Hisui', 'Sneasler', 'Fighting', 'Poison'),
    STRUCT(0904, 'Hisui', 'Overqwil', 'Dark', 'Poison'),
    STRUCT(0905, 'Hisui', 'Enamorus', 'Fairy', 'Flying'),


    --PALDEA REGION
    STRUCT(0906, 'Paldea', 'Sprigatito', 'Grass', NULL),
    STRUCT(0907, 'Paldea', 'Floragato', 'Grass', NULL),
    STRUCT(0908, 'Paldea', 'Meowscarada', 'Grass', 'Dark'),
    STRUCT(0909, 'Paldea', 'Fuecoco', 'Fire', NULL),
    
    STRUCT(0910, 'Paldea', 'Crocalor', 'Fire', NULL),
    STRUCT(0911, 'Paldea', 'Skeledirge', 'Fire', 'Ghost'),
    STRUCT(0912, 'Paldea', 'Quaxly', 'Water', NULL),
    STRUCT(0913, 'Paldea', 'Quaxwell', 'Water', NULL),
    STRUCT(0914, 'Paldea', 'Quaquaval', 'Water', 'Fighting'),
    STRUCT(0915, 'Paldea', 'Lechonk', 'Normal', NULL),
    STRUCT(0916, 'Paldea', 'Oinkologne', 'Normal', NULL),
    STRUCT(0917, 'Paldea', 'Tarountula', 'Bug', NULL),
    STRUCT(0918, 'Paldea', 'Spidops', 'Bug', NULL),
    STRUCT(0919, 'Paldea', 'Nymble', 'Bug', NULL),

    STRUCT(0920, 'Paldea', 'Lokix', 'Bug', 'Dark'),
    STRUCT(0921, 'Paldea', 'Pawmi', 'Electric', NULL),
    STRUCT(0922, 'Paldea', 'Pawmo', 'Electric', 'Fighting'),
    STRUCT(0923, 'Paldea', 'Pawmot', 'Electric', 'Fighting'),
    STRUCT(0924, 'Paldea', 'Tandemaus', 'Normal', NULL),
    STRUCT(0925, 'Paldea', 'Maushold', 'Normal', NULL),
    STRUCT(0926, 'Paldea', 'Fidough', 'Fairy', NULL),
    STRUCT(0927, 'Paldea', 'Dachsbun', 'Fairy', NULL),
    STRUCT(0928, 'Paldea', 'Smoliv', 'Grass', 'Normal'),
    STRUCT(0929, 'Paldea', 'Dolliv', 'Grass', 'Normal'),

    STRUCT(0930, 'Paldea', 'Arboliva', 'Grass', 'Normal'),
    STRUCT(0931, 'Paldea', 'Squawkabilly', 'Normal', 'Flying'),
    STRUCT(0932, 'Paldea', 'Nacli', 'Rock', NULL),
    STRUCT(0933, 'Paldea', 'Naclstack', 'Rock', NULL),
    STRUCT(0934, 'Paldea', 'Garganacl', 'Rock', NULL),
    STRUCT(0935, 'Paldea', 'Charcadet', 'Fire', NULL),
    STRUCT(0936, 'Paldea', 'Armarouge', 'Fire', 'Psychic'),
    STRUCT(0937, 'Paldea', 'Ceruledge', 'Fire', 'Ghost'),
    STRUCT(0938, 'Paldea', 'Tadbulb', 'Electric', NULL),
    STRUCT(0939, 'Paldea', 'Bellibolt', 'Electric', NULL),

    STRUCT(0940, 'Paldea', 'Wattrel', 'Electric', 'Flying'),
    STRUCT(0941, 'Paldea', 'Kilowattrel', 'Electric', 'Flying'),
    STRUCT(0942, 'Paldea', 'Maschiff', 'Dark', NULL),
    STRUCT(0943, 'Paldea', 'Mabosstiff', 'Dark', NULL),
    STRUCT(0944, 'Paldea', 'Shroodle', 'Poison', 'Normal'),
    STRUCT(0945, 'Paldea', 'Grafaiai', 'Poison', 'Normal'),
    STRUCT(0946, 'Paldea', 'Bramblin', 'Grass', 'Ghost'),
    STRUCT(0947, 'Paldea', 'Brambleghast', 'Grass', 'Ghost'),
    STRUCT(0948, 'Paldea', 'Toedscool', 'Ground', 'Grass'),
    STRUCT(0949, 'Paldea', 'Toedscruel', 'Ground', 'Grass'),

    STRUCT(0950, 'Paldea', 'Klawf', 'Rock', NULL),
    STRUCT(0951, 'Paldea', 'Capsakid', 'Grass', NULL),
    STRUCT(0952, 'Paldea', 'Scovillain', 'Grass', 'Fire'),
    STRUCT(0953, 'Paldea', 'Rellor', 'Bug', NULL),
    STRUCT(0954, 'Paldea', 'Rabsca', 'Bug', 'Psychic'),
    STRUCT(0955, 'Paldea', 'Flittle', 'Psychic', NULL),
    STRUCT(0956, 'Paldea', 'Espathra', 'Psychic', NULL),
    STRUCT(0957, 'Paldea', 'Tinkatink', 'Fairy', 'Steel'),
    STRUCT(0958, 'Paldea', 'Tinkatuff', 'Fairy', 'Steel'),
    STRUCT(0959, 'Paldea', 'Tinkaton', 'Fairy', 'Steel'),

    STRUCT(0960, 'Paldea', 'Wiglett', 'Water', NULL),
    STRUCT(0961, 'Paldea', 'Wugtrio', 'Water', NULL),
    STRUCT(0962, 'Paldea', 'Bombirdier', 'Flying', 'Dark'),
    STRUCT(0963, 'Paldea', 'Finizen', 'Water', NULL),
    STRUCT(0964, 'Paldea', 'Palafin', 'Water', NULL),
    STRUCT(0965, 'Paldea', 'Varoom', 'Steel', 'Poison'),
    STRUCT(0966, 'Paldea', 'Revavroom', 'Steel', 'Poison'),
    STRUCT(0967, 'Paldea', 'Cyclizar', 'Dragon', 'Normal'),
    STRUCT(0968, 'Paldea', 'Orthworm', 'Steel', NULL),
    STRUCT(0969, 'Paldea', 'Glimmet', 'Rock', 'Poison'),

    STRUCT(0970, 'Paldea', 'Glimmora', 'Rock', 'Poison'),
    STRUCT(0971, 'Paldea', 'Greavard', 'Ghost', NULL),
    STRUCT(0972, 'Paldea', 'Houndstone', 'Ghost', NULL),
    STRUCT(0973, 'Paldea', 'Flamigo', 'Flying', 'Fighting'),
    STRUCT(0974, 'Paldea', 'Cetoddle', 'Ice', NULL),
    STRUCT(0975, 'Paldea', 'Cetitan', 'Ice', NULL),
    STRUCT(0976, 'Paldea', 'Veluza', 'Water', 'Psychic'),
    STRUCT(0977, 'Paldea', 'Dondozo', 'Water', NULL),
    STRUCT(0978, 'Paldea', 'Tatsugiri', 'Dragon', 'Water'),
    STRUCT(0979, 'Paldea', 'Annihilape', 'Fighting', 'Ghost'),

    STRUCT(0980, 'Paldea', 'Clodsire', 'Poison', 'Ground'),
    STRUCT(0981, 'Paldea', 'Farigiraf', 'Normal', 'Psychic'),
    STRUCT(0982, 'Paldea', 'Dudunsparce', 'Normal', NULL),
    STRUCT(0983, 'Paldea', 'Kingambit', 'Dark', 'Steel'),
    STRUCT(0984, 'Paldea', 'Great Tusk', 'Ground', 'Fighting'),
    STRUCT(0985, 'Paldea', 'Scream Tail', 'Fairy', 'Psychic'),
    STRUCT(0986, 'Paldea', 'Brute Bonnet', 'Grass', 'Dark'),
    STRUCT(0987, 'Paldea', 'Flutter Mane', 'Ghost', 'Fairy'),
    STRUCT(0988, 'Paldea', 'Slither Wing', 'Bug', 'Fighting'),
    STRUCT(0989, 'Paldea', 'Sandy Shocks', 'Electric', 'Ground'),

    STRUCT(0990, 'Paldea', 'Iron Treads', 'Ground', 'Steel'),
    STRUCT(0991, 'Paldea', 'Iron Bundle', 'Ice', 'Water'),
    STRUCT(0992, 'Paldea', 'Iron Hands', 'Fighting', 'Electric'),
    STRUCT(0993, 'Paldea', 'Iron Jugulis', 'Dark', 'Flying'),
    STRUCT(0994, 'Paldea', 'Iron Moth', 'Fire', 'Poison'),
    STRUCT(0995, 'Paldea', 'Iron Thorns', 'Rock', 'Electric'),
    STRUCT(0996, 'Paldea', 'Frigibax', 'Dragon', 'Ice'),
    STRUCT(0997, 'Paldea', 'Arctibax', 'Dragon', 'Ice'),
    STRUCT(0998, 'Paldea', 'Baxcalibur', 'Dragon', 'Ice'),
    STRUCT(0999, 'Paldea', 'Gimmighoul', 'Ghost', NULL),

    STRUCT(1000, 'Paldea', 'Gholdengo', 'Steel', 'Ghost'),
    STRUCT(1001, 'Paldea', "Wo-Chien", 'Dark', 'Grass'),
    STRUCT(1002, 'Paldea', "Chien-Pao", 'Dark', 'Ice'),
    STRUCT(1003, 'Paldea', "Ting-Lu", 'Dark', 'Ground'),
    STRUCT(1004, 'Paldea', "Chi-Yu", 'Dark', 'Fire'),
    STRUCT(1005, 'Paldea', 'Roaring Moon', 'Dragon', 'Dark'),
    STRUCT(1006, 'Paldea', 'Iron Valiant', 'Fairy', 'Fighting'),
    STRUCT(1007, 'Paldea', 'Koraidon', 'Fighting', 'Dragon'),
    STRUCT(1008, 'Paldea', 'Miraidon', 'Electric', 'Dragon'),
    STRUCT(1009, 'Paldea', 'Walking Wake', 'Water', 'Dragon'),

    STRUCT(1010, 'Paldea', 'Iron Leaves', 'Grass', 'Psychic'),
    STRUCT(1011, 'Paldea', 'Dipplin', 'Grass', 'Dragon'),
    STRUCT(1012, 'Paldea', 'Poltchageist', 'Grass', 'Ghost'),
    STRUCT(1013, 'Paldea', 'Sinistcha', 'Grass', 'Ghost'),
    STRUCT(1014, 'Paldea', 'Okidogi', 'Poison', 'Fighting'),
    STRUCT(1015, 'Paldea', 'Munkidori', 'Poison', 'Psychic'),
    STRUCT(1016, 'Paldea', 'Fezandipiti', 'Poison', 'Fairy'),
    STRUCT(1017, 'Paldea', 'Ogerpon', 'Grass', NULL),
    STRUCT(1018, 'Paldea', 'Archaludon', 'Steel', 'Dragon'),
    STRUCT(1019, 'Paldea', 'Hydrapple', 'Grass', 'Dragon'),

    STRUCT(1020, 'Paldea', 'Gouging Fire', 'Fire', 'Dragon'),
    STRUCT(1021, 'Paldea', 'Raging Bolt', 'Electric', 'Dragon'),
    STRUCT(1022, 'Paldea', 'Iron Boulder', 'Rock', 'Psychic'),
    STRUCT(1023, 'Paldea', 'Iron Crown', 'Steel', 'Psychic'),
    STRUCT(1024, 'Paldea', 'Terapagos', 'Normal', NULL),
    STRUCT(1025, 'Paldea', 'Pecharunt', 'Poison', 'Ghost')

  ])
) AS source
ON target.pokedex_number = source.pokedex_number
AND target.pokemon_region = source.pokemon_region

WHEN NOT MATCHED THEN
INSERT (
  pokedex_number, pokemon_region, pokemon_species, primary_type, secondary_type
)
VALUES (
  source.pokedex_number, source.pokemon_region, source.pokemon_species, source.primary_type, source.secondary_type
);

