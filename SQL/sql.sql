--mariadb
create table customer (
    fname varchar (20) not null,
    mname varchar (20) not null,
    lname varchar (20) not null,
    mail varchar (100) not null,
    address varchar (200) unique,
    date_of_birth date '1900-1-1', 
    constraint pk_costumer primary key (mail));

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
    drop database/table"nombre basae de datos"
    use  base_de_datos   --para entrar en la base de datos
    insert into tabla ()
    select * from tabla
    descri
    insert into tabla (Atributo) value ('algo')
}

--PostgresSQL
