drop table mellow_communitytype;
create table mellow_communitytype(
	tno number primary key,
	title varchar2(50) not null
);

insert into mellow_communitytype values (1,'Notice');
insert into mellow_communitytype values (2,'F&Q');
insert into mellow_communitytype values (3,'Review');

drop sequence mellow_board_seq;
create sequence mellow_board_seq
   start with 1
   increment by 1 
   nocache
   nocycle;

drop table mellow_board;
create table mellow_board(
   bno number primary key,
   tno number,
   title varchar2(200) not null,
   content varchar2(1000) not null,
   image varchar2(200),
   replycnt number default 0,
   writer varchar2(50),
   regdate date default sysdate,
   viewcnt number default 0
);
ALTER TABLE mellow_board ADD constraint mellow_boardtnoforeign_fk foreign key(tno) references mellow_communitytype(tno) on delete cascade;

insert into mellow_board(bno,tno,title,content,writer) values(mellow_board_seq.nextval,1,'테스트','테스트내용','asdfasdf');
