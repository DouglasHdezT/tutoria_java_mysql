-- DDL: Creación de tablas & Drops (Directamente en la base) (Ejecutar antes de cualquier DML) (SOLO 1 VEZ)

CREATE TABLE project (
  id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  description VARCHAR(280) NOT NULL,
  place VARCHAR(140)
)

CREATE TABLE requirement (
  id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  description VARCHAR(280) NOT NULL,
  status BOOLEAN DEFAULT FALSE,
  id_type INT(6),
  id_project INT(6),
  FOREIGN KEY(id_type) REFERENCES type_requirement(id),
  FOREIGN KEY(id_project) REFERENCES project(id)
)

CREATE TABLE type_requirement (
  id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL
)

-- DML: Consultas & Inserts & Updates & Delete

-- Todos los proyectos
SELECT * FROM project;

-- Un proyecto en especifico (:id)
SELECT * FROM project WHERE id = :id

-- Crear un proyecto (Java)
INSERT INTO project(description, place) VALUES (:descrip, :place)
INSERT INTO project(description, place) VALUES ("Descrip 00", "Place 00") -- 0
INSERT INTO project(description, place) VALUES ("Descrip 01", "Place 01") -- 1
INSERT INTO project(description, place) VALUES ("Descrip 02", "Place 02") -- 2
INSERT INTO project(description, place) VALUES ("Descrip 03", "Place 03") -- 3

--> Crear tipos (Directamente en la base) <------ (SOLO 1 VEZ)
INSERT INTO type_requirement(name) VALUES ("Financiero"), ("Legal"), ("Economico"), ("Tecnico")

-- Crear requerimientos (Java)
INSERT INTO requirement(description, id_type, id_project) VALUE (:descrip, :id_type, :id_project)
INSERT INTO requirement(description, id_type, id_project) VALUE ("Necesito internet", 4, 1)
INSERT INTO requirement(description, id_type, id_project) VALUE ("Necesito internet", 4, 2)
INSERT INTO requirement(description, id_type, id_project) VALUE ("Necesito internet", 4, 3)
INSERT INTO requirement(description, id_type, id_project) VALUE ("Tecnico en informatica", 4, 3)

-- Todos los requerimientos de un proyecto en especifico
SELECT * FROM requirement WHERE id_project = :id

-- Crear las vistas para:
  -- Ver todos los proyectos
  -- Crear 1 proyecto
  -- Ver todos los requerimeintos de  1 proyecto
  -- Crear n requerimientos para 1 proyecto
