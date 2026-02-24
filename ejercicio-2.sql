SELECT 
pokemons.id AS pokedex, 
pokemons.nombre AS pokemon,
tipos.nombre AS tipo,
generacion.nombre AS generacion
FROM pokemons JOIN generacion
ON pokemons.generacion_id = generacion.id
JOIN pokemon_tipo
ON pokemons.id