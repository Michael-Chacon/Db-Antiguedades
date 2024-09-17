-- Insertar datos en la tabla disponibilidad
INSERT INTO disponibilidad (nombre) VALUES ('En venta'), ('Vendido'), ('Retirado');

-- Insertar datos en la tabla categoria
INSERT INTO categoria (nombre) VALUES ('Muebles'), ('Joyería'), ('Pinturas'), ('Esculturas');

-- Insertar datos en la tabla epoca
INSERT INTO epoca (nombre) VALUES ('Renacimiento'), ('Barroco'), ('Neoclásico'), ('Edad Media');

-- Insertar datos en la tabla estado_conservacion
INSERT INTO estado_conservacion (nombre) VALUES ('Excelente'), ('Bueno'), ('Regular'), ('Malo');

-- Insertar datos en la tabla usuario
INSERT INTO usuario (nombre, apellido_uno, apellido_dos, email, contrasena) 
VALUES 
('Carlos', 'Pérez', 'Gómez', 'carlos.perez@gmail.com', 'pass123'),
('María', 'López', NULL, 'maria.lopez@hotmail.com', 'maria456'),
('Luis', 'Martínez', 'Díaz', 'luis.martinez@yahoo.com', 'luis789');

-- Insertar datos en la tabla antiguedad
INSERT INTO antiguedad (categoria_id, epoca_id, estado_conservacion_id, disponibilidad_id, propietario_id, nombre, descripcion, precio, origen) 
VALUES 
(1, 1, 1, 1, 1, 'Silla renacentista', 'Silla de madera tallada de la época renacentista en excelente estado.', 1200.00, 'Italia'),
(2, 2, 2, 1, 2, 'Anillo de oro barroco', 'Anillo de oro del siglo XVII con diseño barroco.', 3500.00, 'Francia'),
(3, 3, 3, 2, 3, 'Retrato neoclásico', 'Retrato al óleo de la época neoclásica, en condiciones regulares.', 800.00, 'España'),
(1, 2, 1, 1, 2, 'Mesa barroca', 'Mesa de roble tallada del siglo XVII, en excelente estado de conservación.', 2500.00, 'Francia'),
(2, 1, 2, 1, 1, 'Collar renacentista', 'Collar de oro con incrustaciones de gemas de la época renacentista.', 4500.00, 'Italia'),
(3, 4, 3, 1, 3, 'Pintura religiosa medieval', 'Pintura al óleo que representa una escena religiosa, con evidentes signos de deterioro.', 3000.00, 'España'),
(4, 3, 1, 1, 1, 'Escultura de mármol neoclásica', 'Escultura de mármol blanco que representa una figura mitológica griega.', 7500.00, 'Grecia'),
(1, 4, 2, 1, 2, 'Jarrón de cerámica medieval', 'Jarrón de cerámica del siglo XI, decorado con motivos florales.', 2200.00, 'Alemania'),
(2, 2, 1, 1, 3, 'Anillo barroco con esmeralda', 'Anillo de plata con esmeralda del siglo XVII, en perfecto estado.', 3800.00, 'Inglaterra'),
(4, 1, 2, 1, 2, 'Escultura de mármol renacentista', 'Figura humana tallada en mármol, conservada en buen estado.', 8500.00, 'Italia'),
(2, 3, 3, 1, 1, 'Broche de oro neoclásico', 'Broche de oro del siglo XVIII con detalles ornamentales característicos del neoclasicismo.', 1500.00, 'Francia'),
(3, 2, 1, 1, 2, 'Paisaje barroco', 'Cuadro al óleo que representa un paisaje naturalista del siglo XVII, en excelente estado.', 5000.00, 'Países Bajos'),
(1, 1, 2, 1, 3, 'Mesa renacentista de roble', 'Mesa de roble macizo de la época renacentista, restaurada y conservada en buen estado.', 6000.00, 'Italia');

-- Insertar datos en la tabla foto
INSERT INTO foto (antiguedad_id_f, url_foto) 
VALUES 
(1, 'http://imagenes.com/silla_renacentista.jpg'),
(2, 'http://imagenes.com/anillo_barroco.jpg'),
(3, 'http://imagenes.com/retrato_neoclasico.jpg');

-- Insertar datos en la tabla historial_precio
INSERT INTO historial_precio (antiguedad_id_hp, fecha_modificacion, precio) 
VALUES 
(1, '2023-01-01', 1000.00),
(1, '2023-06-01', 1200.00),
(2, '2023-02-01', 3000.00),
(2, '2023-08-01', 3500.00),
(3, '2023-03-01', 850.00),
(3, '2023-09-01', 800.00);

-- Insertar datos en la tabla valoracion
INSERT INTO valoracion (antiguedad_id_v, usuario_id_v, calificacion, comentario) 
VALUES 
(1, 2, 5, 'Pieza increíble en perfectas condiciones.'),
(2, 1, 4, 'Muy buena pero un poco costosa.'),
(3, 2, 3, 'Buena, pero el estado de conservación podría ser mejor.');

-- Insertar datos en la tabla transaccion
INSERT INTO transaccion (comprador_id, antiguedad_id_t, fecha, precio_venta) 
VALUES 
(2, 1, '2023-09-01', 1200.00),
(1, 3, '2023-10-01', 800.00),
(3, 2, '2023-07-15', 3500.00), -- Luis compra el anillo barroco
(2, 2, '2023-12-01', 3600.00), -- María compra el anillo barroco con un precio modificado
(1, 3, '2023-11-10', 900.00), -- Carlos compra el retrato neoclásico
(3, 1, '2024-02-12', 1250.00), -- Luis compra la silla renacentista
(1, 1, '2024-03-20', 1100.00), -- Carlos compra la silla renacentista a un precio menor en una oferta especial
(2, 1, '2024-04-05', 1400.00); -- María compra la silla renacentista a un precio más alto después de negociaciones


-- Insertar datos en la tabla direccion_usuario
INSERT INTO direccion_usuario (usuario_id_du, direccion) 
VALUES 
(1, 'Calle Falsa 123, Ciudad A, País B'),
(2, 'Avenida Siempreviva 742, Ciudad C, País D'),
(3, 'Calle Larga 456, Ciudad E, País F');

-- Insertar datos en la tabla roles
INSERT INTO roles (nombre) 
VALUES 
('Vendedor'), 
('Comprador'), 
('Administrador');
