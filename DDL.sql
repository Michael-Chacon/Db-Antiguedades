DROP DATABASE IF EXISTS atique;
CREATE DATABASE atique;
USE atique;

CREATE TABLE disponibilidad (
    id_disponibilidad INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    CONSTRAINT pkDisponibilidad PRIMARY KEY (id_disponibilidad)
)ENGINE=InnoDB;


CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    CONSTRAINT pkCategoria PRIMARY KEY (id_categoria)
)ENGINE=InnoDB;

CREATE TABLE epoca (
    id_epoca INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    CONSTRAINT pkEpoca PRIMARY KEY (id_epoca)
)ENGINE=InnoDB;

CREATE TABLE estado_conservacion (
    id_estado_conservacion INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    CONSTRAINT pkEstadoConservacion PRIMARY KEY (id_estado_conservacion)
)ENGINE=InnoDB;

CREATE TABLE usuario(
    id_usuario INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellido_uno VARCHAR(20) NOT NULL,
    apellido_dos VARCHAR(20),
    email VARCHAR(100) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    CONSTRAINT pkUsuario PRIMARY KEY (id_usuario)
)ENGINE=InnoDB;

CREATE TABLE antiguedad (
    id_antiguedad INT AUTO_INCREMENT NOT NULL,
    categoria_id INT NOT NULL,
    epoca_id INT NOT NULL,
    estado_conservacion_id INT NOT NULL,
    disponibilidad_id INT NOT NULL,
    propietario_id INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    origen VARCHAR(100),
    CONSTRAINT pkAntiguedad PRIMARY KEY (id_antiguedad),
    CONSTRAINT fkCategoria FOREIGN KEY (categoria_id) REFERENCES categoria(id_categoria),
    CONSTRAINT fkEpoca FOREIGN KEY (epoca_id) REFERENCES epoca(id_epoca),
    CONSTRAINT fkEstadoConservacion FOREIGN KEY (estado_conservacion_id) REFERENCES estado_conservacion(id_estado_conservacion),
    CONSTRAINT fkDisponibilidad FOREIGN KEY (disponibilidad_id) REFERENCES disponibilidad(id_disponibilidad),
    CONSTRAINT fkPropietario FOREIGN KEY (propietario_id) REFERENCES usuario(id_usuario)
)ENGINE=InnoDB;

CREATE TABLE foto(
    id_foto INT AUTO_INCREMENT NOT NULL,
    antiguedad_id_f INT(11) NOT NULL,
    url_foto VARCHAR(266) NOT NULL,
    CONSTRAINT pkFoto PRIMARY KEY (id_foto),
    CONSTRAINT fkFotoAntiguedad FOREIGN KEY (antiguedad_id_f) REFERENCES antiguedad(id_antiguedad)
)ENGINE=InnoDB;

CREATE TABLE historial_precio(
    id_historial_precio INT AUTO_INCREMENT NOT NULL,
    antiguedad_id_hp INT(11) NOT NULL,
    fecha_modificacion DATE NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    CONSTRAINT pkHistorialPrecio PRIMARY KEY (id_historial_precio),
    CONSTRAINT fkPrecioAntiguedad FOREIGN KEY (antiguedad_id_hp) REFERENCES antiguedad(id_antiguedad)
)ENGINE=InnoDB;


CREATE TABLE valoracion(
    id_valoracion INT AUTO_INCREMENT NOT NULL,
    antiguedad_id_v INT(11) NOT NULL,
    usuario_id_v INT(11) NOT NULL,
    calificacion INT(1) NOT NULL,
    comentario VARCHAR(255),
    CONSTRAINT pkValoracion PRIMARY KEY (id_valoracion),
    CONSTRAINT fkValoracionAntiguedad FOREIGN KEY (antiguedad_id_v) REFERENCES antiguedad(id_antiguedad), 
    CONSTRAINT fkValoracionUsuario FOREIGN KEY (usuario_id_v) REFERENCES usuario(id_usuario)
)ENGINE=InnoDB;

CREATE TABLE transaccion(
    id_transaccion INT AUTO_INCREMENT NOT NULL,
    comprador_id INT(11) NOT NULL,
    antiguedad_id_t INT(11) NOT NULL,
    fecha DATE NOT NULL,
    precio_venta DECIMAL NOT NULL,
    CONSTRAINT pkTransaccion PRIMARY KEY (id_transaccion),
    CONSTRAINT fkTransaccionAntiguedad FOREIGN KEY (antiguedad_id_t) REFERENCES antiguedad(id_antiguedad),
    CONSTRAINT fkTransaccionUsuario FOREIGN KEY (comprador_id) REFERENCES usuario(id_usuario)
)ENGINE=InnoDB;

CREATE TABLE direccion_usuario(
    id_direccion INT AUTO_INCREMENT NOT NULL,
    usuario_id_du INT(11) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    CONSTRAINT pkDireccionUsuario PRIMARY KEY(id_direccion),
    CONSTRAINT fkDireccionUsuario FOREIGN KEY (usuario_id_du) REFERENCES usuario(id_usuario)
)ENGINE=InnoDB;

CREATE TABLE roles (
    id_rol INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    CONSTRAINT pkRoles PRIMARY KEY(id_rol)
)ENGINE=InnoDB;

CREATE TABLE permisos (
    id_permiso INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    CONSTRAINT pkPermisos PRIMARY KEY(id_permiso)
)ENGINE=InnoDB;

CREATE TABLE rol_permiso (
    id_rol_rp INT(11) NOT NULL,
    id_permiso_rp INT(11) NOT NULL,
    PRIMARY KEY (id_rol_rp, id_permiso_rp),
    FOREIGN KEY (id_rol_rp) REFERENCES roles(id_rol) ON DELETE CASCADE,
    FOREIGN KEY (id_permiso_rp) REFERENCES permisos(id_permiso) ON DELETE CASCADE
)ENGINE=InnoDB;

CREATE TABLE usuario_rol (
    id_usuario_ur INT(11) NOT NULL,
    id_rol_ur INT(11) NOT NULL,
    PRIMARY KEY (id_usuario_ur, id_rol_ur),
    FOREIGN KEY (id_usuario_ur) REFERENCES usuario(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_rol_ur) REFERENCES roles(id_rol) ON DELETE CASCADE
)ENGINE=InnoDB;


