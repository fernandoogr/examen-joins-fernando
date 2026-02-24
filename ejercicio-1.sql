SELECT colores.nombre, colores.hex, paletas.nombre
FROM colores
JOIN colores_paletas
ON colores.id = colores_paletas.color_id
JOIN paletas
ON colores_paletas.paleta_id = paletas.id