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

insert into sidebar_gallery values (sidebar_seq.nextval,'Regular Snap','./gallery.do?action=1');
insert into sidebar_gallery values (sidebar_seq.nextval,'Natural Light Snap','./gallery.do?action=2');
insert into sidebar_gallery values (sidebar_seq.nextval,'Studio Snap','./gallery.do?action=3');
insert into sidebar_gallery values (sidebar_seq.nextval,'Outer Snap','./gallery.do?action=4');




--���̵�� ����������
drop table sidebar_mypage;
create table sidebar_mypage(
   no number primary key,
   name varchar2(20) not null,
   url varchar2(40) not null
);

insert into sidebar_mypage values (sidebar_seq.nextval,'ȸ������ Ȯ��','./mypage.do?action=check');
insert into sidebar_mypage values (sidebar_seq.nextval,'ȸ������ ����','./mypage.do?action=update_check');
insert into sidebar_mypage values (sidebar_seq.nextval,'��ٱ���','./mypage.do?action=pocket_list');
insert into sidebar_mypage values (sidebar_seq.nextval,'ȸ�� Ż��','./mypage.do?action=delete_check');