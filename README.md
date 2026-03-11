# pokemon-corporate-registry
# Pokémon Corporate Registry

This project is a SQL data warehouse built in Google BigQuery to track and analyze my personal Pokémon GO collection.

The system models a corporate-style registry where Pokémon are assigned structured names and tracked through a relational database. The project is designed both as a personal tracking tool and as a portfolio demonstration of SQL data modeling and data governance.

## Core Goals

• Track individual Pokémon captured in Pokémon GO  
• Maintain a structured personal registry of named Pokémon  
• Model species, typing, and evolution relationships  
• Enforce naming rules and constraints  
• Build validation and auditing queries to ensure data accuracy  
• Demonstrate dimensional database design using BigQuery  

## Database Components

The project includes:

**Registry Tables**
- `pokemon_registry` – master registry of personal Pokémon entries
- `evolution_log` - records evolution events for registered Pokémon
- `move_change_log` - tracks changes to Pokémon move sets
- `pokemon_attacks` - current attack configuration for each Pokémon

**Dimension Tables**
- `dim_species`
- `dim_types`
- `dim_moves`

**Relationship Tables**
- `dim_evolution_chain`
- `dim_no_evolution_species`

**Validation Queries**
- data quality audits
- validation checks
- constraint enforcement

## Technologies Used

- Google BigQuery
- SQL
- dimensional modeling
- structured data validation

## Author

Elliott Gray  
Atlanta, Georgia
