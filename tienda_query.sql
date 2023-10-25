use tienda;
select nombre from producto;
select nombre, precio from producto;
select * from producto;
select nombre, concat(precio,"€"), concat(precio,"$") from producto where precio;
select nombre, concat(precio,"€") as euros, concat(precio,"$") as dollars   from producto where precio;
select upper(nombre), precio from producto;
select lower(nombre), precio from producto;
select nombre, upper(substring(nombre, 1, 2)) as Nombre_2_mayusculas from fabricante;
select nombre, precio, round(precio, 0) as redondeado from producto;
select nombre, precio, round(precio) as sin_decimal from producto;
select codigo_fabricante, codigo_f from producto inner join fabricante on codigo_fabricante=codigo_f;
select distinct codigo_fabricante, codigo_f from producto inner join fabricante on codigo_fabricante=codigo_f;
select nombre from fabricante order by nombre;
select nombre from fabricante order by  nombre desc;
select nombre from producto order by nombre where nombre (select precio from producto order by precio desc); 
select * from fabricante limit 0 , 5;
select * from fabricante limit 3 , 2;
select nombre, precio from producto order by precio asc limit 0, 1;