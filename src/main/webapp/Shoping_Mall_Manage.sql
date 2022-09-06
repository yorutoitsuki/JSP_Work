select to_char(sysdate,'yyyy-mm-dd') from dual;--가입일
select NVL(max(memno),0)+1 from member --회원번호
--My SQL : now()

select NVL(max(memno),0)+1 as memno, to_char(sysdate,'yyyymmdd') as hirdate from member;
select to_char(sysdate,'yyyy-mm-dd') as hirdate from member; -- 레코드 수가 9개

drop table member;



create table member(
memno char(4) primary key,
name varchar2(30) not null,
address varchar2(100) not null,
hiredate date,
gender char(1),
tel1 char(3),
tel2 char(4),
tel3 char(4));

select * from MEMBER;

create sequence member_seq
start with 1001
increment by 1
minvalue 1001;

insert into member values('1001', '김고객','경북 경산시 중방동','02/01/01','F','010','1234','1001');
insert into member values('1002', '이고객','경북 경산시 삼방동','02/02/01','M','010','1234','1002');
insert into member values('1003', '박고객','경북 경산시 옥방동','02/03/01','M','010','1234','1003');
insert into member values('1004', '조고객','대구 광역시 달서구','02/04/01','M','010','1234','1004');
insert into member values('1005', '유고객','대구 광역시 유성구','02/05/01','M','010','1234','1005');
insert into member values('1006', '여고객','대구 광역시 수성구','02/06/01','M','010','1234','1006');
insert into member values('1007', '남고객','충남 금산군 중도리','02/07/01','F','010','1234','1007');
insert into member values('1008', '황고객','서울 특별시 관악구','02/08/01','F','010','1234','1008');
insert into member values('1009', '전고객','서울 특별시 강서구','02/09/01','F','010','1234','1009');

drop table grade;

create table grade(
memgrade number(1) not null,
loprice number(30) not null,
hiprice number(30) not null
);

insert into grade values(1, 150001, 500000); --vip
insert into grade values(2, 100001, 150000); --gold
insert into grade values(3, 50001, 100000); --silver
insert into grade values(4, 1, 50000); --normal

create table buy(
memno char(4) not null,
prodno char(4) not null,
product varchar2(20) not null,
price Number(30),
bno number(30),

primary key(memno, prodno)
);

drop table buy;

select * from buy;

insert into buy values('1009', '0001', '긴 바지', 30000, 4);
insert into buy values('1009', '0002', '점퍼', 100000, 1);
insert into buy values('1006', '0004', '긴팔 셔츠', 25000, 1);
insert into buy values('1006', '0002', '점퍼', 100000, 1);
insert into buy values('1005', '0003', '반팔 셔츠', 20000, 3);
insert into buy values('1002', '0003', '반팔 셔츠', 20000, 2);
insert into buy values('1002', '0004', '긴팔 셔츠', 25000, 1);
insert into buy values('1001', '0004', '긴팔 셔츠', 25000, 1);
insert into buy values('1001', '0005', '긴팔 후드티', 23000, 2);


































