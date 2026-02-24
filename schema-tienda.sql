PRAGMA FOREIGN_KEYS = ON;
BEGIN TRANSACTION;
CREATE TABLE categorias (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre TEXT NOT NULL UNIQUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE productos (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre TEXT NOT NULL,
  desc TEXT NOT NULL,
  precio REAL NOT NULL,
  categoria_id INTEGER REFERENCES categorias(id),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE usuarios (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre TEXT NOT NULL,
  apellidos TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pedidos (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  producto_id INTEGER REFERENCES productos(id),
  usuario_id INTEGER REFERENCES usuarios(id),
  cantidad INTEGER NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO categorias (nombre) VALUES ('Electrónica');
INSERT INTO categorias (nombre) VALUES ('Ropa');
INSERT INTO categorias (nombre) VALUES ('Hogar');
INSERT INTO categorias (nombre) VALUES ('Libros');

INSERT INTO productos (nombre, desc, precio, categoria_id) VALUES ('iPhone 16', 'Modelo de iPhone con pantalla de 6.1 pulgadas, cámara mejorada y batería de larga duración.', 999.99, 1);
INSERT INTO productos (nombre, desc, precio, categoria_id) VALUES ('iPhone 16 Pro', 'Modelo de iPhone con pantalla de 6.7 pulgadas, cámara avanzada y rendimiento mejorado.', 1199.99, 1);
INSERT INTO productos (nombre, desc, precio, categoria_id) VALUES ('Samsung Galaxy S24', 'Smartphone con pantalla AMOLED de 6.2 pulgadas, cámara de alta resolución y batería de larga duración.', 899.99, 1);
INSERT INTO productos (nombre, desc, precio, categoria_id) VALUES ('Camiseta de algodón', 'Camiseta de algodón suave y transpirable, disponible en varios colores y tallas.', 19.99, 2);
INSERT INTO productos (nombre, desc, precio, categoria_id) VALUES ('Jeans ajustados', 'Jeans ajustados de mezclilla con diseño moderno, disponibles en varias tallas.', 49.99, 2);
INSERT INTO productos (nombre, desc, precio, categoria_id) VALUES ('Calcetines deportivos', 'Calcetines deportivos de alta calidad con tecnología de absorción de humedad, disponibles en varios colores y tallas.', 14.99, 2);
INSERT INTO productos (nombre, desc, precio, categoria_id) VALUES ('Zapatillas de running', 'Zapatillas de running con amortiguación avanzada y diseño ergonómico, disponibles en varios colores y tallas.', 89.99, 2);
INSERT INTO productos (nombre, desc, precio, categoria_id) VALUES ('Abrigo de invierno', 'Abrigo de invierno con aislamiento térmico y diseño elegante, disponible en varios colores y tallas.', 149.99, 2);
INSERT INTO productos (nombre, desc, precio, categoria_id) VALUES ('Sofá de cuero', 'Sofá de cuero de alta calidad con diseño moderno y cómodo, disponible en varios colores.', 899.99, 3);
INSERT INTO productos (nombre, desc, precio, categoria_id) VALUES ('Mesa de comedor', 'Mesa de comedor de madera maciza con diseño elegante y capacidad para 6 personas.', 499.99, 3);
INSERT INTO productos (nombre, desc, precio, categoria_id) VALUES ('Lámpara de pie', 'Lámpara de pie con diseño moderno y luz ajustable, perfecta para cualquier habitación.', 79.99, 3);
INSERT INTO productos (nombre, desc, precio, categoria_id) VALUES ('Silla de oficina ergonómica', 'Silla de oficina ergonómica con soporte lumbar ajustable y diseño cómodo, perfecta para largas horas de trabajo.', 199.99, 3);
INSERT INTO productos (nombre, desc, precio, categoria_id) VALUES ('Estantería de madera', 'Estantería de madera maciza con diseño elegante y capacidad para libros y objetos decorativos.', 299.99, 3);
INSERT INTO productos (nombre, desc, precio, categoria_id) VALUES ('Smart TV 55 pulgadas', 'Smart TV de 55 pulgadas con resolución 4K, tecnología HDR y sistema operativo intuitivo.', 699.99, 1);
INSERT INTO productos (nombre, desc, precio, categoria_id) VALUES ('Smart TV 65 pulgadas', 'Smart TV de 65 pulgadas con resolución 4K, tecnología HDR y sistema operativo intuitivo.', 899.99, 1);
INSERT INTO productos (nombre, desc, precio, categoria_id) VALUES ('1984 de George Orwell', 'Novela distópica que explora temas de vigilancia, totalitarismo y control social.', 14.99, 4);
INSERT INTO productos (nombre, desc, precio, categoria_id) VALUES ('El nombre del viento de Patrick Rothfuss', 'Novela de fantasía que sigue la historia de un joven músico y mago llamado Kvothe.', 19.99, 4);
INSERT INTO productos (nombre, desc, precio, categoria_id) VALUES ('El temor de un hombre sabio de Patrick Rothfuss', 'Segunda parte de la serie de fantasía que continúa la historia de Kvothe y sus aventuras.', 19.99, 4);
INSERT INTO productos (nombre, desc, precio, categoria_id) VALUES ('Snuff de Chuck Palahniuk', 'Novela de suspense que sigue la historia de un grupo de personas involucradas en la industria del entretenimiento para adultos.', 14.99, 4);
INSERT INTO productos (nombre, desc, precio, categoria_id) VALUES ('Trampa 22 de Joseph Heller', 'Novela satírica que sigue la historia de un bombardero estadounidense durante la Segunda Guerra Mundial.', 14.99, 4);

INSERT INTO usuarios (nombre, apellidos, email) VALUES ('Juan', 'Pérez', 'juanperez@email.com');
INSERT INTO usuarios (nombre, apellidos, email) VALUES ('María', 'García', 'mariagarcia@email.com');
INSERT INTO usuarios (nombre, apellidos, email) VALUES ('Carlos', 'López', 'carloslopez@email.com');
INSERT INTO usuarios (nombre, apellidos, email) VALUES ('Ana', 'Martínez', 'anamartinez@email.com');
INSERT INTO usuarios (nombre, apellidos, email) VALUES ('Luis', 'Gómez', 'luisgomez@email.com');
INSERT INTO usuarios (nombre, apellidos, email) VALUES ('Sofía', 'Rodríguez', 'sofiarodriguez@email.com');
INSERT INTO usuarios (nombre, apellidos, email) VALUES ('Miguel', 'Hernández', 'miguelhernandez@email.com');
INSERT INTO usuarios (nombre, apellidos, email) VALUES ('Laura', 'Sánchez', 'laurasanchez@email.com');

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'iPhone 16' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'juanperez@email.com' LIMIT 1),
  1
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'Samsung Galaxy S24' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'mariagarcia@email.com' LIMIT 1),
  1
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'Camiseta de algodón' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'carloslopez@email.com' LIMIT 1),
  3
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'Jeans ajustados' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'anamartinez@email.com' LIMIT 1),
  2
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'Sofá de cuero' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'luisgomez@email.com' LIMIT 1),
  1
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = '1984 de George Orwell' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'sofiarodriguez@email.com' LIMIT 1),
  2
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'Smart TV 55 pulgadas' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'miguelhernandez@email.com' LIMIT 1),
  1
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'Zapatillas de running' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'laurasanchez@email.com' LIMIT 1),
  1
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'iPhone 16 Pro' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'juanperez@email.com' LIMIT 1),
  1
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'Mesa de comedor' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'mariagarcia@email.com' LIMIT 1),
  1
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'El nombre del viento de Patrick Rothfuss' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'carloslopez@email.com' LIMIT 1),
  1
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'Calcetines deportivos' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'anamartinez@email.com' LIMIT 1),
  5
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'Abrigo de invierno' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'luisgomez@email.com' LIMIT 1),
  1
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'Lámpara de pie' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'sofiarodriguez@email.com' LIMIT 1),
  2
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'Silla de oficina ergonómica' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'miguelhernandez@email.com' LIMIT 1),
  2
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'Smart TV 65 pulgadas' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'laurasanchez@email.com' LIMIT 1),
  1
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'El temor de un hombre sabio de Patrick Rothfuss' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'juanperez@email.com' LIMIT 1),
  1
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'Camiseta de algodón' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'mariagarcia@email.com' LIMIT 1),
  4
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'Estantería de madera' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'carloslopez@email.com' LIMIT 1),
  1
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'Snuff de Chuck Palahniuk' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'anamartinez@email.com' LIMIT 1),
  1
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'Trampa 22 de Joseph Heller' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'luisgomez@email.com' LIMIT 1),
  2
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'iPhone 16' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'sofiarodriguez@email.com' LIMIT 1),
  1
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'Jeans ajustados' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'miguelhernandez@email.com' LIMIT 1),
  1
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'Samsung Galaxy S24' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'laurasanchez@email.com' LIMIT 1),
  1
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'Zapatillas de running' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'juanperez@email.com' LIMIT 1),
  2
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'Sofá de cuero' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'mariagarcia@email.com' LIMIT 1),
  1
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = '1984 de George Orwell' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'carloslopez@email.com' LIMIT 1),
  1
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'Mesa de comedor' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'anamartinez@email.com' LIMIT 1),
  1
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'Calcetines deportivos' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'luisgomez@email.com' LIMIT 1),
  6
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'iPhone 16 Pro' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'sofiarodriguez@email.com' LIMIT 1),
  1
);

INSERT INTO pedidos (producto_id, usuario_id, cantidad) VALUES (
  (SELECT id FROM productos WHERE nombre = 'Abrigo de invierno' LIMIT 1),
  (SELECT id FROM usuarios WHERE email = 'miguelhernandez@email.com' LIMIT 1),
  1
);
COMMIT;
