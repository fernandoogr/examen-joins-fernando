CREATE TABLE colores (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre TEXT NOT NULL UNIQUE,
  hex TEXT NOT NULL UNIQUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE paletas (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre TEXT NOT NULL UNIQUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE colores_paletas (
  color_id INTEGER REFERENCES colores(id),
  paleta_id INTEGER REFERENCES paletas(id),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (color_id, paleta_id)
);

-- Colores de Material Design
INSERT INTO colores (nombre, hex) VALUES
('Material Red', '#F44336'),
('Material Pink', '#E91E63'),
('Material Purple', '#9C27B0'),
('Material Deep Purple', '#673AB7'),
('Material Indigo', '#3F51B5'),
('Material Blue', '#2196F3'),
('Material Light Blue', '#03A9F4'),
('Material Cyan', '#00BCD4'),
('Material Teal', '#009688'),
('Material Green', '#4CAF50'),
('Material Light Green', '#8BC34A'),
('Material Lime', '#CDDC39'),
('Material Yellow', '#FFEB3B'),
('Material Amber', '#FFC107'),
('Material Orange', '#FF9800'),
('Material Deep Orange', '#FF5722'),

-- Colores de Tailwind CSS
('Slate 700', '#334155'),
('Zinc 800', '#27272A'),
('Sky 500', '#0EA5E9'),
('Emerald 500', '#10B981'),
('Rose 500', '#F43F5E'),

-- Colores corporativos
('Facebook Blue', '#1877F2'),
('Twitter Blue', '#1DA1F2'),
('Instagram Gradient Purple', '#C13584'),
('LinkedIn Blue', '#0A66C2'),
('YouTube Red', '#FF0000'),
('Spotify Green', '#1DB954'),
('Slack Purple', '#4A154B'),
('Discord Blurple', '#5865F2'),

-- Paleta Nordic (colores fríos y naturales)
('Nordic Polar Night 1', '#2E3440'),
('Nordic Polar Night 2', '#3B4252'),
('Nordic Snow Storm 1', '#D8DEE9'),
('Nordic Snow Storm 2', '#E5E9F0'),
('Nordic Frost 1', '#88C0D0'),
('Nordic Frost 2', '#81A1C1'),
('Nordic Aurora Red', '#BF616A'),
('Nordic Aurora Orange', '#D08770'),
('Nordic Aurora Yellow', '#EBCB8B'),
('Nordic Aurora Green', '#A3BE8C'),

-- Paleta Sunset (cálida)
('Sunset Peach', '#FFBE98'),
('Sunset Coral', '#FF8A80'),
('Sunset Rose', '#FF5C8D'),
('Sunset Violet', '#B388FF'),
('Sunset Indigo', '#8C9EFF'),

-- Paleta Ocean (azules y verdes)
('Ocean Deep', '#0D47A1'),
('Ocean Medium', '#1976D2'),
('Ocean Light', '#42A5F5'),
('Ocean Teal', '#00ACC1'),
('Ocean Seafoam', '#4DD0E1'),

-- Paleta Forest (verdes naturales)
('Forest Dark', '#1B5E20'),
('Forest Pine', '#2E7D32'),
('Forest Moss', '#66BB6A'),
('Forest Sage', '#81C784'),
('Forest Mint', '#A5D6A7');

INSERT INTO paletas (nombre) VALUES
('Material Design'),
('Tailwind CSS'),
('Redes Sociales'),
('Nordic'),
('Sunset'),
('Ocean'),
('Forest'),
('Tech Brands');

INSERT INTO colores_paletas (color_id, paleta_id) VALUES
-- Material Design palette
(
  (SELECT id FROM colores WHERE nombre = 'Material Red'),
  (SELECT id FROM paletas WHERE nombre = 'Material Design')
),
(
  (SELECT id FROM colores WHERE nombre = 'Material Pink'),
  (SELECT id FROM paletas WHERE nombre = 'Material Design')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Material Purple'), 
  (SELECT id FROM paletas WHERE nombre = 'Material Design') 
),
( 
  (SELECT id FROM colores WHERE nombre = 'Material Indigo'), 
  (SELECT id FROM paletas WHERE nombre = 'Material Design') 
),
( 
  (SELECT id FROM colores WHERE nombre = 'Material Blue'), 
  (SELECT id FROM paletas WHERE nombre = 'Material Design') 
),
( 
  (SELECT id FROM colores WHERE nombre = 'Material Teal'), 
  (SELECT id FROM paletas WHERE nombre = 'Material Design') 
),
( 
  (SELECT id FROM colores WHERE nombre = 'Material Green'),
  (SELECT id FROM paletas WHERE nombre = 'Material Design')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Material Orange'),
  (SELECT id FROM paletas WHERE nombre = 'Material Design')
),

-- Tailwind CSS palette
( 
  (SELECT id FROM colores WHERE nombre = 'Slate 700'),
  (SELECT id FROM paletas WHERE nombre = 'Tailwind CSS')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Zinc 800'),
  (SELECT id FROM paletas WHERE nombre = 'Tailwind CSS')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Sky 500'),
  (SELECT id FROM paletas WHERE nombre = 'Tailwind CSS')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Emerald 500'),
  (SELECT id FROM paletas WHERE nombre = 'Tailwind CSS')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Rose 500'),
  (SELECT id FROM paletas WHERE nombre = 'Tailwind CSS')
),

-- Redes Sociales palette
( 
  (SELECT id FROM colores WHERE nombre = 'Facebook Blue'),
  (SELECT id FROM paletas WHERE nombre = 'Redes Sociales')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Twitter Blue'),
  (SELECT id FROM paletas WHERE nombre = 'Redes Sociales')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Instagram Gradient Purple'),
  (SELECT id FROM paletas WHERE nombre = 'Redes Sociales')
),
( 
  (SELECT id FROM colores WHERE nombre = 'YouTube Red'),
  (SELECT id FROM paletas WHERE nombre = 'Redes Sociales')
),

-- Tech Brands palette
( 
  (SELECT id FROM colores WHERE nombre = 'Spotify Green'),
  (SELECT id FROM paletas WHERE nombre = 'Tech Brands')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Slack Purple'),
  (SELECT id FROM paletas WHERE nombre = 'Tech Brands')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Discord Blurple'),
  (SELECT id FROM paletas WHERE nombre = 'Tech Brands')
),
( 
  (SELECT id FROM colores WHERE nombre = 'LinkedIn Blue'),
  (SELECT id FROM paletas WHERE nombre = 'Tech Brands')
),

-- Nordic palette
( 
  (SELECT id FROM colores WHERE nombre = 'Nordic Polar Night 1'),
  (SELECT id FROM paletas WHERE nombre = 'Nordic')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Nordic Polar Night 2'),
  (SELECT id FROM paletas WHERE nombre = 'Nordic')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Nordic Snow Storm 1'),
  (SELECT id FROM paletas WHERE nombre = 'Nordic')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Nordic Frost 1'),
  (SELECT id FROM paletas WHERE nombre = 'Nordic')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Nordic Frost 2'),
  (SELECT id FROM paletas WHERE nombre = 'Nordic')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Nordic Aurora Red'),
  (SELECT id FROM paletas WHERE nombre = 'Nordic')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Nordic Aurora Green'),
  (SELECT id FROM paletas WHERE nombre = 'Nordic')
),

-- Sunset palette
( 
  (SELECT id FROM colores WHERE nombre = 'Sunset Peach'),
  (SELECT id FROM paletas WHERE nombre = 'Sunset')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Sunset Coral'),
  (SELECT id FROM paletas WHERE nombre = 'Sunset')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Sunset Rose'),
  (SELECT id FROM paletas WHERE nombre = 'Sunset')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Sunset Violet'),
  (SELECT id FROM paletas WHERE nombre = 'Sunset')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Sunset Indigo'),
  (SELECT id FROM paletas WHERE nombre = 'Sunset')
),

-- Ocean palette
( 
  (SELECT id FROM colores WHERE nombre = 'Ocean Deep'),
  (SELECT id FROM paletas WHERE nombre = 'Ocean')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Ocean Medium'),
  (SELECT id FROM paletas WHERE nombre = 'Ocean')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Ocean Light'),
  (SELECT id FROM paletas WHERE nombre = 'Ocean')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Ocean Teal'),
  (SELECT id FROM paletas WHERE nombre = 'Ocean')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Ocean Seafoam'),
  (SELECT id FROM paletas WHERE nombre = 'Ocean')
),

-- Forest palette
( 
  (SELECT id FROM colores WHERE nombre = 'Forest Dark'),
  (SELECT id FROM paletas WHERE nombre = 'Forest')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Forest Pine'),
  (SELECT id FROM paletas WHERE nombre = 'Forest')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Forest Moss'),
  (SELECT id FROM paletas WHERE nombre = 'Forest')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Forest Sage'),
  (SELECT id FROM paletas WHERE nombre = 'Forest')
),
( 
  (SELECT id FROM colores WHERE nombre = 'Forest Mint'),
  (SELECT id FROM paletas WHERE nombre = 'Forest')
);
