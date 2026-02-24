# Examen JOINs

En esta prueba debes demostrar tu capacidad para unir tablas que tienen relaciones entre ellas en una base de datos normalizada.

En el repositorio encontrarás tres archivos sql para generar tres bases de datos diferentes.

- `schema-paletas`: una base de datos que almacena colores individuales con un nombre y su código hexadecimal, y paletas de colores que los agrupan bajo un nombre.
- `schema-pokemon.sql`: una base de datos que almacena pokemons con la generación a la que pertenecen, y sus tipos.
- `schema-tienda`: una base de datos simplificada de una tienda con productos ordenados por categorias, y usuarios que pueden realizar pedidos.

Tu objetivo será crear las bases de datos a partir de los archivos `.sql` proporcionados y hacer una sentencia JOIN en cada uno.

## Formato de entrega

En un repositorio privado, con el nombre `examen-joins`.

Cada join deberá ir en un `.sql` separado, con el nombre `ejercicio-x.sql`, donde x corresponde al número del ejercicio.

> No hace falta ya decir nada sobre los commits durante la prueba, sabeis como deben ser.

## Ejercicios

1. (2 puntos) En la base de datos de las paletas de colores, realiza un join que muestre:

- El nombre del color
- El código hexadecimal de ese color
- La paleta a la que está asociado

El resultado será como el siguiente:

```
+---------------------------+---------+-----------------+
|           color           |   hex   |     paleta      |
+---------------------------+---------+-----------------+
| Material Red              | #F44336 | Material Design |
| Material Pink             | #E91E63 | Material Design |
| Material Purple           | #9C27B0 | Material Design |
| Material Indigo           | #3F51B5 | Material Design |
| Material Blue             | #2196F3 | Material Design |
| Material Teal             | #009688 | Material Design |
| Material Green            | #4CAF50 | Material Design |
| Material Orange           | #FF9800 | Material Design |
| Slate 700                 | #334155 | Tailwind CSS    |
| Zinc 800                  | #27272A | Tailwind CSS    |
| Sky 500                   | #0EA5E9 | Tailwind CSS    |
| Emerald 500               | #10B981 | Tailwind CSS    |
| Rose 500                  | #F43F5E | Tailwind CSS    |
| Facebook Blue             | #1877F2 | Redes Sociales  |
| Twitter Blue              | #1DA1F2 | Redes Sociales  |
| Instagram Gradient Purple | #C13584 | Redes Sociales  |
| LinkedIn Blue             | #0A66C2 | Tech Brands     |

etc...
```

2. (3 puntos) En la base de datos de pokemons, deberás mostrar el número de la pokedex de cada pokemon (su id), el nombre del mismo, su tipo y la generación a la que pertenece, utiliza `ORDER BY` para que aparezcan ordenados según el número de la pokedex.

El resultado será como el siguiente:

```
+---------+------------+-----------+------------+
| pokedex |  pokemon   |   tipo    | generacion |
+---------+------------+-----------+------------+
| 1       | Bulbasaur  | Planta    | Kanto      |
| 1       | Bulbasaur  | Veneno    | Kanto      |
| 2       | Ivysaur    | Planta    | Kanto      |
| 2       | Ivysaur    | Veneno    | Kanto      |
| 3       | Venusaur   | Planta    | Kanto      |
| 3       | Venusaur   | Veneno    | Kanto      |
| 4       | Charmander | Fuego     | Kanto      |
| 5       | Charmeleon | Fuego     | Kanto      |
| 6       | Charizard  | Fuego     | Kanto      |
| 6       | Charizard  | Volador   | Kanto      |
| 7       | Squirtle   | Agua      | Kanto      |
| 8       | Wartortle  | Agua      | Kanto      |
| 9       | Blastoise  | Agua      | Kanto      |
| 10      | Caterpie   | Bicho     | Kanto      |
| 11      | Metapod    | Bicho     | Kanto      |
| 12      | Butterfree | Volador   | Kanto      |
| 12      | Butterfree | Bicho     | Kanto      |

etc...
```

3. (2 puntos) Utiliza `GROUP_CONCAT` junto a la instrucción SQL que te permite agrupar filas para eliminar las repeticiones.

El resultado deberá ser como el siguiente:

```
+---------+------------+---------------------+------------+
| pokedex |  pokemon   |        tipo         | generacion |
+---------+------------+---------------------+------------+
| 1       | Bulbasaur  | Planta, Veneno      | Kanto      |
| 2       | Ivysaur    | Planta, Veneno      | Kanto      |
| 3       | Venusaur   | Planta, Veneno      | Kanto      |
| 4       | Charmander | Fuego               | Kanto      |
| 5       | Charmeleon | Fuego               | Kanto      |
| 6       | Charizard  | Fuego, Volador      | Kanto      |
| 7       | Squirtle   | Agua                | Kanto      |
| 8       | Wartortle  | Agua                | Kanto      |
| 9       | Blastoise  | Agua                | Kanto      |
| 10      | Caterpie   | Bicho               | Kanto      |
| 11      | Metapod    | Bicho               | Kanto      |
| 12      | Butterfree | Volador, Bicho      | Kanto      |
| 13      | Weedle     | Veneno, Bicho       | Kanto      |
| 14      | Kakuna     | Veneno, Bicho       | Kanto      |
| 15      | Beedrill   | Veneno, Bicho       | Kanto      |
| 16      | Pidgey     | Normal, Volador     | Kanto      |
| 17      | Pidgeotto  | Normal, Volador     | Kanto      |

etc...
```

4. (3 puntos) En la base de datos de la tienda, muestra los pedidos que han realizado los diferentes usuarios, mostrando el nombre del producto, su categoria asociada, que usuario lo ha pedido y la cantidad del mismo.

El resultado debería ser como el siguiente:

```
+-------------------------------------------------+-------------+---------+----------+
|                    producto                     |  categoria  | usuario | cantidad |
+-------------------------------------------------+-------------+---------+----------+
| iPhone 16                                       | Electrónica | Juan    | 1        |
| Samsung Galaxy S24                              | Electrónica | María   | 1        |
| Camiseta de algodón                             | Ropa        | Carlos  | 3        |
| Jeans ajustados                                 | Ropa        | Ana     | 2        |
| Sofá de cuero                                   | Hogar       | Luis    | 1        |
| 1984 de George Orwell                           | Libros      | Sofía   | 2        |
| Smart TV 55 pulgadas                            | Electrónica | Miguel  | 1        |
| Zapatillas de running                           | Ropa        | Laura   | 1        |
| iPhone 16 Pro                                   | Electrónica | Juan    | 1        |
| Mesa de comedor                                 | Hogar       | María   | 1        |
| El nombre del viento de Patrick Rothfuss        | Libros      | Carlos  | 1        |
| Calcetines deportivos                           | Ropa        | Ana     | 5        |
| Abrigo de invierno                              | Ropa        | Luis    | 1        |
| Lámpara de pie                                  | Hogar       | Sofía   | 2        |
| Silla de oficina ergonómica                     | Hogar       | Miguel  | 2        |
| Smart TV 65 pulgadas                            | Electrónica | Laura   | 1        |
| El temor de un hombre sabio de Patrick Rothfuss | Libros      | Juan    | 1        |

etc...
```
