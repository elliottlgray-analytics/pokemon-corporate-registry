-- =================================================
-- =================================================
-- SEEDING POKEMON EVOLUTION CHAINS
-- =================================================
-- Using MERGE instead of INSERT for rerun proofing
-- =================================================
-- =================================================


-- =================================================
-- 1.Seeding linear evolution chains
-- =================================================

MERGE `pokemon-corporate-registry.pogo_corp.dim_evolution_chain` T
USING (
  SELECT 'Pawmi' AS from_species, 'Pawmo' AS to_species UNION ALL
  SELECT 'Pawmo', 'Pawmot'
) S
ON T.from_species = S.from_species AND T.to_species = S.to_species
WHEN NOT MATCHED THEN
  INSERT (from_species, to_species) VALUES (S.from_species, S.to_species);

MERGE `pokemon-corporate-registry.pogo_corp.dim_evolution_chain` T
USING (
  SELECT 'Bulbasaur' AS from_species, 'Ivysaur' AS to_species UNION ALL
  SELECT 'Ivysaur', 'Venusaur' UNION ALL

  SELECT 'Charmander', 'Charmeleon' UNION ALL
  SELECT 'Charmeleon', 'Charizard' UNION ALL

  SELECT 'Pichu', 'Pikachu' UNION ALL
  SELECT 'Pikachu', 'Raichu' UNION ALL

  SELECT 'Caterpie', 'Metapod' UNION ALL
  SELECT 'Metapod', 'Butterfree' UNION ALL

  SELECT 'Weedle', 'Kakuna' UNION ALL
  SELECT 'Kakuna', 'Beedrill' UNION ALL

  SELECT 'Pidgey', 'Pidgeotto' UNION ALL
  SELECT 'Pidgeotto', 'Pidgeot' UNION ALL

  SELECT 'Rattata', 'Raticate' UNION ALL

  SELECT'Spearow', 'Fearow' UNION ALL

  SELECT 'Ekans', 'Arbok' UNION ALL

  SELECT 'Sandshrew', 'Sandslash' UNION ALL


  SELECT 'Cleffa', 'Clefairy' UNION ALL
  SELECT 'Clefairy', 'Clefable' UNION ALL

  SELECT 'Vulpix', 'Ninetales' UNION ALL

  SELECT 'Igglybuff', 'Jigglypuff' UNION ALL
  SELECT 'Jigglypuff', 'Wigglytuff' UNION ALL

  SELECT 'Zubat', 'Golbat' UNION ALL
  SELECT 'Golbat', 'Crobat' UNION ALL

  SELECT 'Squirtle', 'Wartortle' UNION ALL
  SELECT 'Wartortle', 'Blastoise' 
  ) S
ON T.from_species = S.from_species AND T.to_species = S.to_species
WHEN NOT MATCHED THEN
  INSERT (from_species, to_species) VALUES (S.from_species, S.to_species);


MERGE `pokemon-corporate-registry.pogo_corp.dim_evolution_chain` AS target
USING (
  SELECT * FROM UNNEST([
    STRUCT ('Paras' AS from_species, 'Parasect' AS to_species),
    STRUCT ('Venonat', 'Venomoth'),
    STRUCT ('Diglett', 'Dugtrio'),
    STRUCT ('Mankey', 'Primeape'),STRUCT('Primeape', 'Annihilape'),
    STRUCT ('Growlithe', 'Arcanine'),
    STRUCT ('Abra', 'Kadabra'), STRUCT ('Kadabra', 'Alakazam'),
    STRUCT ('Machop', 'Machoke'), STRUCT ('Machoke', 'Machamp'),
    STRUCT ('Bellsprout', 'Weepinbell'), STRUCT ('Weepinbell', 'Victreebel'),
    STRUCT ('Tentacool', 'Tentacruel'),
    STRUCT ('Geodude', 'Graveler'), STRUCT ('Graveler', 'Golem'),
    STRUCT ('Magnemite', 'Magneton'),STRUCT ('Magneton', 'Magnezone'),
    STRUCT ('Doduo', 'Dodrio'),
    STRUCT ('Seel', 'Dewgong'),
    STRUCT ('Grimer', 'Muk'),
    STRUCT ('Shellder', 'Cloyster'),
    STRUCT ('Gastly', 'Haunter'), STRUCT ('Haunter', 'Gengar'),
    STRUCT ('Onix', 'Steelix'),
    STRUCT ('Drowzee', 'Hypno'),
    STRUCT ('Krabby', 'Kingler'),
    STRUCT ('Voltorb', 'Electrode'),
    STRUCT ('Exeggcute', 'Exeggutor'),
    STRUCT ('Cubone', 'Marowak'),
    STRUCT ('Meowth', 'Persian'),
    STRUCT ('Lickitung', 'Lickilicky'),
    STRUCT ('Koffing', 'Weezing'),
    STRUCT ('Rhyhorn', 'Rhydon'), STRUCT ('Rhydon', 'Rhyperior'),
    STRUCT ('Happiny', 'Chansey'), STRUCT ('Chansey', 'Blissey'),
    STRUCT ('Tangela', 'Tangrowth'),
    STRUCT ('Horsea', 'Seadra'), STRUCT ('Seadra', 'Kingdra'),
    STRUCT ('Goldeen', 'Seaking'),
    STRUCT ('Staryu', 'Starmie'),
    STRUCT ('Scyther', 'Scizor'),
    STRUCT ('Smoochum', 'Jynx'),
    STRUCT ('Elekid', 'Electabuzz'), STRUCT ('Electabuzz', 'Electivire'),
    STRUCT ('Magby', 'Magmar'), STRUCT ('Magmar', 'Magmortar'),
    STRUCT ('Magikarp', 'Gyarados'),
    STRUCT ('Porygon', 'Porygon2'), STRUCT ('Porygon2', 'Porygon-Z'),
    STRUCT ('Omanyte', 'Omastar'),
    STRUCT ('Kabuto', 'Kabutops'),
    STRUCT ('Munchlax', 'Snorlax'),
    STRUCT ('Dratini', 'Dragonair'), STRUCT ('Dragonair', 'Dragonite'),
    STRUCT ('Chikorita', 'Bayleef'), STRUCT ('Bayleef', 'Meganium'),
    STRUCT ('Cyndaquil', 'Quilava'), STRUCT ('Quilava', 'Typhlosion'),
    STRUCT ('Totodile', 'Croconaw'), STRUCT ('Croconaw', 'Feraligatr'),
    STRUCT ('Sentret', 'Furret'),
    STRUCT ('Hoothoot', 'Noctowl'),
    STRUCT ('Ledyba', 'Ledian'),
    STRUCT ('Spinarak', 'Ariados'),
    STRUCT ('Chinchou', 'Lanturn'),
    STRUCT ('Togepi', 'Togetic'), STRUCT ('Togetic', 'Togekiss'),
    STRUCT ('Natu', 'Xatu'),
    STRUCT ('Mareep', 'Flaaffy'), STRUCT ('Flaaffy', 'Ampharos'),
    STRUCT ('Azurill', 'Marill'), STRUCT ('Marill', 'Azumarill'),
    STRUCT ('Bonsly', 'Sudowoodo'),
    STRUCT ('Hoppip', 'Skiploom'), STRUCT ('Skiploom', 'Jumpluff'),
    STRUCT ('Aipom', 'Ambipom'),
    STRUCT ('Sunkern', 'Sunflora'),
    STRUCT ('Yanma', 'Yanmega'),
    STRUCT ('Wooper', 'Quagsire'),
    STRUCT ('Murkrow', 'Honchkrow'),
    STRUCT ('Misdreavus', 'Mismagius'),
    STRUCT ('Wynaut', 'Wobbuffet'),
    STRUCT ('Pineco', 'Forretress'),
    STRUCT ('Gligar', 'Gliscor'),
    STRUCT ('Snubbull', 'Granbull'),
    STRUCT ('Sneasel', 'Weavile'),
    STRUCT ('Teddiursa', 'Ursaring'),STRUCT ('Ursaring', 'Ursaluna'),
    STRUCT ('Slugma', 'Magcargo'),
    STRUCT ('Swinub', 'Piloswine'),STRUCT ('Piloswine', 'Mamoswine'),
    STRUCT ('Remoraid', 'Octillery'),
    STRUCT ('Mantyke', 'Mantine'),
    STRUCT ('Houndour', 'Houndoom'),
    STRUCT ('Phanpy', 'Donphan'),
    STRUCT ('Larvitar', 'Pupitar'),STRUCT ('Pupitar', 'Tyranitar'),
    STRUCT ('Treecko', 'Grovyle'),STRUCT ('Grovyle', 'Sceptile'),
    STRUCT ('Torchic', 'Combusken'),STRUCT ('Combusken', 'Blaziken'),
    STRUCT ('Mudkip', 'Marshtomp'),STRUCT ('Marshtomp', 'Swampert'),
    STRUCT ('Poochyena', 'Mightyena'),
    STRUCT ('Zigzagoon', 'Linoone'),
    STRUCT ('Lotad', 'Lombre'),STRUCT ('Lombre', 'Ludicolo'),
    STRUCT ('Seedot', 'Nuzleaf'),STRUCT ('Nuzleaf', 'Shiftry'),
    STRUCT ('Taillow', 'Swellow'),
    STRUCT ('Wingull', 'Pelipper'),
    STRUCT ('Surskit', 'Masquerain'),
    STRUCT ('Shroomish', 'Breloom'),
    STRUCT ('Slakoth', 'Vigoroth'),STRUCT ('Vigoroth', 'Slaking'),
    STRUCT ('Nincada', 'Ninjask'),
    STRUCT ('Whismur', 'Loudred'),STRUCT ('Loudred', 'Exploud'),
    STRUCT ('Makuhita', 'Hariyama'),
    STRUCT ('Nosepass', 'Probopass'),
    STRUCT ('Skitty', 'Delcatty'),
    STRUCT ('Aron', 'Lairon'),STRUCT ('Lairon', 'Aggron'),
    STRUCT ('Meditite', 'Medicham'),
    STRUCT ('Electrike', 'Manectric'),
    STRUCT ('Budew', 'Roselia'),STRUCT ('Roselia', 'Roserade'),
    STRUCT ('Gulpin', 'Swalot'),
    STRUCT ('Carvanha', 'Sharpedo'),
    STRUCT ('Wailmer', 'Wailord'),
    STRUCT ('Numel', 'Camerupt'),
    STRUCT ('Spoink', 'Grumpig'),
    STRUCT ('Trapinch', 'Vibrava'),STRUCT ('Vibrava', 'Flygon'),
    STRUCT ('Cacnea', 'Cacturne'),
    STRUCT ('Swablu', 'Altaria'),
    STRUCT ('Barboach', 'Whiscash'),
    STRUCT ('Corphish', 'Crawdaunt'),
    STRUCT ('Baltoy', 'Claydol'),
    STRUCT ('Lileep', 'Cradily'),
    STRUCT ('Anorith', 'Armaldo'),
    STRUCT ('Feebas', 'Milotic'),
    STRUCT ('Shuppet', 'Banette'),
    STRUCT ('Duskull', 'Dusclops'),STRUCT ('Dusclops', 'Dusknoir'),
    STRUCT ('Chingling', 'Chimecho'),
    STRUCT ('Spheal', 'Sealeo'),STRUCT ('Sealeo', 'Walrein'),
    STRUCT ('Bagon', 'Shelgon'),STRUCT ('Shelgon', 'Salamence'),
    STRUCT ('Beldum', 'Metang'),STRUCT ('Metang', 'Metagross'),
    STRUCT ('Turtwig', 'Grotle'),STRUCT ('Grotle', 'Torterra'),
    STRUCT ('Chimchar', 'Monferno'),STRUCT ('Monferno', 'Infernape'),
    STRUCT ('Piplup', 'Prinplup'),STRUCT ('Prinplup', 'Empoleon'),
    STRUCT ('Starly', 'Staravia'),STRUCT ('Staravia', 'Staraptor'),
    STRUCT ('Bidoof', 'Bibarel'),
    STRUCT ('Kricketot', 'Kricketune'),
    STRUCT ('Shinx', 'Luxio'),STRUCT ('Luxio', 'Luxray'),
    STRUCT ('Cranidos', 'Rampardos'),
    STRUCT ('Shieldon', 'Bastiodon'),
    STRUCT ('Combee', 'Vespiquen'),
    STRUCT ('Buizel', 'Floatzel'),
    STRUCT ('Cherubi', 'Cherrim'),
    STRUCT ('Shellos', 'Gastrodon'),
    STRUCT ('Drifloon', 'Drifblim'),
    STRUCT ('Buneary', 'Lopunny'),
    STRUCT ('Glameow', 'Purugly'),
    STRUCT ('Stunky', 'Skuntank'),
    STRUCT ('Bronzor', 'Bronzong'),
    STRUCT ('Gible', 'Gabite'),STRUCT ('Gabite', 'Garchomp'),
    STRUCT ('Riolu', 'Lucario'),
    STRUCT ('Hippopotas', 'Hippowdon'),
    STRUCT ('Skorupi', 'Drapion'),
    STRUCT ('Croagunk', 'Toxicroak'),
    STRUCT ('Finneon', 'Lumineon'),
    STRUCT ('Snover', 'Abomasnow'),
    STRUCT ('Snivy', 'Servine'),STRUCT ('Servine', 'Serperior'),
    STRUCT ('Tepig', 'Pignite'),STRUCT ('Pignite', 'Emboar'),
    STRUCT ('Oshawott', 'Dewott'),STRUCT ('Dewott', 'Samurott'),
    STRUCT ('Patrat', 'Watchog'),
    STRUCT ('Lillipup', 'Herdier'),STRUCT ('Herdier', 'Stoutland'),
    STRUCT ('Purrloin', 'Liepard'),
    STRUCT ('Pansage', 'Simisage'),
    STRUCT ('Pansear', 'Simisear'),
    STRUCT ('Panpour', 'Simipour'),
    STRUCT ('Munna', 'Musharna'),
    STRUCT ('Pidove', 'Tranquill'),STRUCT ('Tranquill', 'Unfezant'),
    STRUCT ('Blitzle', 'Zebstrika'),
    STRUCT ('Roggenrola', 'Boldore'),STRUCT ('Boldore', 'Gigalith'),
    STRUCT ('Woobat', 'Swoobat'),
    STRUCT ('Drilbur', 'Excadrill'),
    STRUCT ('Timburr', 'Gurdurr'),STRUCT ('Gurdurr', 'Conkeldurr'),
    STRUCT ('Tympole', 'Palpitoad'), STRUCT('Palpitoad', 'Seismitoad'),
    STRUCT ('Sewaddle', 'Swadloon'), STRUCT ('Swadloon', 'Leavanny'),
    STRUCT ('Venipede', 'Whirlipede'),STRUCT ('Whirlipede', 'Scolipede'),
    STRUCT ('Cottonee', 'Whimsicott'),
    STRUCT ('Sandile', 'Krokorok'),STRUCT ('Krokorok', 'Krookodile'),
    STRUCT ('Darumaka', 'Darmanitan'),
    STRUCT ('Dwebble', 'Crustle'),
    STRUCT ('Scraggy', 'Scrafty'),
    STRUCT ('Yamask', 'Cofagrigus'),
    STRUCT ('Tirtouga', 'Carracosta'),
    STRUCT ('Archen', 'Archeops'),
    STRUCT ('Trubbish', 'Garbodor'),
    STRUCT ('Zorua', 'Zoroark'),
    STRUCT ('Minccino', 'Cinccino'),
    STRUCT ('Gothita', 'Gothorita'),STRUCT ('Gothorita', 'Gothitelle'),
    STRUCT ('Solosis', 'Duosion'),STRUCT ('Duosion', 'Reuniclus'),
    STRUCT ('Ducklett', 'Swanna'),
    STRUCT ('Vanillite', 'Vanillish'),STRUCT ('Vanillish', 'Vanilluxe'),
    STRUCT ('Deerling', 'Sawsbuck'),
    STRUCT ('Karrablast', 'Escavalier'),
    STRUCT ('Foongus', 'Amoonguss'),
    STRUCT ('Frillish', 'Jellicent'),
    STRUCT ('Joltik', 'Galvantula'),
    STRUCT ('Ferroseed', 'Ferrothorn'),
    STRUCT ('Klink', 'Klang'),STRUCT ('Klang', 'Klinklang'),
    STRUCT ('Tynamo', 'Eelektrik'),STRUCT ('Eelektrik', 'Eelektross'),
    STRUCT ('Elgyem', 'Beheeyem'),
    STRUCT ('Litwick', 'Lampent'),STRUCT ('Lampent', 'Chandelure'),
    STRUCT ('Axew', 'Fraxure'),STRUCT ('Fraxure', 'Haxorus'),
    STRUCT ('Cubchoo', 'Beartic'),
    STRUCT ('Shelmet', 'Accelgor'),
    STRUCT ('Mienfoo', 'Mienshao'),
    STRUCT ('Golett', 'Golurk'),
    STRUCT ('Pawniard', 'Bisharp'),
    STRUCT ('Rufflet', 'Braviary'),
    STRUCT ('Vullaby', 'Mandibuzz'),
    STRUCT ('Deino', 'Zweilous'),STRUCT ('Zweilous', 'Hydreigon'),
    STRUCT ('Larvesta', 'Volcarona'),
    STRUCT ('Chespin', 'Quilladin'),STRUCT ('Quilladin', 'Chesnaught'),
    STRUCT ('Fennekin', 'Braixen'),STRUCT ('Braixen', 'Delphox'),
    STRUCT ('Froakie', 'Frogadier'),STRUCT ('Frogadier', 'Greninja'),
    STRUCT ('Bunnelby', 'Diggersby'),
    STRUCT ('Fletchling', 'Fletchinder'),STRUCT ('Fletchinder', 'Talonflame'),
    STRUCT ('Litleo', 'Pyroar'),
    STRUCT ('Flabebe', 'Floette'),STRUCT ('Floette', 'Florges'),
    STRUCT ('Skiddo', 'Gogoat'),
    STRUCT ('Pancham', 'Pangoro'),
    STRUCT ('Espurr', 'Meowstic'),
    STRUCT ('Honedge', 'Doublade'),STRUCT ('Doublade', 'Aegislash'),
    STRUCT ('Spritzee', 'Aromatisse'),
    STRUCT ('Swirlix', 'Slurpuff'),
    STRUCT ('Inkay', 'Malamar'),
    STRUCT ('Binacle', 'Barbaracle'),
    STRUCT ('Skrelp', 'Dragalge'),
    STRUCT ('Clauncher', 'Clawitzer'),
    STRUCT ('Helioptile', 'Heliolisk'),
    STRUCT ('Tyrunt', 'Tyrantrum'),
    STRUCT ('Amaura', 'Aurorus'),
    STRUCT ('Goomy', 'Sliggoo'),STRUCT ('Sliggoo', 'Goodra'),
    STRUCT ('Phantump', 'Trevenant'),
    STRUCT ('Pumpkaboo', 'Gourgeist'),
    STRUCT ('Burgmite', 'Avalugg'),
    STRUCT ('Noibat', 'Noivern'),
    STRUCT ('Rowlet', 'Dartrix'),STRUCT ('Dartrix', 'Decidueye'),
    STRUCT ('Litten', 'Torracat'),STRUCT ('Torracat', 'Incineroar'),
    STRUCT ('Popplio', 'Brionne'),STRUCT ('Brionne', 'Primarina'),
    STRUCT ('Pikipek', 'Thrumbeak'),STRUCT ('Thrumbeak', 'Toucannon'),
    STRUCT ('Yungoos', 'Gumshoos'),
    STRUCT ('Grubbin', 'Charjabug'),STRUCT ('Charjabug', 'Vikavolt'),
    STRUCT ('Crabrawler', 'Crabominable'),
    STRUCT ('Cutiefly', 'Ribombee'),
    STRUCT ('Rockruff', 'Lycanroc'),
    STRUCT ('Mareanie', 'Toxapex'),
    STRUCT ('Mudbray', 'Mudsdale'),
    STRUCT ('Dewpider', 'Araquanid'),
    STRUCT ('Fomantis', 'Lurantis'),
    STRUCT ('Morelull', 'Shiinotic'),
    STRUCT ('Salandit', 'Salazzle'),
    STRUCT ('Stufful', 'Bewear'),
    STRUCT ('Bounsweet', 'Steenee'),STRUCT ('Steenee', 'Tsareena'),
    STRUCT ('Wimpod', 'Golisopod'),
    STRUCT ('Sandygast', 'Palossand'),
    STRUCT ('Jangmo-o', 'Hakamo-o'),STRUCT ('Hakamo-o', 'Kommo-o'),
    STRUCT ('Poipole', 'Naganadel'),
    STRUCT ('Meltan', 'Melmetal'),
    STRUCT ('Grookey', 'Thwackey'),STRUCT ('Thwackey', 'Rillaboom'),
    STRUCT ('Scorbunny', 'Raboot'),STRUCT ('Raboot', 'Cinderace'),
    STRUCT ('Sobble', 'Drizzile'),STRUCT ('Drizzile', 'Inteleon'),
    STRUCT ('Skwovet', 'Greedent'),
    STRUCT ('Rookidee', 'Corvisquire'),STRUCT ('Corvisquire', 'Corviknight'),
    STRUCT ('Blipbug', 'Dottler'),STRUCT ('Dottler', 'Orbeetle'),
    STRUCT ('Nickit', 'Thievul'),
    STRUCT ('Gossifleur', 'Eldegoss'),
    STRUCT ('Wooloo', 'Dubwool'),
    STRUCT ('Chewtle', 'Drednaw'),
    STRUCT ('Yamper', 'Boltund'),
    STRUCT ('Rolycoly', 'Carkol'),STRUCT ('Carkol', 'Coalossal'),
    STRUCT ('Silicobra', 'Sandaconda'),
    STRUCT ('Arrokuda', 'Barraskewda'),
    STRUCT ('Toxel', 'Toxtricity'),
    STRUCT ('Sizzlipede', 'Centiskorch'),
    STRUCT ('Clobbopus', 'Grapploct'),
    STRUCT ('Sinistea', 'Polteageist'),
    STRUCT ('Hatenna', 'Hattrem'),STRUCT ('Hattrem', 'Hatterene'),
    STRUCT ('Impidimp', 'Morgrem'),STRUCT ('Morgrem', 'Grimmsnarl'),
    STRUCT ('Linoone', 'Obstagoon'), --This goes with 'Zigzagoon' above, they were listed twice on pokemon.gameinfo.io--
    STRUCT ('Corsola', 'Cursola'),
    STRUCT ('Yamask', 'Runerigus'),
    STRUCT ('Milcery', 'Alcremie'),
    STRUCT ('Snom', 'Frosmoth'),
    STRUCT ('Cufant', 'Copperajah'),
    STRUCT ('Dreepy', 'Drakloak'),STRUCT ('Drakloak', 'Dragapult'),
    STRUCT ('Sneasel', 'Sneasler'),
    STRUCT ('Qwilfish', 'Overqwil'),
    STRUCT ('Sprigatito', 'Floragato'),STRUCT ('Floragato', 'Meowscarada'),
    STRUCT ('Fuecoco', 'Crocalor'),STRUCT ('Crocalor', 'Skeledirge'),
    STRUCT ('Quaxly', 'Quaxwell'),STRUCT ('Quaxwell', 'Quaquaval'),
    STRUCT ('Lechonk', 'Oinkologne'),
    STRUCT ('Tarountula', 'Spidops'),
    STRUCT ('Nymble', 'Lokix'),
    STRUCT ('Pawmi', 'Pawmo'),STRUCT ('Pawmo', 'Pawmot'), --Same evolution included in different syntax earlier to test redundancy parameters
    STRUCT ('Tandemaus', 'Maushold'),
    STRUCT ('Fidough', 'Dachsbun'),
    STRUCT ('Smoliv', 'Doliv'),STRUCT ('Doliv', 'Arboliva'),
    STRUCT ('Nacli', 'Naclstack'),STRUCT ('Naclstack', 'Garganacl'),
    STRUCT ('Tadbulb', 'Bellibolt'),
    STRUCT ('Wattrel', 'Kilowattrel'),
    STRUCT ('Maschiff', 'Masbosstiff'),
    STRUCT ('Shroodle', 'Grafaifai'),
    STRUCT ('Bramblin', 'Brambleghast'),
    STRUCT ('Toedscool', 'Toedscruel'),
    STRUCT ('Capsakid', 'Scovillain'),
    STRUCT ('Rellor', 'Rabsca'),
    STRUCT ('Flittle', 'Espathra'),
    STRUCT ('Tinkatink', 'Tinkatuff'),STRUCT ('Tinkatuff', 'Tinkaton'),
    STRUCT ('Wiglett', 'Wugtrio'),
    STRUCT ('Finizen', 'Palafin'),
    STRUCT ('Varoom', 'Revevroom'),
    STRUCT ('Glimmet', 'Glimmora'),
    STRUCT ('Greavard', 'Houndstone'),
    STRUCT ('Cetoddle', 'Cetitan'),
    STRUCT ('Wooper', 'Clodsire'),
    STRUCT ('Dunsparce', 'Dudunsparce'),
    STRUCT ('Frigibax', 'Arctibax'),STRUCT ('Arctibax', 'Baxcalibur'),
    STRUCT ('Gimmighoul', 'Gholdengo'),
    STRUCT ('Psyduck', 'Golduck')
  ])
) AS source
ON target.from_species = source.from_species
   AND target.to_species = source.to_species
WHEN NOT MATCHED THEN
  INSERT (from_species, to_species)
  VALUES (source.from_species, source.to_species);


-- verified rerun proof

-- ============================================================
-- 2.Seeding Branch Evolution Chains
-- ============================================================


MERGE `pokemon-corporate-registry.pogo_corp.dim_evolution_chain` AS target
USING (
  SELECT * FROM UNNEST([
    STRUCT('Eevee' AS from_species, 'Vaporeon' AS to_species),
    STRUCT('Eevee' AS from_species, 'Jolteon'  AS to_species),
    STRUCT('Eevee' AS from_species, 'Flareon'  AS to_species),
    STRUCT('Eevee' AS from_species, 'Espeon'   AS to_species),
    STRUCT('Eevee' AS from_species, 'Umbreon'  AS to_species),
    STRUCT('Eevee' AS from_species, 'Leafeon'  AS to_species),
    STRUCT('Eevee' AS from_species, 'Glaceon'  AS to_species),
    STRUCT('Eevee' AS from_species, 'Sylveon'  AS to_species),



    STRUCT('NidoranF' AS from_species, 'Nidorina' AS to_species),
    STRUCT('Nidorina' AS from_species, 'Nidoqueen' AS to_species),

    STRUCT('NidoranM' AS from_species, 'Nidorino' AS to_species),
    STRUCT('Nidorino' AS from_species, 'Nidoking' AS to_species),


    STRUCT('Poliwhirl' AS from_species, 'Poliwrath' AS to_species),
    STRUCT('Poliwhirl' AS from_species, 'Politoed'  AS to_species),


    STRUCT('Slowpoke' AS from_species, 'Slowbro'  AS to_species),
    STRUCT('Slowpoke' AS from_species, 'Slowking' AS to_species),


    STRUCT('Snorunt' AS from_species, 'Glalie'   AS to_species),
    STRUCT('Snorunt' AS from_species, 'Froslass' AS to_species),


    STRUCT('Clamperl' AS from_species, 'Huntail'  AS to_species),
    STRUCT('Clamperl' AS from_species, 'Gorebyss' AS to_species),


    STRUCT('Tyrogue' AS from_species, 'Hitmonlee'  AS to_species),
    STRUCT('Tyrogue' AS from_species, 'Hitmonchan' AS to_species),
    STRUCT('Tyrogue' AS from_species, 'Hitmontop'  AS to_species),


    STRUCT('Wurmple' AS from_species, 'Silcoon'   AS to_species),
    STRUCT('Wurmple' AS from_species, 'Cascoon'   AS to_species),
    STRUCT('Silcoon' AS from_species, 'Beautifly' AS to_species),
    STRUCT('Cascoon' AS from_species, 'Dustox'    AS to_species),


    STRUCT('Oddish' AS from_species, 'Gloom'     AS to_species),
    STRUCT('Gloom'  AS from_species, 'Vileplume' AS to_species),
    STRUCT('Gloom'  AS from_species, 'Bellossom' AS to_species),


    STRUCT('Ralts'  AS from_species, 'Kirlia'    AS to_species),
    STRUCT('Kirlia' AS from_species, 'Gardevoir' AS to_species),
    STRUCT('Kirlia' AS from_species, 'Gallade'   AS to_species),
    

    STRUCT('Burmy' AS from_species, 'Wormadam'   AS to_species),
    Struct('Burmy' AS from_species, 'Mothim'     AS to_species),


    STRUCT('Scatterbug' AS from_species, 'Spewpa'   AS to_species),
    Struct('Spewpa'     AS from_species, 'Vivillon' AS to_species),

    STRUCT('Cosmog' AS from_species, 'Cosmoem'   AS to_species),
    Struct('Cosmoem' AS from_species, 'Solgaleo' AS to_species),
    STRUCT('Cosmoem' AS from_species, 'Lunala'   AS to_species),


    STRUCT('Applin' AS from_species, 'Flapple'   AS to_species),
    STRUCT('Applin' AS from_species, 'Appletun' AS to_species),


    STRUCT('Meowth' AS from_species, 'Persian'   AS to_species),
    Struct('Meowth' AS from_species, 'Perrserker' AS to_species),


    STRUCT('Charcadet' AS from_species, 'Armarouge'   AS to_species),
    Struct('Charcadet' AS from_species, 'Ceruledge' AS to_species),


    STRUCT("""Farfetch'd""" AS from_species, """Sirfetch'd""" AS to_species),


    STRUCT("""Type: Null""" AS from_species, 'Silvally' AS to_species)


  ])
) AS source
ON target.from_species = source.from_species
   AND target.to_species = source.to_species
WHEN NOT MATCHED THEN
  INSERT (from_species, to_species)
  VALUES (source.from_species, source.to_species);


-- Verified rerun proof

-- NOTE: inconsistencies, duplications, and spelling errors left intentionally for 
-- later data quality auditing and cleaning demonstrations
-- NOTE: inconsistencies in SQL scripting left for later code auditing demonstration


-- =================================================================
-- END EVOLUTION CHAINS. "NO EVOLUTION" ALLOWLIST IN SEPARATE QUERY
-- =================================================================
