--Scripts for Problem 1--
drop table graduates cascade;
drop table professors cascade;
drop table projects cascade;
drop table departments cascade;

create table graduates(ssn varchar(11) not null,
name varchar(50),
age integer,
deg_pg varchar(30),
primary key (ssn));

create table professors(ssn varchar(11) not null,
name varchar(50),
age integer,
rank varchar(30),
specialty varchar(30)
primary key (ssn));

create table departments(dno varchar(10) not null,
dname varchar(30),
office varchar(30),
primary key (dno));

create table projects(pno varchar(10) not null,
sponsor varchar(50),
start_date date,
end_date date,
budget decimal));


--Scripts for Problem 2--
