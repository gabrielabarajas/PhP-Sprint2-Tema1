USE tienda;
USE universidad;

/*1*/ SELECT nombre FROM producto;
/*2*/ SELECT nombre,precio FROM producto;
/*3*/ SELECT * FROM producto;
/*4*/ SELECT nombre,precio as euros ,(precio*1.1) as dólares FROM producto;
/*5*/ SELECT nombre as "nombre de producto" ,precio as euros ,(precio*1.1) as "dólares estadounidenses" FROM producto;
/*6*/ SELECT UPPER(nombre), precio FROM producto;
/*7*/ SELECT LOWER(nombre), precio FROM producto;
/*8*/ SELECT nombre, UPPER(SUBSTRING(nombre,1,2)) FROM fabricante;
/*9*/ SELECT nombre, ROUND(precio,0) as "precio redondeado" FROM producto;
/*10*/ SELECT nombre, FLOOR(precio) as "precio truncado" FROM producto;
/*11*/ SELECT fabricante.codigo FROM fabricante INNER JOIN producto ON fabricante.codigo=producto.codigo_fabricante;
/*12*/ SELECT fabricante.codigo FROM fabricante INNER JOIN producto ON fabricante.codigo=producto.codigo_fabricante GROUP BY fabricante.codigo;
/*13*/ SELECT nombre FROM fabricante order by nombre ASC;
/*14*/ SELECT nombre FROM fabricante order by nombre DESC;
/*15*/ SELECT nombre,precio FROM producto ORDER BY nombre ASC, precio DESC;
/*16*/ SELECT * FROM fabricante LIMIT 0,5;
/*17*/ SELECT * FROM fabricante LIMIT 3,2;
/*18*/ SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 0,1;
/*19*/ SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 0,1;
/*20*/ SELECT nombre FROM producto WHERE codigo_fabricante=2;
/*21*/ SELECT producto.nombre  as producto, precio, fabricante.nombre as fabricante FROM producto INNER JOIN fabricante ON fabricante.codigo=producto.codigo_fabricante;
/*22*/ SELECT producto.nombre  as producto, precio, fabricante.nombre as fabricante FROM producto INNER JOIN fabricante ON fabricante.codigo=producto.codigo_fabricante order by fabricante.nombre ASC;
/*23*/ SELECT producto.codigo as "código producto", producto.nombre as "nombre producto", fabricante.codigo as "código fabricante", fabricante.nombre as "nombre fabricante"FROM producto INNER JOIN fabricante ON fabricante.codigo=producto.codigo_fabricante;
/*24*/ SELECT producto.nombre as "nombre producto", precio,fabricante.nombre as "nombre fabricante" FROM producto INNER JOIN fabricante ON fabricante.codigo=producto.codigo_fabricante order by precio ASC LIMIT 0,1;
/*25*/ SELECT producto.nombre as "nombre producto", precio,fabricante.nombre as "nombre fabricante" FROM producto INNER JOIN fabricante ON fabricante.codigo=producto.codigo_fabricante order by precio DESC LIMIT 0,1;
/*26*/ SELECT producto.codigo, producto.nombre as "nombre producto", fabricante.nombre as "nombre fabricante" FROM producto INNER JOIN fabricante ON fabricante.codigo=producto.codigo_fabricante WHERE fabricante.nombre="Lenovo";
/*27*/ SELECT producto.codigo, producto.nombre as "nombre producto", fabricante.nombre as "nombre fabricante" FROM producto INNER JOIN fabricante ON fabricante.codigo=producto.codigo_fabricante WHERE fabricante.nombre="Crucial" AND producto.precio > 200;
/*28*/ SELECT producto.codigo, producto.nombre as "nombre producto", fabricante.nombre as "nombre fabricante" FROM producto INNER JOIN fabricante ON fabricante.codigo=producto.codigo_fabricante WHERE fabricante.nombre="Asus" OR fabricante.nombre="Hewlett-Packard" OR fabricante.nombre="Seagate"; 
/*29*/ SELECT producto.codigo, producto.nombre as "nombre producto", fabricante.nombre as "nombre fabricante" FROM producto INNER JOIN fabricante ON fabricante.codigo=producto.codigo_fabricante WHERE fabricante.nombre IN ("Asus", "Hewlett-Packard", "Seagate"); 
/*30*/ SELECT producto.nombre as "nombre producto", producto.precio FROM producto INNER JOIN fabricante ON fabricante.codigo=producto.codigo_fabricante WHERE fabricante.nombre like "%e";
/*31*/ SELECT producto.nombre as "nombre producto", producto.precio FROM producto INNER JOIN fabricante ON fabricante.codigo=producto.codigo_fabricante WHERE fabricante.nombre like "%w%";
/*32*/ SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo=producto.codigo_fabricante WHERE producto.precio >= 180 ORDER BY producto.precio DESC, producto.nombre ASC; 
/*33*/ SELECT DISTINCT fabricante.codigo, fabricante.nombre FROM fabricante INNER JOIN producto ON fabricante.codigo=producto.codigo_fabricante;
/*34*/ SELECT fabricante.nombre as fabricante , producto.nombre as producto FROM fabricante LEFT JOIN producto ON fabricante.codigo=producto.codigo_fabricante;
/*35*/ SELECT fabricante.nombre as fabricante , producto.nombre as producto FROM fabricante LEFT JOIN producto ON fabricante.codigo=producto.codigo_fabricante WHERE producto.nombre IS NULL;
/*36*/ SELECT producto.nombre FROM fabricante,producto WHERE fabricante.codigo=producto.codigo_fabricante AND fabricante.nombre = "LENOVO";
/*37*/ SELECT * FROM producto, fabricante WHERE fabricante.codigo=producto.codigo_fabricante AND producto.precio = (SELECT MAX(producto.precio) WHERE fabricante.nombre= "Lenovo");
/*38*/ SELECT producto.nombre, producto.precio FROM producto INNER JOIN fabricante ON fabricante.codigo=producto.codigo_fabricante WHERE producto.precio=(SELECT MAX(producto.precio));
/*39*/ SELECT MIN(producto.precio),producto.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo=producto.codigo_fabricante AND fabricante.nombre = "Hewlett-Packard";
/*40*/ SELECT * FROM producto INNER JOIN fabricante ON fabricante.codigo=producto.codigo_fabricante WHERE producto.precio >= (SELECT MAX(producto.precio) AND fabricante.nombre= "Lenovo");
/*41*/

/*UNIVERSIDAD*/
/*1*/ SELECT persona.apellido1, persona.apellido2, persona.nombre FROM universidad.persona WHERE persona.tipo='alumno' ORDER BY apellido1 ASC, apellido2 ASC, persona.nombre ASC;
/*2*/ SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM universidad.persona WHERE persona.tipo='alumno' AND persona.telefono is null;
/*3*/ SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM universidad.persona WHERE persona.tipo='alumno' AND persona.fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';
/*4*/ SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM universidad.persona WHERE persona.tipo='profesor' AND persona.telefono is null AND persona.nif LIKE '%K';
/*5*/ SELECT * FROM universidad.asignatura WHERE asignatura.cuatrimestre=1 AND asignatura.curso=3 AND asignatura.id_grado=7;
/*6*/ SELECT PE.apellido1, PE.apellido2, PE.nombre, DE.nombre FROM persona PE JOIN profesor PR ON  PE.id=PR.id_profesor JOIN departamento DE ON PR.id_departamento=DE.id;
/*7*/ SELECT A.nombre ,CE.anyo_inicio, CE.anyo_fin FROM asignatura A JOIN alumno_se_matricula_asignatura AM ON AM.id_asignatura=A.id JOIN curso_escolar CE ON CE.id=AM.id_curso_escolar JOIN persona PE ON PE.id=AM.id_alumno WHERE PE.nif='26902806M'; 
/*8*/ SELECT DISTINCT DE.nombre departamento FROM departamento DE JOIN profesor PE ON PE.id_departamento = DE.id JOIN asignatura AG ON AG.id_profesor = PE.id_profesor JOIN grado GR ON GR.id=AG.id_grado WHERE GR.nombre='Grado en Ingeniería Informática (Plan 2015)';
/*9*/ SELECT * FROM persona PE JOIN alumno_se_matricula_asignatura ASM ON PE.id=ASM.id_alumno JOIN curso_escolar CE ON ASM.id_curso_escolar=CE.id WHERE CE.anyo_inicio=2018 AND CE.anyo_fin=2019; 

/*LEFT JOIN RIGHT JOIN*/ 
/*1*/ SELECT DE.nombre, PE.apellido1, PE.apellido2, PE.nombre 
	FROM (SELECT PE.nombre FROM persona PE WHERE PE.tipo='profesor') 
    RIGHT JOIN  profesor PR ON PE.id=PR.id_profesor 
    JOIN departamento DE ON PR.id_departamento = DE.id; 
/*2*/ SELECT persona.nombre, persona.tipo, profesor.id_departamento FROM persona LEFT JOIN profesor ON profesor.id_profesor=persona.id WHERE persona.tipo = 'profesor';
/*3*/ SELECT departamento.nombre, profesor.id_profesor FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento WHERE id_departamento IS NULL;
/*4*/ SELECT persona.nombre, persona.apellido1,persona.apellido2 FROM persona LEFT JOIN asignatura ON persona.id=asignatura.id_profesor WHERE asignatura.nombre IS NULL AND persona.tipo='profesor';
/*5*/ SELECT * FROM asignatura ASI WHERE ASI.id_profesor IS NULL;
/*6*/ SELECT DISTINCT departamento.nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id IS NULL;

/*Consultes Resum*/ 
/*1*/ SELECT COUNT(*) FROM persona WHERE persona.tipo='alumno';
/*2*/ SELECT COUNT(*) FROM persona WHERE persona.fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';
/*3*/ SELECT departamento.nombre departamento,COUNT(profesor.id_profesor) cantidad_profesores FROM departamento JOIN profesor ON departamento.id=profesor.id_departamento group by departamento.nombre ORDER BY cantidad_profesores DESC;
/*4*/ SELECT departamento.nombre departamento,COUNT(profesor.id_profesor) cantidad_profesores FROM departamento LEFT JOIN profesor ON departamento.id=profesor.id_departamento group by departamento.nombre;
/*5*/ SELECT grado.nombre grado,COUNT(asignatura.id_grado) cantidad_asignaturas FROM grado LEFT JOIN asignatura ON grado.id=asignatura.id_grado GROUP BY grado.nombre ORDER BY cantidad_asignaturas DESC;
/*5*/ SELECT grado.nombre grado,COUNT(asignatura.id_grado) cantidad_asignaturas FROM grado LEFT JOIN asignatura ON grado.id=asignatura.id_grado WHERE COUNT(asignatura.id_grado)>40 GROUP BY grado.nombre;