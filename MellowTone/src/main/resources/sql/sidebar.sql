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

																 
--사이드바 아이템
drop table sidebar_item;
create table sidebar_item(
	no number primary key,
	name varchar2(20) not null,
	url varchar2(40) not null
);

insert into sidebar_item values (sidebar_seq.nextval,'Dress','/MellowTone/item?no=8');
insert into sidebar_item values (sidebar_seq.nextval,'Tuxedo','/MellowTone/item?no=9');
insert into sidebar_item values (sidebar_seq.nextval,'Accessory','/MellowTone/item?no=10');


--아이템테이블
drop table item;
create table item(
	name varchar2(40) primary key,
	listpath varchar2(40),
	detailpath varchar2(40),
	content LONG,
	price number not null,
	count number not null,
	no number,
	foreign key(no) references sidebar_item(no)
);

insert into item values('Apieu','/resources/image/wedding.png','/resources/image/wedding_detail.png','올 화이트로 순수함을 표현해 주며 <br>
																					드레스의 트임을 이용해 다양한 느낌을 연출해줍니다.<br>
																					또한 코르셋 장착으로 몸매를 보정해줌으로써<br>
																					많은 여성고객들이 찾는 드레스 입니다.<br>',110000,2,8);
insert into item values('Wendy lace','/resources/image/mini.png','/resources/image/mini_detail.png','오프숄더 느낌의 레이스 탑과 풍성한 밑단에 포인트를 준 드레스입니다.<br>
																				     이 드레스는 발랄함과 우아함을 동시에 표현 가능하며<br>
																				     기장이 다른 미니드레스에 비해 길게 나와<br>
																				     다리에 자신 없는 분들, 키가 크신 분들도 충분히 입으실 수 있습니다.<br>
																				     그리고 여러가지 소품과의 콜라보레이션이 맞아 <br>
																					더 이쁘게 연출가능한 드레스입니다.<br>',80000,2,8);
insert into item values('Romentic Holic','/resources/image/neck.png','/resources/image/neck_detail.png','레이스와 은은한 비즈 디테일이 원단에 그레이드 되어<br>
																					     신비로움과 아름다움을 연출해주는 드레스입니다.<br>
																					     플라워 모티브 레이스가 하이넥라인까지 연결되어 있으며<br>
																					     코르셋 끈 여밈 방식이라 사이즈 조절 가능합니다.<br>
																						신비로운 느낌을 연출해줄 수 있어<br>
																						Apieu드레스와 마찬가지로 여성고객들이 많이 찾는 드레스입니다.<br>',100000,1,8);
insert into item values('Gold Rose','/resources/image/gold.png','/resources/image/gold_detail.png', '골드 컬러의 자수 레이스가 전체를 감싸고 있는 스퀘어넥과 <br>
																				     샤스커트를 감싼 밑단이 우아하면서도 경쾌한 느낌을 주는 드레스입니다.<br>
																				     이 드레스는 넥라인이 상체가 날씬해 보이는 효과가 있습니다.<br>
																				     살구톤의 안감이 완전 화이트에 비해 덜 부담스럽고, 빈티지한 느낌을 줍니다.<br>',100000,2,8);

insert into item values('JBT-02','/resources/image/tuxedo.png','/resources/image/tuxedo_detail.png','	95 Size  어깨-44.5cm , 가슴둘레-100.3cm , 허리둘레-86.3cm , 상의기장-71.0cm<br>
																					100 Size 어깨-45.7cm , 가슴둘레-106.7cm , 허리둘레-94.0cm , 상의기장-72.5cm<br>
																					105 Size 어깨-47.0cm , 가슴둘레-110.5cm , 허리둘레-98.0cm , 상의기장-74.0cm<br>
																					110 Size 어깨-48.3cm , 가슴둘레-114.3cm , 허리둘레-103.0cm , 상의기장-75.0cm<br>',100000,2,9);
insert into item values('JBT-04','/resources/image/tuxedo2.png','/resources/image/tuxedo2_detail.png','95 Size  어깨-44.5cm , 가슴둘레-100.3cm , 허리둘레-86.3cm , 상의기장-71.0cm<br>
																				   100 Size 어깨-45.7cm , 가슴둘레-106.7cm , 허리둘레-94.0cm , 상의기장-72.5cm<br>
																				   105 Size 어깨-47.0cm , 가슴둘레-110.5cm , 허리둘레-98.0cm , 상의기장-74.0cm<br>
																				   110 Size 어깨-48.3cm , 가슴둘레-114.3cm , 허리둘레-103.0cm , 상의기장-75.0cm<br>',100000,1,9);
insert into item values('JBT-06','/resources/image/tuxedo3.png','/resources/image/tuxedo3_detail.png','95 Size  어깨-44.5cm , 가슴둘레-100.3cm , 허리둘레-86.3cm , 상의기장-71.0cm<br>
																				   100 Size 어깨-45.7cm , 가슴둘레-106.7cm , 허리둘레-94.0cm , 상의기장-72.5cm<br>
																				   105 Size 어깨-47.0cm , 가슴둘레-110.5cm , 허리둘레-98.0cm , 상의기장-74.0cm<br>
																				   110 Size 어깨-48.3cm , 가슴둘레-114.3cm , 허리둘레-103.0cm , 상의기장-75.0cm<br>',100000,3,9);

insert into item values('white bouquet','/resources/image/bouquet.png','/resources/image/bouquet_detail.png','화이트 계열 꽃들로 구성되어 있어 순백의 느낌과 <br>
											    											생화처럼 싱싱한 연출을 가능하게 합니다.<br>
																							심플한 디자인으로 사랑스러우면서 예쁜 신부로 만들어주는 부케입니다.<br>
																							웨딩촬영시 사용하면 예쁘기 때문에 많은 고객들이 찾는 부케입니다.<br>',10000,2,10);
insert into item values('pink butonie','/resources/image/butonie.png','/resources/image/butonie_detail.png','화이트계열의 꽃에 붉은 빛이 도는 효과를 주어 <br>
											   											     화이트 계열의 턱시도와의 연출이 잘 어울리는 부토니에입니다.<br>
																						   부바르디아 숲속 오리지널 부토니에로 직접 디자인하여 제작을 의뢰합니다.<br>
																						  전부 수입 조화로 제작하는 제품이기때문에 하이퀄리티의 조화제품으로 어떤 컨셉에도 화사하게 연출 가능합니다.<br>',10000,1,10);
insert into item values('silk veil','/resources/image/veil.png','/resources/image/veil_detail.png','심플한 라인으로 마무리한 웨딩베일입니다.<br>
																				망사재질로 제작된 이 베일은 심플하면서도 퓨어한 스타일로 <br>
																				셀프웨딩 촬영시 유용하게 사용할 수 있으며 다양한 연출이 가능합니다.<br>
																				U자핀 또는 실핀으로 고정하여 사용하는 제품르오 청순한 분위기 또한 낼 수 있습니다.<br>
										     									 ','16000','1','10');
insert into item values('ample veil','/resources/image/veil2.png','/resources/image/veil2_detail.png','요즘 아무 무늬없는 무지스타일의 베일이 유행인데요<br>
																					 얇지만 풍성한 느낌이 심플하고 이쁜 숏베일입니다.<br>
																					재질이 조금 뻣뻣하여 보다 풍성한 느낌을 낼 수 있습니다.<br>
																					 고정핀과 분리되어 탈부착이 쉽습니다.<br>',10000,2,10);
																 
																 
		
																					
--사이드바 갤러리
drop table sidebar_gallery;
create table sidebar_gallery(
	no number primary key,
	name varchar2(20) not null,
	url varchar2(40) not null
);

insert into sidebar_gallery values (sidebar_seq.nextval,'Regular Snap','/MellowTone/gallery?no=11');
insert into sidebar_gallery values (sidebar_seq.nextval,'Natural Light Snap','/MellowTone/gallery?no=12');
insert into sidebar_gallery values (sidebar_seq.nextval,'Studio Snap','/MellowTone/gallery?no=13');
insert into sidebar_gallery values (sidebar_seq.nextval,'Outer Snap','/MellowTone/gallery?no=14');

drop sequence regular_req;
create sequence regular_req
	start with 1
	increment by 1
	nocycle
	nocache;

drop sequence natural_req;
create sequence natural_req
	start with 1
	increment by 1
	nocycle
	nocache;

drop sequence studio_req;
create sequence studio_req
	start with 1
	increment by 1
	nocycle
	nocache;
	
drop sequence outer_req;
create sequence outer_req
	start with 1
	increment by 1
	nocycle
	nocache;

drop table gallery;
create table gallery(
	no number,
	num number,
	name varchar2(40) not null,
	path varchar2(100) not null,
	slide_path varchar2(100) not null,
	content LONG,
	foreign key(num) references sidebar_gallery(no),
	primary key(no, num)
);

insert into gallery values (regular_req.nextval,11 ,'본식 스냅', '/resources/gallery_image/regular_1.png', '/resources/gallery_slide_image/regular_s1.png', null);
insert into gallery values (regular_req.nextval,11 ,'본식 스냅', '/resources/gallery_image/regular_2.png', '/resources/gallery_slide_image/regular_s2.png', null);
insert into gallery values (regular_req.nextval,11 ,'본식 스냅', '/resources/gallery_image/regular_3.png', '/resources/gallery_slide_image/regular_s3.png', null);
insert into gallery values (regular_req.nextval,11 ,'본식 스냅', '/resources/gallery_image/regular_4.png', '/resources/gallery_slide_image/regular_s4.png', null);
insert into gallery values (regular_req.nextval,11 ,'본식 스냅', '/resources/gallery_image/regular_5.png', '/resources/gallery_slide_image/regular_s5.png', null);
insert into gallery values (regular_req.nextval,11 ,'본식 스냅', '/resources/gallery_image/regular_6.png', '/resources/gallery_slide_image/regular_s6.png', null);
insert into gallery values (regular_req.nextval,11 ,'본식 스냅', '/resources/gallery_image/regular_7.png', '/resources/gallery_slide_image/regular_s7.png', null);
   
insert into gallery values (natural_req.nextval,12, '자연광 스냅', '/resources/gallery_image/natural_1.png','/resources/gallery_slide_image/natural_s1.png',null);
insert into gallery values (natural_req.nextval,12, '자연광 스냅', '/resources/gallery_image/natural_2.png','/resources/gallery_slide_image/natural_s2.png',null);
insert into gallery values (natural_req.nextval,12, '자연광 스냅', '/resources/gallery_image/natural_3.png','/resources/gallery_slide_image/natural_s3.png',null);
insert into gallery values (natural_req.nextval,12, '자연광 스냅', '/resources/gallery_image/natural_4.png','/resources/gallery_slide_image/natural_s4.png',null);

insert into gallery values (studio_req.nextval,13 ,'스튜디오 스냅', '/resources/gallery_image/studio_1.png', '/resources/gallery_slide_image/studio_s1.png', null);
insert into gallery values (studio_req.nextval,13 ,'스튜디오 스냅', '/resources/gallery_image/studio_2.png', '/resources/gallery_slide_image/studio_s2.png', null);
insert into gallery values (studio_req.nextval,13 ,'스튜디오 스냅', '/resources/gallery_image/studio_3.png', '/resources/gallery_slide_image/studio_s3.png', null);
insert into gallery values (studio_req.nextval,13 ,'스튜디오 스냅', '/resources/gallery_image/studio_4.png', '/resources/gallery_slide_image/studio_s4.png', null);

insert into gallery values (outer_req.nextval,14 ,'야외 스냅', '/resources/gallery_image/outer_1.png', '/resources/gallery_slide_image/outer_s1.png', null);
insert into gallery values (outer_req.nextval,14 ,'야외 스냅', '/resources/gallery_image/outer_2.png', '/resources/gallery_slide_image/outer_s2.png', null);
insert into gallery values (outer_req.nextval,14 ,'야외 스냅', '/resources/gallery_image/outer_3.png', '/resources/gallery_slide_image/outer_s3.png', null);
insert into gallery values (outer_req.nextval,14 ,'야외 스냅', '/resources/gallery_image/outer_4.png', '/resources/gallery_slide_image/outer_s4.png', null);


--커뮤니티 사이드바

drop table sidebar_community;
create table sidebar_community(
	no number primary key,
	name varchar2(30) not null,
	url varchar2(40) not null
);
insert into sidebar_community values (sidebar_seq.nextval,'Notice','/MellowTone/boardlist?tno=1');
insert into sidebar_community values (sidebar_seq.nextval,'Q&A','/MellowTone/boardlist?tno=2');
insert into sidebar_community values (sidebar_seq.nextval,'Review','/MellowTone/boardlist?tno=3');

--여기까지 DB돌리셔도됩니댱


--공지
drop sequence notice_seq;
create sequence notice_seq
start with 1
increment by 1;

drop table notice;
create table notice(
	no number primary key,
	title varchar2(50) not null,
	gdate date not null,
	contents long not null
);

insert into notice values (notice_seq.nextval, '공지1', sysdate, '내용1');
insert into notice values (notice_seq.nextval, '공지2', sysdate, '내용2');
insert into notice values (notice_seq.nextval, '공지3', sysdate, '내용3');
insert into notice values (notice_seq.nextval, '공지4', sysdate, '내용4');
insert into notice values (notice_seq.nextval, '공지5', sysdate, '내용5');
insert into notice values (notice_seq.nextval, '공지6', sysdate, '내용6');
insert into notice values (notice_seq.nextval, '공지7', sysdate, '내용7');
insert into notice values (notice_seq.nextval, '공지8', sysdate, '내용8');
insert into notice values (notice_seq.nextval, '공지9', sysdate, '내용9');

--리뷰
drop sequence review_seq;
create sequence review_seq
   start with 1
   increment by 1
   nocycle
   nocache;

drop table review;
create table review(
	no number primary key,
	title varchar2(50) not null,
	gdate date not null,
	contents long not null,
	writer varchar2(20) not null,
	image varchar2(100)
);

insert into review values (review_seq.nextval, '리뷰1', sysdate, '사진0', '작성자', './upload/jh3.png');
insert into review values (review_seq.nextval, '리뷰2', sysdate, '사진x', '작성자', null);
insert into review values (review_seq.nextval, '리뷰3', sysdate, '내용', '작성자', './upload/jh3.png');
insert into review values (review_seq.nextval, '리뷰4', sysdate, '사진x', '작성자', null);
insert into review values (review_seq.nextval, '리뷰5', sysdate, '사진x', '작성자', null);
insert into review values (review_seq.nextval, '리뷰6', sysdate, '내용', '작성자', './upload/jh3.png');

--Q&A
drop sequence faq_seq;
create sequence faq_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
drop table faq;
create table faq(
	no number primary key,
	title varchar2(50) not null,
	gdate date not null,
	contents long not null,
	writer varchar2(20) not null,	
	visible varchar2(1) not null,
	category varchar2(30) not null
);

insert into faq values (faq_seq.nextval, '자주묻는 질문1', sysdate, '내용', '박재현', '1','날짜/시간');
insert into faq values (faq_seq.nextval, '자주묻는 질문2', sysdate, '내용', '작성자1', '1','예약/변경');
insert into faq values (faq_seq.nextval, '자주묻는 질문3', sysdate, '내용', '작성자2', '0','환불');
insert into faq values (faq_seq.nextval, '자주묻는 질문4', sysdate, '내용', '작성자3', '0','환불');
insert into faq values (faq_seq.nextval, '자주묻는 질문5', sysdate, '내용', '작성자4', '0','날짜/시간');
insert into faq values (faq_seq.nextval, '자주묻는 질문6', sysdate, '내용', '작성자5', '1','기타');


--사이드바 마이페이지
drop table sidebar_mypage;
create table sidebar_mypage(
   no number primary key,
   name varchar2(20) not null,
   url varchar2(40) not null
);

insert into sidebar_mypage values (sidebar_seq.nextval,'회원정보 확인','/MellowTone/check');
insert into sidebar_mypage values (sidebar_seq.nextval,'회원정보 변경','/MellowTone/update');
insert into sidebar_mypage values (sidebar_seq.nextval,'장바구니','/MellowTone/pocket');
insert into sidebar_mypage values (sidebar_seq.nextval,'회원 탈퇴','/MellowTone/delete');

drop table sidebar_reservation;
create table sidebar_reservation(
	no number primary key,
	name varchar2(20) not null,
	url varchar2(40) not null
);

drop sequence reservation_seq;
create sequence reservation_seq
	start with 1
	increment by 1
	nocycle
	nocache;

insert into sidebar_reservation values (reservation_seq.nextval,'예약하기','/MellowTone/book');
insert into sidebar_reservation values (reservation_seq.nextval,'예약확인/취소','/MellowTone/success');
