-- Creacion y uso de Base de datos del Hospital
CREATE DATABASE dbHospital;
USE dbHospital;

DROP TABLE medicos; 
-- Creacion de la tabla de médicos.
CREATE TABLE IF NOT EXISTS medicos (
id CHAR(9) UNIQUE,
nombre VARCHAR(25) NOT NULL,
apellido VARCHAR(60) NOT NULL,
dni CHAR(9) UNIQUE,
inicioContrato DATE UNIQUE, 
especialidad VARCHAR(25) NOT NULL,
turnos ENUM('mañana', 'tarde', 'noche'),
universidadEstudios VARCHAR(25) NOT NULL,
ciudad VARCHAR(20) NOT NULL,
PRIMARY KEY(id)

);


 DROP TABLE pacientes ;
-- Creacion de la tabla de pacientes.
CREATE TABLE IF NOT EXISTS pacientes (
id CHAR(9) UNIQUE,
nombre VARCHAR(25) NOT NULL,
apellido VARCHAR(60) NOT NULL,
dni CHAR(9) UNIQUE,
fechaIngreso TIMESTAMP, 
fechaAlta TIMESTAMP,
patologia VARCHAR(60) NOT NULL,
medicoIngreso VARCHAR(60) NOT NULL,
tratamiento VARCHAR(60),
hospital VARCHAR(30) NOT NULL,
ciudadIngreso VARCHAR(20) NOT NULL,
PRIMARY KEY(id),
CONSTRAINT fk_pacientes_medicos FOREIGN KEY pacientes(id) REFERENCES medicos(id)
	ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT fk_pacientes_hospital FOREIGN KEY pacientes(id) REFERENCES hospital(nombre)
	ON UPDATE CASCADE ON DELETE RESTRICT      

);

DROP TABLE hospital; 
-- Creacion de la tabla del hospital.
CREATE TABLE IF NOT EXISTS hospital (
nombre VARCHAR(60) UNIQUE,
direccion VARCHAR(100) NOT NULL,
ciudad VARCHAR(60) NOT NULL,
provincia VARCHAR(25) NOT NULL,
telefono CHAR(12) NOT NULL UNIQUE,
-- administracion VARCHAR(25),
-- quirofanos VARCHAR(25),
-- especialidad VARCHAR(25),
-- urgencias VARCHAR(25) NOT NULL,
-- turnos ENUM('mañana', 'tarde', 'noche'),
planta VARCHAR(25) NOT NULL,
habitacion SMALLINT,
PRIMARY KEY(nombre)
);