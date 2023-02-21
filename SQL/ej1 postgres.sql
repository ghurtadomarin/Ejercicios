create table teams (
    id serial,
    nickname varchar (20) not null,
    constraint pk_costumer primary key (id)
);

create table tournaments (
    id serial,
    start_date date,
    end_date date,
    place varchar (100) not null
);

create table matches (
    id varchar (20) not null,
    martch_date date(20),
    id _local int REFERENCES teams (id),
    goals_local int,
    id_visitor int REFERENCES teams (id),
    goals_visitor int,
    id_tournament int REFERENCES tournaments (id)
);

constraint nombrernd foreign key (atributo dentro de la tabla) reference nombre_tabla (atributo)


select * from actors,roles where actors.id = role.actors_id and actors.first_name='Paco' and actors.last_name='León';

select M.name from movies M, directors D, movies_directors where movies_directors = ;




SELECT O.OrderDate, O.OrderDate, OD.OrderID, 
SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS subtotal
FROM Orders O, `Order Details` OD
WHERE O.OrderDate BETWEEN '1998-05-01' AND '1998-05-31' AND OD.OrderID = O.OrderID
GROUP BY O.OrderID;

SELECT id, name 
FROM movies 
WHERE name like 'kill %' or name like '% kill' or name like '% kill %'
or name like 'pirates %' or name like '% pirates' or name like '% pirates %'
or name like 'man %' or name like '% man' or name like '% man %'
or name like 'war %' or name like '% war' or name like '% war %' 
order by name asc;


select M.name
from movies M, directors D, movies_directors MD
where D.id = MD.director_id
and M.id = MD.movie_id
and D.first_name = 'Ethan'
and D.last_name = 'Coen'
and M.year > 1996
order by M.year;


select M.name
from movies M, directors D, movies_directors MD, roles R
where D.id = R.actor_id
and M.id = R.movie_id
and D.first_name = 'Uma'
and D.last_name = 'Thurman'
order by M.year;
5
select * 
from movies M 
where M.id not in(select movie_id from movies_directors)
and M.name like 'W%'
order by M.name;

6
select concat(D.first_name, ' ', D.last_name) as Director_Name, M.name as Movie_Title, concat(A.first_name, ' ', A.last_name) as Actor_Name, M.year, R.role
from directors D, actors A, roles R, movies M, movies_directors MD 
where M.name like 'Lost in Translation'
and M.id = R.movie_id
and M.id = MD.movie_id
and D.id = MD.director_id
and R.actor_id = A.id
order by Actor_Name;

7

select concat(A.first_name, ' ', A.last_name) as Actor_Name, M.name as Movie_Title, M.year
from actors A, movies M, roles R where A.first_name != 'Uma'
and A.last_name != 'Thrurman'
and M.name like 'Kill Bill: Vol. 1'
and A.id = R.actor_id
and M.id = R.movie_id
order by A.first_name;

8
select M.year, M.name from movies M,directors D, movies_directors MD
where D.id = MD.director_id
and 


9

SELECT D.first_name
FROM movies M, movies_directors MD, directors D
WHERE D.id = MD.director_id
and D.first_name like 'Quentin' and D.last_name like 'Tarantino'
GROUP BY M.id;



concat ()
from employees Ethan