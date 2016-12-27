--���̵�� ������
drop sequence sidebar_seq;
create sequence sidebar_seq
	start with 1
	increment by 1
	nocycle
	nocache;
	
--���̵�� ���εེ
drop table sidebar_produce;
create table sidebar_produce(
	no number primary key,
	name varchar2(20) not null,
	url varchar2(40) not null
);

insert into sidebar_produce values (sidebar_seq.nextval,'Self Wedding','/MellowTone/produce');
insert into sidebar_produce values (sidebar_seq.nextval,'MellowTone','#mellowtone');
insert into sidebar_produce values (sidebar_seq.nextval,'PhotoGrapher','#photographer');

--�������� ī�װ���
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


insert into picture values('4','REGULAR SNAP','/resources/image/regular.png','1�� �۰� �Կ�, ����ũ�������� ������ �������� ������ �Կ�<br>
																		���� �� ģ��,ģ������� �Կ� ����(����) <br>���� �ٹ����� ���������̸� 700~1000�� �Կ�<br>
																	 �ϵ�Ŀ��ȭ���ٹ� (14x11) 30p-3�� <br>���� + ���κ����� ����������<br>',800000);
insert into picture values('5','NATURAL LIGHT SNAP','/resources/image/natural.png','���ϴ� ������ ���� 4���� ����̵����� �Կ� ����<br>4����(�ǻ�)���� / �Կ��ð� 5~6�ð� �����̸� ��Ȳ�� ���� ���� ����(�̵��ð� ����)<br>
																		    ����/�ָ� �Կ�����<br> 50�� ���κ��� / ������ũ�� ������<br>
																			����(600�� ����) + ���κ�����(50��)����������<br>ȭ���ٹ� �߰�(�߰����߻�)<br>',700000);
insert into picture values('6','STUDIO SNAP','/resources/image/studio.png','�۰� ��Ʃ���, ��Ʃ��� �뿩, ��� �� �Կ� ����<br>���ϴ�(�ǻ�)����/ �Կ��ð� 3~4�ð� ����<br>
																   ����(300�峻��) + ���κ�����(30��)����������<br>������ũ�� ����<br>',600000);
insert into picture values('7','OUTER SNAP','/resources/image/outer.png','���ϴ� ������ ���� 2~3���� ����̵����� �Կ� ����<br>2����(�ǻ�)���� / �Կ��ð� 3~4�ð� �����̸� ��Ȳ�� ���� ���� ����(�̵��ð� ����)<br>
																 ������ǰ ����뿩(����,ȭ��,����Ͽ�,������,��Ÿ��)<br>����/�ָ� �Կ� ����<br>����ǻ� �����غ� / �۰� ����巹�� �뿩����<br>
																 ����(400�� ����) + ���κ�����(30��)����������<br>ȭ���ٹ� �߰�(�߰���� �߻�)<br>',700000);

																 
--���̵�� ������
drop table sidebar_item;
create table sidebar_item(
	no number primary key,
	name varchar2(20) not null,
	url varchar2(40) not null
);

insert into sidebar_item values (sidebar_seq.nextval,'Dress','/MellowTone/item?no=8');
insert into sidebar_item values (sidebar_seq.nextval,'Tuxedo','/MellowTone/item?no=9');
insert into sidebar_item values (sidebar_seq.nextval,'Accessory','/MellowTone/item?no=10');


--���������̺�
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

insert into item values('Apieu','/resources/image/wedding.png','/resources/image/wedding_detail.png','�� ȭ��Ʈ�� �������� ǥ���� �ָ� <br>
																					�巹���� Ʈ���� �̿��� �پ��� ������ �������ݴϴ�.<br>
																					���� �ڸ��� �������� ���Ÿ� �����������ν�<br>
																					���� ���������� ã�� �巹�� �Դϴ�.<br>',110000,2,8);
insert into item values('Wendy lace','/resources/image/mini.png','/resources/image/mini_detail.png','������� ������ ���̽� ž�� ǳ���� �شܿ� ����Ʈ�� �� �巹���Դϴ�.<br>
																				     �� �巹���� �߶��԰� ������� ���ÿ� ǥ�� �����ϸ�<br>
																				     ������ �ٸ� �̴ϵ巹���� ���� ��� ����<br>
																				     �ٸ��� �ڽ� ���� �е�, Ű�� ũ�� �е鵵 ����� ������ �� �ֽ��ϴ�.<br>
																				     �׸��� �������� ��ǰ���� �ݶ󺸷��̼��� �¾� <br>
																					�� �̻ڰ� ���Ⱑ���� �巹���Դϴ�.<br>',80000,2,8);
insert into item values('Romentic Holic','/resources/image/neck.png','/resources/image/neck_detail.png','���̽��� ������ ���� �������� ���ܿ� �׷��̵� �Ǿ�<br>
																					     �ź�ο�� �Ƹ��ٿ��� �������ִ� �巹���Դϴ�.<br>
																					     �ö�� ��Ƽ�� ���̽��� ���̳ض��α��� ����Ǿ� ������<br>
																					     �ڸ��� �� ���� ����̶� ������ ���� �����մϴ�.<br>
																						�ź�ο� ������ �������� �� �־�<br>
																						Apieu�巹���� ���������� ���������� ���� ã�� �巹���Դϴ�.<br>',100000,1,8);
insert into item values('Gold Rose','/resources/image/gold.png','/resources/image/gold_detail.png', '��� �÷��� �ڼ� ���̽��� ��ü�� ���ΰ� �ִ� ������ذ� <br>
																				     ����ĿƮ�� ���� �ش��� ����ϸ鼭�� ������ ������ �ִ� �巹���Դϴ�.<br>
																				     �� �巹���� �ض����� ��ü�� ������ ���̴� ȿ���� �ֽ��ϴ�.<br>
																				     �챸���� �Ȱ��� ���� ȭ��Ʈ�� ���� �� �δ㽺����, ��Ƽ���� ������ �ݴϴ�.<br>',100000,2,8);

insert into item values('JBT-02','/resources/image/tuxedo.png','/resources/image/tuxedo_detail.png','	95 Size  ���-44.5cm , �����ѷ�-100.3cm , �㸮�ѷ�-86.3cm , ���Ǳ���-71.0cm<br>
																					100 Size ���-45.7cm , �����ѷ�-106.7cm , �㸮�ѷ�-94.0cm , ���Ǳ���-72.5cm<br>
																					105 Size ���-47.0cm , �����ѷ�-110.5cm , �㸮�ѷ�-98.0cm , ���Ǳ���-74.0cm<br>
																					110 Size ���-48.3cm , �����ѷ�-114.3cm , �㸮�ѷ�-103.0cm , ���Ǳ���-75.0cm<br>',100000,2,9);
insert into item values('JBT-04','/resources/image/tuxedo2.png','/resources/image/tuxedo2_detail.png','95 Size  ���-44.5cm , �����ѷ�-100.3cm , �㸮�ѷ�-86.3cm , ���Ǳ���-71.0cm<br>
																				   100 Size ���-45.7cm , �����ѷ�-106.7cm , �㸮�ѷ�-94.0cm , ���Ǳ���-72.5cm<br>
																				   105 Size ���-47.0cm , �����ѷ�-110.5cm , �㸮�ѷ�-98.0cm , ���Ǳ���-74.0cm<br>
																				   110 Size ���-48.3cm , �����ѷ�-114.3cm , �㸮�ѷ�-103.0cm , ���Ǳ���-75.0cm<br>',100000,1,9);
insert into item values('JBT-06','/resources/image/tuxedo3.png','/resources/image/tuxedo3_detail.png','95 Size  ���-44.5cm , �����ѷ�-100.3cm , �㸮�ѷ�-86.3cm , ���Ǳ���-71.0cm<br>
																				   100 Size ���-45.7cm , �����ѷ�-106.7cm , �㸮�ѷ�-94.0cm , ���Ǳ���-72.5cm<br>
																				   105 Size ���-47.0cm , �����ѷ�-110.5cm , �㸮�ѷ�-98.0cm , ���Ǳ���-74.0cm<br>
																				   110 Size ���-48.3cm , �����ѷ�-114.3cm , �㸮�ѷ�-103.0cm , ���Ǳ���-75.0cm<br>',100000,3,9);

insert into item values('white bouquet','/resources/image/bouquet.png','/resources/image/bouquet_detail.png','ȭ��Ʈ �迭 �ɵ�� �����Ǿ� �־� ������ ������ <br>
											    											��ȭó�� �̽��� ������ �����ϰ� �մϴ�.<br>
																							������ ���������� ���������鼭 ���� �źη� ������ִ� �����Դϴ�.<br>
																							�����Կ��� ����ϸ� ���ڱ� ������ ���� ������ ã�� �����Դϴ�.<br>',10000,2,10);
insert into item values('pink butonie','/resources/image/butonie.png','/resources/image/butonie_detail.png','ȭ��Ʈ�迭�� �ɿ� ���� ���� ���� ȿ���� �־� <br>
											   											     ȭ��Ʈ �迭�� �νõ����� ������ �� ��︮�� ����Ͽ��Դϴ�.<br>
																						   �ιٸ���� ���� �������� ����Ͽ��� ���� �������Ͽ� ������ �Ƿ��մϴ�.<br>
																						  ���� ���� ��ȭ�� �����ϴ� ��ǰ�̱⶧���� ��������Ƽ�� ��ȭ��ǰ���� � �������� ȭ���ϰ� ���� �����մϴ�.<br>',10000,1,10);
insert into item values('silk veil','/resources/image/veil.png','/resources/image/veil_detail.png','������ �������� �������� ���������Դϴ�.<br>
																				���������� ���۵� �� ������ �����ϸ鼭�� ǻ���� ��Ÿ�Ϸ� <br>
																				�������� �Կ��� �����ϰ� ����� �� ������ �پ��� ������ �����մϴ�.<br>
																				U���� �Ǵ� �������� �����Ͽ� ����ϴ� ��ǰ���� û���� ������ ���� �� �� �ֽ��ϴ�.<br>
										     									 ','16000','1','10');
insert into item values('ample veil','/resources/image/veil2.png','/resources/image/veil2_detail.png','���� �ƹ� ���̾��� ������Ÿ���� ������ �����ε���<br>
																					 ������ ǳ���� ������ �����ϰ� �̻� �������Դϴ�.<br>
																					������ ���� �����Ͽ� ���� ǳ���� ������ �� �� �ֽ��ϴ�.<br>
																					 �����ɰ� �и��Ǿ� Ż������ �����ϴ�.<br>',10000,2,10);
																 
																 
		
																					
--���̵�� ������
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

insert into gallery values (regular_req.nextval,11 ,'���� ����', '/resources/gallery_image/regular_1.png', '/resources/gallery_slide_image/regular_s1.png', null);
insert into gallery values (regular_req.nextval,11 ,'���� ����', '/resources/gallery_image/regular_2.png', '/resources/gallery_slide_image/regular_s2.png', null);
insert into gallery values (regular_req.nextval,11 ,'���� ����', '/resources/gallery_image/regular_3.png', '/resources/gallery_slide_image/regular_s3.png', null);
insert into gallery values (regular_req.nextval,11 ,'���� ����', '/resources/gallery_image/regular_4.png', '/resources/gallery_slide_image/regular_s4.png', null);
insert into gallery values (regular_req.nextval,11 ,'���� ����', '/resources/gallery_image/regular_5.png', '/resources/gallery_slide_image/regular_s5.png', null);
insert into gallery values (regular_req.nextval,11 ,'���� ����', '/resources/gallery_image/regular_6.png', '/resources/gallery_slide_image/regular_s6.png', null);
insert into gallery values (regular_req.nextval,11 ,'���� ����', '/resources/gallery_image/regular_7.png', '/resources/gallery_slide_image/regular_s7.png', null);
   
insert into gallery values (natural_req.nextval,12, '�ڿ��� ����', '/resources/gallery_image/natural_1.png','/resources/gallery_slide_image/natural_s1.png',null);
insert into gallery values (natural_req.nextval,12, '�ڿ��� ����', '/resources/gallery_image/natural_2.png','/resources/gallery_slide_image/natural_s2.png',null);
insert into gallery values (natural_req.nextval,12, '�ڿ��� ����', '/resources/gallery_image/natural_3.png','/resources/gallery_slide_image/natural_s3.png',null);
insert into gallery values (natural_req.nextval,12, '�ڿ��� ����', '/resources/gallery_image/natural_4.png','/resources/gallery_slide_image/natural_s4.png',null);

insert into gallery values (studio_req.nextval,13 ,'��Ʃ��� ����', '/resources/gallery_image/studio_1.png', '/resources/gallery_slide_image/studio_s1.png', null);
insert into gallery values (studio_req.nextval,13 ,'��Ʃ��� ����', '/resources/gallery_image/studio_2.png', '/resources/gallery_slide_image/studio_s2.png', null);
insert into gallery values (studio_req.nextval,13 ,'��Ʃ��� ����', '/resources/gallery_image/studio_3.png', '/resources/gallery_slide_image/studio_s3.png', null);
insert into gallery values (studio_req.nextval,13 ,'��Ʃ��� ����', '/resources/gallery_image/studio_4.png', '/resources/gallery_slide_image/studio_s4.png', null);

insert into gallery values (outer_req.nextval,14 ,'�߿� ����', '/resources/gallery_image/outer_1.png', '/resources/gallery_slide_image/outer_s1.png', null);
insert into gallery values (outer_req.nextval,14 ,'�߿� ����', '/resources/gallery_image/outer_2.png', '/resources/gallery_slide_image/outer_s2.png', null);
insert into gallery values (outer_req.nextval,14 ,'�߿� ����', '/resources/gallery_image/outer_3.png', '/resources/gallery_slide_image/outer_s3.png', null);
insert into gallery values (outer_req.nextval,14 ,'�߿� ����', '/resources/gallery_image/outer_4.png', '/resources/gallery_slide_image/outer_s4.png', null);




--���̵�� ����������
drop table sidebar_mypage;
create table sidebar_mypage(
   no number primary key,
   name varchar2(20) not null,
   url varchar2(40) not null
);

insert into sidebar_mypage values (sidebar_seq.nextval,'ȸ������ Ȯ��','/MellowTone/check');
insert into sidebar_mypage values (sidebar_seq.nextval,'ȸ������ ����','/MellowTone/update');
insert into sidebar_mypage values (sidebar_seq.nextval,'��ٱ���','/MellowTone/pocket');
insert into sidebar_mypage values (sidebar_seq.nextval,'ȸ�� Ż��','/MellowTone/delete');