SELECT pokemons.id, pokemons.nombre, tipos.nombre, generacion.id
FROM pokemons
JOIN pokemon_tipo
ON pokemons.id