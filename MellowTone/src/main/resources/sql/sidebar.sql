--사이드바 시퀀스
drop sequence sidebar_seq;
create sequence sidebar_seq
	start with 1
	increment by 1
	nocycle
	nocache;
	
--사이드바 프로듀스
drop table sidebar_produce;
create table sidebar_produce(
	no number primary key,
	name varchar2(20) not null,
	url varchar2(40) not null
);

insert into sidebar_produce values (sidebar_seq.nextval,'Self Wedding','/MellowTone/produce');
insert into sidebar_produce values (sidebar_seq.nextval,'MellowTone','#mellowtone');
insert into sidebar_produce values (sidebar_seq.nextval,'PhotoGrapher','#photographer');

--사진정보 카테고리들
drop table sidebar_picture;
create table sidebar_picture(
	no number primary key,
	name varchar2(20) not null,
	url varchar2(40) not null
);

insert into sidebar_picture values (sidebar_seq.nextval,'Regular Snap','?no=4');
insert into sidebar_picture values (sidebar_seq.nextval,'Natural Light Snap','?no=5');
insert into sidebar_picture values (sidebar_seq.nextval,'Studio Snap','?no=6');
insert into sidebar_picture values (sidebar_seq.nextval,'Outer Snap','?no=7');

drop table picture;
create table picture(
	no number primary key,
	name varchar2(40) not null,
	path varchar2(40) not null,
	content LONG,
	price number not null,
	foreign key(no) references sidebar_picture(no)
);


insert into picture values('4','REGULAR SNAP','/resources/image/regular.png','1인 작가 촬영, 메이크업샵부터 예식이 마무리될 때까지 촬영<br>
																		가족 및 친지,친구들과의 촬영 포함(원판) <br>압축 앨범으로 가죽자켓이며 700~1000장 촬영<br>
																	 하드커버화보앨범 (14x11) 30p-3권 <br>원본 + 세부보정본 디지털파일<br>',800000);
insert into picture values('5','NATURAL LIGHT SNAP','/resources/image/natural.png','원하는 컨셉에 따라 4곳의 장소이동으로 촬영 진행<br>4가지(의상)컨셉 / 촬영시간 5~6시간 내외이며 상황에 따라 변경 가능(이동시간 포함)<br>
																		    평일/주말 촬영가능<br> 50장 세부보정 / 헤어메이크업 미포함<br>
																			원본(600장 내외) + 세부보정본(50장)디지털파일<br>화보앨범 추가(추가비용발생)<br>',700000);
insert into picture values('6','STUDIO SNAP','/resources/image/studio.png','작가 스튜디오, 스튜디오 대여, 펜션 등 촬영 가능<br>원하는(의상)컨셉/ 촬영시간 3~4시간 내외<br>
																   원본(300장내외) + 세부보정본(30장)디지털파일<br>헤어메이크업 포함<br>',600000);
insert into picture values('7','OUTER SNAP','/resources/image/outer.png','원하는 컨셉에 따라 2~3곳의 장소이동으로 촬영 진행<br>2가지(의상)컨셉 / 촬영시간 3~4시간 내외이며 상황에 따라 변경 가능(이동시간 포함)<br>
																 웨딩소품 무료대여(부케,화관,부토니에,헤어장식,보타이)<br>평일/주말 촬영 가능<br>희망의상 직접준비 / 작가 소장드레스 대여가능<br>
																 원본(400장 내외) + 세부보정본(30장)디지털파일<br>화보앨범 추가(추가비용 발생)<br>',700000);

--사이드바 갤러리
drop table sidebar_gallery;
create table sidebar_gallery(
	no number primary key,
	name varchar2(20) not null,
	url varchar2(40) not null
);

insert into sidebar_gallery values (sidebar_seq.nextval,'Regular Snap','./gallery.do?action=1');
insert into sidebar_gallery values (sidebar_seq.nextval,'Natural Light Snap','./gallery.do?action=2');
insert into sidebar_gallery values (sidebar_seq.nextval,'Studio Snap','./gallery.do?action=3');
insert into sidebar_gallery values (sidebar_seq.nextval,'Outer Snap','./gallery.do?action=4');

--사이드바 아이템
drop table sidebar_item;
create table sidebar_item(
	no number primary key,
	name varchar2(20) not null,
	url varchar2(40) not null
);

insert into sidebar_item values (sidebar_seq.nextval,'Dress','./item.do?action=dress');
insert into sidebar_item values (sidebar_seq.nextval,'Tuxedo','./item.do?action=tuxedo');
insert into sidebar_item values (sidebar_seq.nextval,'Accessory','./item.do?action=accessory');

