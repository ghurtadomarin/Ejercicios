create table customer (
    fname varchar (20) not null,
    mname varchar (20) not null,
    lname varchar (20) not null,
    mail varchar (100) not null,
    date_of_birth date, 
    primary key (mail));


create table order(
    date_time date,
    order_number int,
    mail varchar(100),
    primary key(order_number, mail),
    foreign key(mail)
    references customer(mail)
);