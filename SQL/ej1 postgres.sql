create table teams (
    id varchar (20) not null,
    nickname varchar (20) not null,
    constraint pk_costumer primary key (id)
);

create table matches (
    id varchar (20) not null,
    date varchar (20) not null,
    lname varchar (20) not null,
    mail varchar (100) not null,
    address varchar (200) unique,
    date_of_birth date '1900-1-1', --Fecha por defecto 1900-1-1--
    constraint pk_costumer primary key (mail)
);

create table tournament (
    fname varchar (20) not null,
    mname varchar (20) not null,
    lname varchar (20) not null,
    mail varchar (100) not null,
    address varchar (200) unique,
    date_of_birth date '1900-1-1', --Fecha por defecto 1900-1-1--
    constraint pk_costumer primary key (mail)
);