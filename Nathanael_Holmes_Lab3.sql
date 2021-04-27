--Scripts for Problem 1--
drop table professors cascade;
drop table departments cascade;
drop table work_dept cascade;
drop table projects cascade;
drop table work_in cascade;
drop table graduates cascade;
drop table work_proj cascade;

create table professors(ssn varchar(11) not null,
name varchar(50),
age integer,
rank varchar(30),
specialty varchar(30),
primary key (ssn));

create table departments(dno varchar(10) not null,
chair varchar(11) not null,
dname varchar(30),
office varchar(30),
primary key (dno),
foreign key (chair) references professors (ssn));

create table work_dept(prof varchar(11) not null,
dept varchar(10) not null,
time_pc decimal(6,5),
primary key(ssn, dno),
foreign key (prof) references professors (ssn),
foreign key (dept) references departments (dno));

create table projects(pno varchar(10) not null,
manager varchar (11) not null,
sponsor varchar(30),
start_date date,
end_date date,
budget decimal,
primary key (pno),
foreign key (manager) references professors (ssn));

create table work_in(prof varchar(11) not null,
proj varchar(10) not null,
primary key(ssn, pn),
foreign key (prof) references professors (ssn),
foreign key (proj) references professors (pno));

create table graduates(ssn varchar(11) not null,
major varchar(30) not null,
grad_advisor varchar(11) not null,
advises varchar(11),
name varchar(50),
age integer,
deg_pg varchar(30),
primary key (ssn),
foreign key (major) references departments(dno));

create table work_proj(grad varchar(11) not null,
proj varchar(10) not null,
supervisor varchar(11) not null,
primary key (grad, proj, supervisor),
foreign key (grad) references graduates (ssn),
foreign key (proj) references projects (pno),
foreign key (supervisor) references professors (ssn));


--Scripts for Problem 2--
drop table musicians cascade;
drop table reached_at cascade;
drop table instruments cascade;
drop table plays cascade;
drop table albums cascade;
drop table songs cascade;
drop table perform cascade;

create table musicians(ssn varchar(11) not null,
name varchar(50),
primary key (ssn));

create table reached_at(mus varchar(11) not null,
address varchar(50) not null,
phone_no varchar(15),
primary key (mus, address),
foreign key (mus) references musicians (ssn));

create table instruments(instrid varchar(10) not null,
dname varchar(30),
key varchar(2),
primary key (instrid));

create table plays(mus varchar(11) not null,
instr varchar(10) not null,
primary key (mus, instr),
foreign key (mus) references musicians (ssn),
foreign key (instr) references instruments (instrid));

create table albums(albumidentifier varchar(10) not null,
producer varchar(11) not null,
title varchar(30),
copyrightDate date,
speed varchar(30),
primary key (albumidentifier),
foreign key (producer) references musicians (ssn));

create table songs(songid varchar(10) not null,
appears_on varchar(10) not null,
title varchar(30),
author varchar(50),
primary key (songid),
foreign key (appears_on) references albums (albumidentifier));

create table perform(mus varchar(11) not null,
piece varchar(10) not null,
primary key (mus, piece),
foreign key (mus) references musicians (ssn),
foreign key (piece) references songs (songid));
