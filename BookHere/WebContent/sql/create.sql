create table member(
id varchar2(40) primary key,
password varchar2(40),
name varchar2(40),
phonenumber varchar2(60),
mail varchar2(40),
pic varchar2(100),
likecount NUMBER,
owner NUMBER);

create table bookstore(
branchid number primary key,
storename varchar2(20),
branchname varchar2(100),
latitude varchar2(20),
longitude varchar2(20),
address varchar2(100),
phonenum varchar2(20),
website varchar2(150));


create table stock (
branchid number,
foreign key (branchid) references bookstore(branchid) on delete cascade,
id varchar2(20),
foreign key (id) references member(id) on delete cascade,
isbn varchar2(30),
foreign key (isbn) references book(isbn) on delete cascade,
stock number,
primary key(branchid, isbn)
);

create table book(
isbn varchar2(30) primary key,
prodid varchar2(30),
bookcd varchar2(30),
bookname varchar2(100),
author varchar2(100),
publisher varchar2(100),
bookprice number,
saleprice number,
bookintro varchar2(500),
img varchar(500));

create table bookshelf(
bookshelfnum varchar2(40) primary key,
id VARCHAR2(40),
likenum varchar2(20),
FOREIGN  KEY (id) REFERENCES member(id));


create table mybook(
id VARCHAR2(40),
isbn varchar2(30),
star number(20),
memo CLOB,
mdate date,
FOREIGN  KEY (id) REFERENCES member(id),
FOREIGN  KEY (isbn) REFERENCES book(isbn),
PRIMARY KEY(id,isbn));


create table mybook(
id VARCHAR2(40),
isbn varchar2(30),
star number(20),
memo CLOB,
mdate date,
FOREIGN  KEY (id) REFERENCES member(id),
FOREIGN  KEY (isbn) REFERENCES book(isbn),
PRIMARY KEY(id,isbn));

create table mywish(
id VARCHAR2(40),
isbn varchar2(30),
FOREIGN  KEY (id) REFERENCES member(id),
FOREIGN  KEY (isbn) REFERENCES book(isbn),
PRIMARY KEY(id,isbn));
