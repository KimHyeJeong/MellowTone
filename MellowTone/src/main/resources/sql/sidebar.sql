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

--���̵�� ������
drop table sidebar_item;
create table sidebar_item(
	no number primary key,
	name varchar2(20) not null,
	url varchar2(40) not null
);

insert into sidebar_item values (sidebar_seq.nextval,'Dress','./item.do?action=dress');
insert into sidebar_item values (sidebar_seq.nextval,'Tuxedo','./item.do?action=tuxedo');
insert into sidebar_item values (sidebar_seq.nextval,'Accessory','./item.do?action=accessory');

