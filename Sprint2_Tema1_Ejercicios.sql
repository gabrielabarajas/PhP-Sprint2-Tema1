USE tienda;
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
/*24*/
/*25*/
/*26*/
/*27*/
/*28*/
/*29*/
/*30*/
