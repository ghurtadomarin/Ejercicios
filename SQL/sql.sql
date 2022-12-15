
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