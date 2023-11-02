SELECT apellido1, apellido2, nombre FROM persona ORDER BY apellido1;
SELECT nombre, apellido1, apellido2, telefONo FROM persona WHERE telefONo IS NULL;
SELECT nombre, fecha_nacimiento FROM persona WHERE fecha_nacimiento like '1999%';
SELECT nombre, apellido1, apellido2, nif, tipo FROM persona INNER JOIN profesor ON id = id_profesor WHERE nif like '%K' and telefONo IS NULL;
SELECT id, nombre, curso, cuatrimestre, id_grado FROM asignatura WHERE curso = 3 and cuatrimestre = 1 and id_grado = 7;
SELECT ser.apellido1, ser.apellido2, ser.nombre, d.nombre FROM persona ser INNER JOIN profesor p ON ser.id = p.id_profesor INNER JOIN departamento d ON d.id = p.id_departamento ORDER BY ser.apellido1;
/*1.7*/SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin 
FROM asignatura a
INNER JOIN  alumno_se_matricula_asignatura ama ON ama.id_asignatura = a.id 
INNER JOIN curso_escolar ce ON ce.id = ama.id_curso_escolar 
INNER JOIN persona p ON p.id = ama.id_alumno 
WHERE p.nif = '26902806M'; 
/*1.8*/SELECT d.nombre FROM departamento d 
INNER JOIN profesor p ON d.id = p.id_departamento 
INNER JOIN asignatura a ON a.id_profesor = p.id_profesor
INNER JOIN grado g ON g.id = a.id_grado
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
/*1.9*/SELECT pers.nombre, a.nombre, ce.anyo_inicio FROM persona pers
INNER JOIN alumno_se_matricula_asignatura ama ON pers.id = ama.id_alumno
INNER JOIN curso_escolar ce ON ce.id = ama.id_curso_escolar
INNER JOIN asignatura a ON a.id = ama.id_asignatura
WHERE ce.anyo_inicio = '2018' and ce.anyo_fin = '2019';
/*2.1*/SELECT d.nombre, pers.apellido1, pers.apellido2, pers.nombre FROM persona pers 
INNER JOIN profesor p ON pers.id = p.id_profesor
RIGHT join departamento d ON d.id = p.id_departamento
ORDER BY d.nombre, pers.apellido1, pers.nombre;
/*2.2*/SELECT pers.apellido1, pers.apellido2, pers.nombre FROM persona pers 
INNER JOIN profesor p ON pers.id = p.id_profesor
LEFT JOIN departamento d ON d.id = p.id_departamento WHERE p.id_departamento IS NULL;
/*2.3*/SELECT d.nombre FROM persona pers 
INNER JOIN profesor p ON pers.id = p.id_profesor
LEFT JOIN departamento d ON d.id = p.id_departamento WHERE p.id_profesor IS NULL;
/*2.4*/SELECT  pers.apellido1, pers.apellido2, pers.nombre FROM persona pers 
INNER JOIN profesor p ON pers.id = p.id_profesor
LEFT JOIN asignatura a ON a.id_profesor = p.id_profesor WHERE a.id IS NULL;
/*2.5*/SELECT nombre, id_profesor FROM asignatura WHERE id_profesor IS NULL;
/*2.6*/SELECT d.nombre FROM departamento d 
INNER JOIN profesor p ON d.id = p.id_departamento
INNER JOIN asignatura a ON a.id_profesor = p.id_profesor WHERE a.id IS NULL;
/*3.1*/SELECT count(nombre) FROM persona WHERE tipo = 'alumno';
/*3.2*/SELECT count(nombre) FROM persona WHERE fecha_nacimiento LIKE '1999%';
/*3.3*/SELECT d.nombre, count(p.id_profesor) FROM persona pers 
INNER JOIN profesor p ON p.id_profesor = pers.id
INNER JOIN departamento d ON d.id = p.id_departamento
GROUP BY d.nombre ORDER BY count(p.id_profesor) DESC;
/*3.4*/SELECT d.nombre, count(p.id_profesor) FROM persona pers 
INNER JOIN profesor p ON p.id_profesor = pers.id
RIGHT JOIN departamento d ON d.id = p.id_departamento
GROUP BY d.nombre;
/*3.5*/SELECT g.nombre, count(a.nombre) FROM asignatura a 
RIGHT JOIN grado g on a.id_grado = g.id 
GROUP BY g.nombre ORDER BY count(a.nombre) DESC;
/*3.6*/SELECT g.nombre, count(a.nombre) FROM asignatura a 
RIGHT JOIN grado g on a.id_grado = g.id 
WHERE count(a.nombre) >= 40 GROUP BY g.nombre ORDER BY count(a.nombre) DESC;