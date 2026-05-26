CREATE TABLE Ciudad(
	ciudad_id SERIAL PRIMARY KEY,
	nombre_ciudad VARCHAR(50) NOT NULL, 
	codigo_postal INT NOT NULL
);

CREATE TYPE estado_servicio_enum AS ENUM ('Activo', 'Inactivo');

CREATE TABLE Servicio(
	id_servicio SERIAL PRIMARY KEY,
	nombre_servicio VARCHAR(100) NOT NULL,
	estado_servicio estado_servicio_enum NOT NULL DEFAULT 'Activo'
);

CREATE TABLE Medio(
	medio_id SERIAL PRIMARY KEY,
 	nombre_medio VARCHAR(100)
);

CREATE TABLE Tipo_Usuario(
	id_tipo_usuario SERIAL PRIMARY KEY,
	nom_tipo_usuario VARCHAR(100) NOT NULL
);

CREATE TABLE Usuario(
	usuario_id SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
	ciudad_id INT,
	id_tipo_usuario INT,

	FOREIGN KEY (ciudad_id) REFERENCES Ciudad(ciudad_id),
	FOREIGN KEY (id_tipo_usuario) REFERENCES Tipo_Usuario(id_tipo_usuario)
);
	
CREATE TABLE Empleado(
	empleado_id SERIAL PRIMARY KEY,
	cargo_empleado VARCHAR(100) NOT NULL,
	departamento_empleado VARCHAR(100) NOT NULL,
	usuario_id INT,

	FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id)
);

CREATE TABLE Notificacion(
	notificacion_id SERIAL PRIMARY KEY,
	mensaje VARCHAR(300) NOT NULL,
	fecha_envio TIMESTAMP,
	medio_id INT,
	id_servicio INT,

	FOREIGN KEY (medio_id) REFERENCES Medio(medio_id),
	FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio)
);

CREATE TABLE Turno (
    id_turno SERIAL PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL,

	usuario_id INT,
	id_servicio INT,
	empleado_id INT,

	FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id),
	FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio),
	FOREIGN KEY (empleado_id) REFERENCES Empleado(empleado_id)
);



INSERT INTO Ciudad(nombre_ciudad, codigo_postal)
VALUES
('Cali',760001),
('Bogotá',110111),
('Medellín',50001),
('Pasto', 520001),
('Bucaramanga', 680001),
('Barrancabermeja', 687031),
('Quibdo', 270001),
('Monteria', 230001),
('Mocoa', 860001),
('Popayan', 190001);

INSERT INTO Servicio(nombre_servicio, estado_servicio)
VALUES
('Atención médica', 'Activo'),
('Soporte técnico', 'Activo'),
('Pago de facturas', 'Activo'),
('Asesoría financiera', 'Activo'),
('Reclamos', 'Inactivo'),
('Entrega de documentos', 'Activo'),
('Atención al cliente', 'Activo'),
('Registro de usuarios', 'Activo'),
('Solicitud de citas', 'Activo'),
('Actualización de datos', 'Activo');

INSERT INTO Medio(nombre_medio)
VALUES
('Correo electrónico'),
('SMS'),
('WhatsApp'),
('Llamada telefónica'),
('Aplicación móvil'),
('Telegram'),
('Mensaje interno'),
('Notificación push'),
('Facebook Messenger'),
('Instagram');


INSERT INTO Tipo_Usuario(nom_tipo_usuario)
VALUES
('Administrador'),
('Cliente'),
('Empleado'),
('Supervisor'),
('Invitado'),
('Gerente'),
('Soporte'),
('Recepcionista'),
('Técnico'),
('Operador');

INSERT INTO Usuario(nombre, apellido, ciudad_id, id_tipo_usuario)
VALUES
('Juan', 'Perez', 1, 2),
('Maria', 'Gomez', 2, 1),
('Carlos', 'Rodriguez', 3, 3),
('Laura', 'Martinez', 4, 2),
('Andres', 'Lopez', 5, 4),
('Sofia', 'Ramirez', 6, 2),
('Daniel', 'Torres', 7, 3),
('Valentina', 'Castro', 1, 5),
('Felipe', 'Moreno', 2, 2),
('Camila', 'Herrera', 3, 1);

INSERT INTO Empleado(cargo_empleado, departamento_empleado, usuario_id)
VALUES
('Gerente', 'Administración', 2),
('Técnico', 'Soporte', 3),
('Recepcionista', 'Atención al cliente', 5),
('Supervisor', 'Administrador', 7),
('Analista', 'Servicios', 10),
('Asesor', 'Ventas', 1),
('Coordinador', 'Recursos Humanos', 4),
('Auxiliar', 'Soporte', 6),
('Ingeniero', 'Infraestructura', 8),
('Operador', 'Servicios', 9);
	
INSERT INTO Notificacion(mensaje, fecha_envio, medio_id, id_servicio)
VALUES
('Su turno ha sido asignado', NOW(), 1, 1),
('Su cita fue confirmada', NOW(), 2, 2),
('El servicio presenta demoras', NOW(), 3, 3),
('Su solicitud fue aprobada', NOW(), 1, 4),
('Recuerde asistir a su turno', NOW(), 4, 5),
('Servicio temporalmente inactivo', NOW(), 2, 1),
('Nueva actualización disponible', NOW(), 5, 2),
('Su documento está listo', NOW(), 1, 3),
('Turno cancelado exitosamente', NOW(), 3, 4),
('Gracias por usar LiMar', NOW(), 2, 5);

INSERT INTO Turno(nombre_categoria, usuario_id, id_servicio, empleado_id)
VALUES
('Prioritario', 1, 1, 1),
('General', 2, 2, 2),
('Preferencial', 3, 3, 3),
('Urgente', 4, 4, 4),
('General', 5, 5, 5),
('Prioritario', 6, 1, 6),
('Urgente', 7, 2, 7),
('Preferencial', 8, 3, 8),
('General', 9, 4, 9),
('Prioritario', 10, 5, 10);



