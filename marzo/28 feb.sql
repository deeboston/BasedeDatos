--ciudad por pais
SELECT p.codigo AS codigo_pais, 
       p.nombre AS nombre_pais, 
       COUNT(c.codigo) AS cantidad_ciudades
FROM pais p, departamento d, ciudad c
WHERE p.codigo = d.codigo_pais 
AND d.codigo = c.codigo_departamento
GROUP BY p.codigo, p.nombre
ORDER BY cantidad_ciudades;


--ciudad por departamento
SELECT d.codigo AS codigo_departamento, 
       d.nombre AS nombre_departamento, 
       COUNT(c.codigo) AS cantidad_ciudades
FROM departamento d, ciudad c
WHERE d.codigo = c.codigo_departamento
GROUP BY d.codigo, d.nombre
ORDER BY cantidad_ciudades;

--departamentos per pais
SELECT p.codigo AS codigo_pais, 
       p.nombre AS nombre_pais, 
       COUNT(d.codigo) AS cantidad_departamentos
FROM pais p, departamento d
WHERE p.codigo = d.codigo_pais
GROUP BY p.codigo, p.nombre
ORDER BY cantidad_departamentos;

--todo database con relacciones
SELECT 
    p.codigo AS Codigo_Pais, p.nombre AS Pais, 
    d.codigo AS Codigo_Departamento, d.nombre AS Departamento, 
    c.codigo AS Codigo_Ciudad, c.nombre AS Ciudad
FROM ciudad c
JOIN departamento d ON c.codigo_departamento = d.codigo
JOIN pais p ON d.codigo_pais = p.codigo
ORDER BY p.nombre, d.nombre, c.nombre;



INSERT INTO departamento (codigo, nombre, codigo_pais) VALUES 
-- Argentina
('A1', 'Buenos Aires', '1'),
('A2', 'Cordoba', '1'),
('A3', 'Santa Fe', '1'),

-- Brazil
('B1', 'São Paulo', '2'),
('B2', 'Rio de Janeiro', '2'),
('B3', 'Bahia', '2'),

-- Mexico
('M1', 'Jalisco', '3'),
('M2', 'Nuevo León', '3'),
('M3', 'Yucatán', '3'),

-- Chile
('C1', 'Santiago Metropolitan', '4'),
('C2', 'Valparaíso', '4'),
('C3', 'Biobío', '4'),

-- Peru
('P1', 'Lima', '5'),
('P2', 'Cusco', '5'),
('P3', 'Arequipa', '5'),

-- Colombia
('CO', 'Antioquia', '6'),
('CB', 'Bogotá', '6'),
('CV', 'Valle del Cauca', '6'),

-- Ecuador
('E1', 'Pichincha', '7'),
('E2', 'Guayas', '7'),
('E3', 'Manabí', '7'),

-- Venezuela
('V1', 'Caracas', '8'),
('V2', 'Zulia', '8'),
('V3', 'Miranda', '8'),

-- Bolivia
('BO', 'La Paz', '9'),
('BS', 'Santa Cruz', '9'),
('BC', 'Cochabamba', '9'),

-- Paraguay
('PA', 'Asunción', '10'),
('PC', 'Central', '10'),
('PP', 'Alto Paraná', '10'),

-- Uruguay
('U1', 'Montevideo', '11'),
('U2', 'Canelones', '11'),
('U3', 'Maldonado', '11'),

-- Panama
('N1', 'Panama City', '12'),
('N7', 'Colón', '12'),
('N6', 'Chiriquí', '12'),

-- Costa Rica
('CR', 'San José', '13'),
('CA', 'Alajuela', '13'),
('CC', 'Cartago', '13'),

-- Honduras
('H1', 'Francisco Morazán', '14'),
('H2', 'Cortés', '14'),
('H3', 'Atlántida', '14'),

-- El Salvador
('S1', 'San Salvador', '15'),
('S2', 'Santa Ana', '15'),
('S3', 'La Libertad', '15'),

-- Guatemala
('G1', 'Guatemala City', '16'),
('G2', 'Quetzaltenango', '16'),
('G3', 'Escuintla', '16'),

-- Nicaragua
('N5', 'Managua', '17'),
('N2', 'León', '17'),
('N3', 'Granada', '17'),

-- Cuba
('CU', 'Havana', '18'),
('CS', 'Santiago de Cuba', '18'),
('CZ', 'Camagüey', '18'),

-- Dominican Republic
('D1', 'Santo Domingo', '19'),
('D2', 'Santiago', '19'),
('D3', 'La Romana', '19'),

-- Jamaica
('J1', 'Kingston', '20'),
('J2', 'Montego Bay', '20'),
('J3', 'Spanish Town', '20');


INSERT INTO ciudad (codigo, nombre, codigo_departamento) VALUES 
-- Argentina
('A1', 'Buenos Aires City', 'A1'),
('A2', 'Córdoba City', 'A2'),
('A3', 'Rosario', 'A3'),

-- Brazil
('B5', 'São Paulo City', 'B1'),
('B6', 'Rio de Janeiro City', 'B2'),
('B9', 'Salvador', 'B3'),

-- Mexico
('M1', 'Guadalajara', 'M1'),
('M2', 'Monterrey', 'M2'),
('M3', 'Mérida', 'M3'),

-- Chile
('C7', 'Santiago', 'C1'),
('CK', 'Valparaíso City', 'C2'),
('CM', 'Concepción', 'C3'),

-- Peru
('P1', 'Lima City', 'P1'),
('P2', 'Cusco City', 'P2'),
('P3', 'Arequipa City', 'P3'),

-- Colombia
('CO1', 'Medellín', 'CO'),
('CB1', 'Bogotá City', 'CB'),
('CV1', 'Cali', 'CV'),

-- Ecuador
('E1', 'Quito', 'E1'),
('E2', 'Guayaquil', 'E2'),
('E3', 'Manta', 'E3'),

-- Venezuela
('V1', 'Caracas City', 'V1'),
('V2', 'Maracaibo', 'V2'),
('V3', 'Los Teques', 'V3'),

-- Bolivia
('BO1', 'La Paz City', 'BO'),
('BS1', 'Santa Cruz de la Sierra', 'BS'),
('BC1', 'Cochabamba City', 'BC'),

-- Paraguay
('PA1', 'Asunción City', 'PA'),
('PC1', 'Luque', 'PC'),
('PP1', 'Ciudad del Este', 'PP'),

-- Uruguay
('U1', 'Montevideo City', 'U1'),
('U2', 'Las Piedras', 'U2'),
('U3', 'Punta del Este', 'U3'),

-- Panama
('N1', 'Panama City', 'N1'),
('N7', 'Colón City', 'N7'),
('N6', 'David', 'N6'),

-- Costa Rica
('CR1', 'San José City', 'CR'),
('CA1', 'Alajuela City', 'CA'),
('CC1', 'Cartago City', 'CC'),

-- Honduras
('H1', 'Tegucigalpa', 'H1'),
('H2', 'San Pedro Sula', 'H2'),
('H3', 'La Ceiba', 'H3'),

-- El Salvador
('S1', 'San Salvador City', 'S1'),
('S2', 'Santa Ana City', 'S2'),
('S3', 'Soyapango', 'S3'),

-- Guatemala
('GL', 'Guatemala City', 'G1'),
('GE', 'Quetzaltenango City', 'G2'),
('G3', 'Escuintla City', 'G3'),

-- Nicaragua
('N5', 'Managua City', 'N5'),
('N2', 'León City', 'N2'),
('N3', 'Granada City', 'N3'),

-- Cuba
('CU1', 'Havana City', 'CU'),
('CS1', 'Santiago de Cuba City', 'CS'),
('CZ1', 'Camagüey City', 'CZ'),

-- Dominican Republic
('D1', 'Santo Domingo City', 'D1'),
('D2', 'Santiago City', 'D2'),
('D3', 'La Romana City', 'D3'),

-- Jamaica
('J1', 'Kingston City', 'J1'),
('J2', 'Montego Bay City', 'J2'),
('J3', 'Spanish Town City', 'J3');


ALTER TABLE ciudad 
ALTER COLUMN codigo TYPE VARCHAR(10),
ALTER COLUMN codigo_departamento TYPE VARCHAR(10);
