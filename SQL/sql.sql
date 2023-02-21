
--mariadb
create table customer (
    fname varchar (20) not null,
    mname varchar (20) not null,
    lname varchar (20) not null,
    mail varchar (100) not null,
    address varchar (200) unique,
    date_of_birth date dafault'1900-1-1',
    constraint pk_costumer primary key (mail)
    constraint uniq_address unique (address)
    );

create table order (
    date_time date timestamp,
    order_number int auto_increment ,
    mail varchar(100),
    primary key(order_number, mail),
    constraint fk_order foreign key(mail) references customer(mail)
);

create table product (

)


comandos mariadb{
    
}


--PostgressSQL
create table customer (
    fname varchar (20) not null,
    mname varchar (20) not null,
    lname varchar (20) not null,
    mail varchar (100) not null,
    address varchar (200) unique,
    date_of_birth date '1900-1-1', --Fecha por defecto 1900-1-1--
    constraint pk_costumer primary key (mail)
);

create table order (
    number serial primary key,
    date timestamp default  now(),
    email varchar(150),
    constraint fk_orders foreign key (email) references customer (email)
);

create table product (
    code varchar(5) primary key,
    name varchar(100) not null,
    price money,
);

--Comandos PostgresSQL
\d tabla --Show table
insert into tabla (atributo1,"atributo2",atributo3) values ('atributo', 'atributo', 'etc') --Insertar en tabla
select atributo from tabla --Show atributo suelto
delete from tabla where atributo='algo' --Borrar algo de una tabla
upgrade orders set number 2 where number=3


  select D.name, avg(E.salary)
from employees E, departments D
where E.dept_num = D.num
group by D.name;


--select departments, ocupation, number_of_employees 


select E.surname, O.name 
from employees E, occupations O, departments D
where E.occu_code = O.code AND
E.dept_num = D.num AND
D.name = 'SALES';



select O.name, count(*)
from employees E, occupations O, departments D
where E.occu_code = O.code AND
E.dept_num = D.num AND
D.name = 'SALES'
group BY O.name;




--11
select D.name, O.name, count(E.num)
from employees E, occupations O, departments D
where E.occu_code = O.code AND
E.dept_num = D.num
group BY D.name, O.name
order BY D.name, O.name;



--
SELECT E.name, E.surname, E.start_date, count(*) OVER ()
FROM employees E ORDER BY start_date;

SELECT rank() OVER (ORDER BY start_date), name, surname from employees;

Ejemplo ejercicios

select * from actors where 
last_name ='Willis'
order by last_name;


select M.id, M.name
from movies M 
where M.name like '% kill %' 
or M.name like '% man %' 
or M.name like '% war %' 
or M.name like '% pirates %'
or M.name like 'Kill %' 
or M.name like 'Man %' 
or M.name like 'War %' 
or M.name like 'Pirates %'
or M.name like '% kill' 
or M.name like '% man' 
or M.name like '% war' 
or M.name like '% pirates'
or M.name like 'Kill' 
or M.name like 'Man' 
or M.name like 'War' 
or M.name like 'Pirates'
order by M.name;

3.

select M.name 
from movies M, directors D, movies_directors MD 
where M.id = MD.movie_id 
and D.id = MD.director_id 
and D.first_name ='Ethan' 
and D.last_name ='Coen'
order by M.name;

4.

select M.name, M.year
from movies M, directors D, movies_directors MD
where M.id = MD.movie_id 
and D.id = MD.director_id 
and D.first_name ='Ethan' 
and D.last_name ='Coen'
and M.year > 1996
order by M.year;


select * from movies M 
where M.id not in (
    select movie_id
    from movies_directors)
and M.name like 'W%'
order by M.name;

select 
concat(D.first_name, ' ', D.last_name) as Director_Name,
M.name as Movie_Title,
concat(A.first_name, ' ', A.last_name) as Actor_Name,
M.year, 
R.role
from directors D, actors A, roles R, movies M, movies_directors MD 
where M.name like 'Lost in Translation'
and M.id = MD.movie_id
and M.id = R.movie_id
and R.actor_id = A.id
and D.id = MD.director_id
order by Actor_Name;

select
concat(A.first_name, ' ', A.last_name) as Actor_Name,
M.name as Movie_Title,
M.year
from actors A, movies M, roles R
where A.first_name != 'Uma'
and A.last_name != 'Thrurman'
and A.id = R.actor_id
and M.name like 'Kill Bill: Vol. 1'
and M.id = R.movie_id
order by A.first_name;

select M.year, M.name 
from movies M, directors D, movies_directors MD 
where M.id = MD.movie_id 
and D.id = MD.director_id
and D.first_name like 'Quentin'
and D.last_name like 'Tarantino'
order by M.year, M.name; 

select concat(D.first_name, ' ', D.last_name) as Director_Name, 
count(M.name) as Num_Movies
from movies M, directors D, movies_directors MD 
where M.id = MD.movie_id 
and D.id = MD.director_id
and D.first_name like 'Quentin'
and D.last_name like 'Tarantino'
group by D.id; 

select A.first_name, A.last_name, count(M.id) as Num_Movies
from movies M, actors A, roles R 
where M.id = R.movie_id
and A.id = R.actor_id
and A.last_name like 'Puent%'
group by A.id
order by Num_Movies desc;

SELECT a.first_name, a.last_name, a.gender
FROM actors a
JOIN roles r ON a.id = r.actor_id
JOIN movies m ON r.movie_id = m.id
WHERE m.name = 'The Dark Knight';

select to_char(O.OrderDate, 'YYYY') OrderYear, sum(OD.UnitPrice*OD.Quantity*(1-OD.Discount)) Subtotal
from Orders O, `Order Details` OD 
where O.OrderID = OD.OrderID
group by OrderYear;

SELECT a.first_name, a.last_name, a.gender
FROM actors a
JOIN roles r ON a.id = r.actor_id
JOIN movies m ON r.movie_id = m.id
WHERE m.name = 'The Dark Knight';

7
select concat(A.first_name, ' ', A.last_name) as Actor_Name, M.name as Movie_Title, M.year
from actors A, movies M, roles R
where A.first_name != 'Uma'
and A.last_name != 'Thrurman'
and A.id = R.actor_id
and M.name like 'Kill Bill: Vol. 1'
and M.id = R.movie_id
order by A.first_name;

8
select M.year, M.name 
from movies M, directors D, movies_directors MD 
where D.first_name like 'Quentin'
and D.last_name like 'Tarantino'
and M.id = MD.movie_id 
and D.id = MD.director_id
order by M.year, M.name; 


examen
ejercicio 1

select M.name, M.rank from movies M, movies_genres MG
where MG.movie_id = M.id 
and MG.genre like "Horror" 
order by M.rank desc limit 10;

Ejercicio 2
select M.name
from movies M 
where M.name like '% Reo %'
or M.name like 'Reo' 
or M.name like '% Reo %' 
or M.name like 'Reo %'
or M.name like '% reos'  
order by M.name;

Ejercicio 3

select M.name from movies M, movies_genres MG
where MG.movie_id = M.id 
and M.name like 'Upper%'
order by M.rank desc limit 10;

and MG.genre null



select M.name
from movies M, directors D, movies_directors MD, actors A, roles R
where M.id = MD.movie_id 
and R.actor_id = A.id
and R.movie_id = M.id
and D.id = MD.director_id
and D.first_name like 'Francis Ford'
and D.last_name like 'Coppola'
and A.first_name like 'Marlon'
and A.last_name like 'Brando'
; 


ejercicio 5
select concat(A.first_name, ' ', A.last_name) as Actor_Name, count()
from directors D, actors A, roles R, movies M, movies_directors MD 
where A.first_name like 'Gina'
and A.last_name like 'Lollobrigida'
and M.id = MD.movie_id
and M.id = R.movie_id
and R.actor_id = A.id
group by A.id
;



select concat(A.first_name, ' ', A.last_name) as Fullname, count(M.id) as Num_Movies
from movies M, actors A, roles R 
where M.id = R.movie_id
and A.id = R.actor_id
and A.first_name like 'Gina'
and A.last_name like 'Lollobrigida'
group by A.id
order by Num_Movies desc;

northwind
2

select to_char(O.OrderDate, 'YYYY') OrderYear, sum(OD.UnitPrice*OD.Quantity*(1-OD.Discount)) Subtotal
from `Order Details` OD , Orders O
where O.OrderID = OD.OrderID
group by OrderYear;

3
select O.ShipCountry, sum(OD.UnitPrice*OD.Quantity*(1-OD.Discount)) Subtotal
from Orders O, `Order Details` OD
where OD.OrderID = O.OrderID
group by O.ShipCountry;

select O.ShipCountry, sum(OD.UnitPrice*OD.Quantity*(1-OD.Discount)) Subtotal
from Orders O, `Order Details` OD
where OD.OrderID = O.OrderID
group by O.ShipCountry;


select t.name, c.name
from countries c, towns t
where t.country = c.id
GROUP BY c.name, t.name;


northwind
4
select E.LastName, E.FirstName, E.EmployeeID, sum(OD.UnitPrice*OD.Quantity*(1-OD.Discount)) Subtotal
from Orders O, `Order Details` OD, Employees E 
where E.EmployeeID = O.EmployeeID
and O.OrderID = OD.OrderID 
group by EmployeeID
order by Subtotal desc;

5
select E.LastName, E.FirstName, E.EmployeeID, O.ShipCountry, sum(OD.UnitPrice*OD.Quantity*(1-OD.Discount)) Subtotal
from Orders O, `Order Details` OD, Employees E
where E.EmployeeID = O.EmployeeID
and O.OrderID = OD.OrderID
group by O.ShipCountry, E.EmployeeID
order by O.ShipCountry, Subtotal desc;

6.
select C.CategoryID, C.CategoryName, sum(OD.UnitPrice*OD.Quantity*(1-OD.Discount)) Subtotal
from Categories C, Products P, Orders O, `Order Details` OD 
where O.OrderID = OD.OrderID
and C.CategoryID = P.CategoryID
and P.ProductID = OD.ProductID
group by C.CategoryID;

7.
select C.CategoryID, C.CategoryName, sum(OD.UnitPrice*OD.Quantity*(1-OD.Discount)) Subtotal
from Categories C, Products P, Orders O, `Order Details` OD
where P.ProductID = OD.ProductID
and C.CategoryID = P.CategoryID
and O.OrderID = OD.OrderID
group by C.CategoryID;

8.
select O.OrderID, P.ProductID, P.ProductName, OD.UnitPrice, OD.Quantity, OD.Discount, (OD.UnitPrice*OD.Quantity*(1-OD.Discount)) ExtendedPrice
from Orders O, Products P, `Order Details` OD
where O.OrderID = OD.OrderID
and OD.ProductID =P.ProductID
and O.OrderID =10248;

9.
select sum(OD.UnitPrice*OD.Quantity*(1-OD.Discount)) TotalPrice
from Products P, Orders O, `Order Details` OD
where O.OrderID = OD.OrderID
and P.ProductID = OD.ProductID
and O.OrderID =10248;

16.
select ProductID, ProductName, avg (UnitPrice)as UnitPrice
from Products
group by ProductID
order by UnitPrice DESC
limit 25;

19
select City
from Customers
where City like 'Barcelona';

21.
select C.CompanyName, count(O.OrderID) as NumOrders
from Orders O, Customers C
where C.CustomerID = O.CustomerID
group by O.CustomerID
ORDER BY NumOrders desc
limit 1;



SELECT team.name as name, t.name as name, c.name as name
FROM teams team 
left outer JOIN towns t ON team.town = t.id 
left outer JOIN countries c ON t.Country = c.id
GROUP BY c.name, team.name, t.name
order by t.name ,team.name;




SELECT t.name as name, count(te.name) as num
FROM towns t
left outer JOIN teams as te ON te.town = t.id
where te.name is null
group by t.name
order by t.name;



select o.OrderID, o.OrderDate, o.RequiredDate, c.CustomerID, c.CompanyName, c.Address, c.City, c.Region, c.PostalCode, c.Country, o.ShippedDate, sh.CompanyName, o.Freight, o.ShipAddress, o.ShipCity, o.ShipRegion, o.ShipPostalCode, o.ShipCountry, concat(e.FirstName, ' ', e.LastName) SalesPerson
from Orders o, Customers c, Shippers sh, Employees e
where o.CustomerID = c.CustomerID
and o.EmployeeID = e.EmployeeID
and sh.ShipperID = o.ShipVia
and o.OrderID = 10248
group by o.OrderID;


Muestra las unidades en stock de los productos en los distintos almacenes (America, Asia y Europa)

select C.CompanyName, count(O.OrderID) as NumOrders
from Orders O, Customers C
where C.CustomerID = O.CustomerID
group by O.CustomerID
ORDER BY NumOrders desc
limit 1;


create database applyingtocollege;
\c applyingtocollege


create table colleges (
 name VARCHAR(10) primary key,
 state VARCHAR(2),
 enrollment int
);


create table students (
 id int primary key,
 name VARCHAR(20),
 surname VARCHAR(20),
 mark real,
 size_high_school int
);


create table applies (
 stid int,
 college VARCHAR(10),
 major VARCHAR(20),
 decision boolean,
 constraint applies_pk primary key (stid, college, major),
 constraint applies_students_fk foreign key (stid) references students (id),
 constraint applies_colleges_fk foreign key (college) references colleges (name)
);





select Mymark(select s.mark from students s)
from students;




(SELECT MIN(mark) FROM students) union (SELECT MAX(mark) FROM students);

(SELECT MIN(mark) FROM students) union (SELECT MAX(mark) FROM students);

SELECT (SELECT MAX(mark) FROM students) - (SELECT MIN(mark) FROM students) AS difference;


select S.id, S.surname, S.name, count(distinct A.college)
from students S
left OUTER JOIN applies A ON A.stid = S.id
GROUP BY S.id
HAVING count(A.college) > 0
ORDER BY S.surname, S.name, S.id;

select  S.surname, S.name, S.id, count(distinct A.college)
from students S
left OUTER JOIN applies A ON A.stid = S.id
GROUP BY S.id
ORDER BY S.surname;



concat (E.name, '', E.surname) as Fullname
from employees E;