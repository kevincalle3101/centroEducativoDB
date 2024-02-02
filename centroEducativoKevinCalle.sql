--*Parte 1*

--deficion de las tablas

CREATE TABLE "Cursos" (
  "ID" integer PRIMARY KEY,
  "Nombre_del_Curso" varchar,
  "Departamento_ID" integer,
  "Duracion_del_Curso" integer,
  "Creditos" integer
);

CREATE TABLE "Docentes" (
  "ID" integer PRIMARY KEY,
  "Nombre_del_Docente" varchar,
  "Departamento_ID" integer,
  "Titulo_Academico" varchar
);

CREATE TABLE "Departamentos" (
  "ID" integer PRIMARY KEY,
  "Nombre_del_Departamento" varchar,
  "Ubicacion" varchar
);

CREATE TABLE "Alumnos" (
  "ID" integer PRIMARY KEY,
  "Nombre_del_Alumno" varchar,
  "Fecha_de_Nacimiento" date,
  "Direccion" varchar,
  "Correo_Electronico" varchar
);

CREATE TABLE "Matriculas" (
  "ID" integer PRIMARY KEY,
  "Alumno_ID" integer,
  "Curso_ID" integer,
  "Fecha_de_Matricula" date,
  "Estado_de_Matricula" varchar
);



--*Parte 2*

-- definiciones de las relaciones para las tablas y restricciones de integridad

ALTER TABLE "Cursos" ADD FOREIGN KEY ("Departamento_ID") REFERENCES "Departamentos" ("ID");

ALTER TABLE "Docentes" ADD FOREIGN KEY ("Departamento_ID") REFERENCES "Departamentos" ("ID");

ALTER TABLE "Matriculas" ADD FOREIGN KEY ("Alumno_ID") REFERENCES "Alumnos" ("ID");

ALTER TABLE "Matriculas" ADD FOREIGN KEY ("Curso_ID") REFERENCES "Cursos" ("ID");



--*Parte 3*


--A) Datos insertados en las tablas:

--cursos
INSERT INTO "Cursos" ("ID", "Nombre_del_Curso", "Departamento_ID", "Duracion_del_Curso", "Creditos")
VALUES 
  (1, 'Fisica', 1, 16, 3),
  (2, 'Historia', 2, 14, 3),
  (3, 'Pintura', 3, 12, 4),
  (4, 'Literatura', 2, 18, 3),
  (5, 'Quimica', 1, 15, 4),
  (6, 'Canto', 3, 11, 2);

--docentes
INSERT INTO "Docentes" ("ID", "Nombre_del_Docente", "Departamento_ID", "Titulo_Academico")
VALUES 
  (1, 'Juan', 1, 'Educacion Secundaria'),
  (2, 'Pablo', 2, 'Educacion Secundaria'),
  (3, 'Paola', 3, 'Licenciatura en artes');

--departamentos
INSERT INTO "Departamentos" ("ID", "Nombre_del_Departamento", "Ubicacion")
VALUES 
  (1, 'Matematicas', 'Primer piso'),
  (2, 'Letras', 'Segundo Piso'),
  (3, 'Arte', 'Tercer Piso');

--alumnos
INSERT INTO "Alumnos" ("ID", "Nombre_del_Alumno", "Fecha_de_Nacimiento", "Direccion", "Correo_Electronico")
VALUES 
  (1, 'Estudiante Pepito', '2008-09-25', 'Calle 11 654B', 'pepito@gmail.com'),
  (2, 'Estudiante Pedro', '2008-05-05', 'Calle 95 875C', 'pedro@gmail.com'),
  (3, 'Estudiante Juana', '2008-02-15', 'Calle 78 458E', 'juana@gmail.com'),
  (4, 'Estudiante Ximena', '2008-09-15', 'Calle 12 987A', 'ximena@gmail.com'),
  (5, 'Estudiante Roberto', '2008-10-31', 'Calle 2 87E', 'roberto@gmail.com');

--matriculas
INSERT INTO "Matriculas" ("ID", "Alumno_ID", "Curso_ID", "Fecha_de_Matricula", "Estado_de_Matricula")
VALUES 
  (1, 1, 1, '2024-01-29', 'Activa'),
  (2, 2, 1, '2024-01-31', 'Inactiva'),
  (3, 3, 1, '2024-01-28', 'Activa'),
  (4, 4, 3, '2024-02-01', 'Activa'),
  (5, 5, 3, '2024-01-30', 'Inactiva');

--B) Consultas

--*Alumnos matriculados en un curso en especifico*
SELECT "Alumnos".* FROM "Alumnos" JOIN "Matriculas" ON "Alumnos"."ID" = "Matriculas"."Alumno_ID" JOIN "Cursos" ON "Matriculas"."Curso_ID" = "Cursos"."ID" WHERE "Cursos"."ID" = 3;
--RESULT *TAMBIEN SE ADJUNTA MATERIAL VISUAL*
 ID | Nombre_del_Alumno  | Fecha_de_Nacimiento |   Direccion   | Correo_Electronico
----+--------------------+---------------------+---------------+--------------------
  4 | Estudiante Ximena  | 2008-09-15          | Calle 12 987A | ximena@gmail.com
  5 | Estudiante Roberto | 2008-10-31          | Calle 2 87E   | roberto@gmail.com
(2 filas)


--*Cursos donde un docente esta asignado como instructor*
SELECT "Cursos".* FROM "Cursos" JOIN "Docentes" ON "Cursos"."Departamento_ID" = "Docentes"."Departamento_ID" WHERE "Docentes"."ID" = 1;

--RESULT *TAMBIEN SE ADJUNTA MATERIAL VISUAL*
 ID | Nombre_del_Curso | Departamento_ID | Duracion_del_Curso | Creditos
----+------------------+-----------------+--------------------+----------
  1 | Fisica           |               1 |                 16 |        3
  5 | Quimica          |               1 |                 15 |        4
(2 filas)



--*Parte 4*

--Se adjunta material visual diagramaCentroEducativo.pdf para mostrar el diagrama hecho.