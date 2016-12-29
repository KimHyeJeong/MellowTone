drop table member;
create table member(
	no number,
	id varchar2(20) primary key,
	password varchar2(30) not null,
	password_ck varchar2(30) not null,
	name varchar2(20) not null,
	post varchar2(20) not null,
	address1 varchar2(100) not null,
	address2 varchar2(100) not null,
	phone varchar2(30) not null,
	email varchar2(30) not null
);

drop sequence member_seq;
create sequence member_seq
   start with 1
   increment by 1
   nocycle
   nocache;

   
insert into member values(member_seq.nextval,'boxer1992','1234','1234','채효원','440-321','서울시 금천구 가산동','신한이노플렉스','010-7393-1976','chw120424@naver.com');   
   
   
select * from member;