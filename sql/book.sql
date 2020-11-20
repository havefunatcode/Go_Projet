drop table book;
CREATE TABLE Book (
  bookno      INT(4) PRIMARY KEY,
  title       VARCHAR(40),
  publisher   VARCHAR(40),
  price       INT(8) 
);


insert into book (bookno ,title,publisher,price)
values ((select nvl(max(bookno),0)+1 from book)  ,'자바','한빛',900);


select * from book order by bookno desc

delete from book where bookno = ?

        
commit;

select * from book;

String sql = "select * from book order by bookno desc";

String sql = "insert into book (bookno ,title,publisher,price) " + 
       		"values ((select nvl(max(bookno),0)+1 from book)  ,?,?,?)";
       		
String sql = "delete from book where bookno = ?";
 					    
 /* user table */
drop table users;
create table users(
	id varchar(10) constraint users_id_pk primary key auto increment,
	password varchar(10) constraint password_not_null not null,
	name varchar(20),
	role varchar(10) default 'user' check(role in ('user','admin'))
);

/* board table */
drop table board;
create table board(
	seq number(5) constraint board_seq_pk primary key,
	title varchar2(100) constraint title_not_null not null,
	content varchar2(1000),
	regdate date default sysdate,
	cnt number(5) default 0,
	id varchar2(10) constraint id_fk references users
);




##############
rownum
##############

select rownum,ename,sal,hiredate
from emp;

select rownum,ename,sal,hiredate
from emp
order by sal desc;


select rownum,ename,sal,hiredate
from (select * from emp order by sal desc);

select rownum,ename,sal,hiredate
from (select * from emp order by sal desc)
where rownum<4;    // O

##주의 
select rownum,ename,sal,hiredate
from (select * from emp order by sal desc)
where rownum>4;       // X

select rownum,ename,sal,hiredate
from (select * from emp order by sal desc)
where rownum between 1 and 4;    // O


select rownum,ename,sal,hiredate
from (select * from emp order by sal desc)
where rownum between 4 and 7;    //   X

 
select rownum,ename,sal,hiredate
from (select * from emp order by sal desc)
where rownum between 1 and 4; 


##################################
page 처리
##################################

select * from (
select rownum row#,ename,sal,hiredate
from (select * from emp order by sal desc)
)
where row# between 11 and 15; 


                start       end
1page  1~5      5*0+1       +5
2page  6~10     5*1+1       +10
3page  11~15    5*2+1       +15


select * from (
     select rownum row# , deptno,dname,loc 
     from (select * from dept order by deptno)
) where row# between 3 and 5; 




String sql="";
sql="SELECT r, seq,title,contents,writer,time,viewcount " + 
		"FROM(select rownum r, seq,title,contents,writer,time,viewcount " + 
		"from(select * from board order by time desc)) " + 
		"WHERE r>=? and r<=?";//인덱스 1번부터


PreparedStatement st=con.prepareStatement(sql);
int start=((pageNum-1)*count)+1;
int end=(pageNum*count);
st.setInt(1, start);
st.setInt(2,end);

mariadb

drop table book;
CREATE TABLE Book (
  bookno      int(4) PRIMARY KEY auto_increment,
  title       VARCHAR(40),
  publisher   VARCHAR(40),
  price       int(8) 
);

insert into book (title,publisher,price)
values ('자바','한빛',900);

insert into book (title,publisher,price) values ('java programming','한빛',900);
insert into book (title,publisher,price) values ('java ','한빛',900);
insert into book (title,publisher,price) values ('html5','이지스',900);
insert into book (title,publisher,price) values ('HTML5 CSS JavaScript','에이콘',900);

select * from book order by bookno desc;
select * from book order by bookno desc limit 1 , 3;

delete from book where bookno = 1;

select * from Book where title like '%html%' order by bookno desc;

select * from Book where publisher like '%명지%' order by bookno desc;

select * from Book where publisher like '%'||?||'%' " +" order by bookno desc";
commit;
/* user table */
drop table user;
create table user(
	id varchar(10)  primary key,
	password varchar(10)  not null,
	name varchar(20),
	role varchar(10) default 'user' check(role in ('user','admin'))
);
insert into user (id,password,name,role) values ('admin','1234','관리자','admin');
insert into user (id,password,name) values ('java01','1234','홍길동');
select * from user;
delete from user where id = 'java01';
UPDATE user SET password = '1234'  WHERE id ='java01';
select * from user where id='admin' and password='1234';
select * from user where id='java01' and password='1234';



