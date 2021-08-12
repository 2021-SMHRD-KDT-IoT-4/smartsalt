-- 접속 계정
ID = pigManage
PASS = pig

-- 시스템 계정 로그인, 계정생성
create user pigManage identified by pig;
grant connect, resource, dba to pigManage;

-- pigmanage 로그인 후 테이블 생성
create table entire_environment( --ㅇㅇ
    seq_num NUMBER primary key,
    check_time DATE,
    temp NUMBER NOT NULL,
    humi NUMBER NOT NULL,
    gas NUMBER NOT NULL
);

CREATE SEQUENCE entire_seq_num
     START WITH 1
     INCREMENT BY 1
     MAXVALUE 10000
     NOCYCLE;

create table domestic_animals(--ㅇㅇ
    room NUMBER NOT NULL,
    product_cnt NUMBER NOT NULL,
    receving_date DATE,
    forwarding_date DATE,
    fir_vaccine DATE,
    sec_vaccine DATE,
    thr_vaccine DATE,
    enableGrade NUMBER NOT NULL
);

create table Members(--ㅇㅇ
    mb_id varchar2(32) primary key,
    mb_pw varchar2(32) NOT NULL,
    mb_grade NUMBER NOT NULL,
    nick_name varchar2(40) NOT NULL
);

create table actuator_status(--ㅇㅇ
    act_feed NUMBER NOT NULL,
    act_door NUMBER NOT NULL,
    act_absor NUMBER NOT NULL,
    act_aircon NUMBER NOT NULL,
    act_pump NUMBER NOT NULL,
    act_boil NUMBER NOT NULL,
    act_humid NUMBER NOT NULL
);

create table automatic_control(--ㅇㅇ
    feed_time DATE,
    absor_start NUMBER NOT NULL,
    absor_stop NUMBER NOT NULL,
    aircon_start NUMBER NOT NULL,
    aircon_stop NUMBER NOT NULL,
    humid_start NUMBER NOT NULL,
    humid_stop NUMBER NOT NULL,
    boil_start NUMBER NOT NULL,
    boil_stop NUMBER NOT NULL
); 

create table manual_control(--ㅇㅇ
    act_feed NUMBER NOT NULL,
    act_door NUMBER NOT NULL,
    act_absor NUMBER NOT NULL,
    act_aircon NUMBER NOT NULL,
    act_pump NUMBER NOT NULL,
    act_boil NUMBER NOT NULL,
    act_humid NUMBER NOT NULL,
    enableGrade NUMBER NOT NULL
);

insert into actuator_status values(0,0,0,0,0,0,0);

select * from actuator_status;

update actuator_status set act_feed = 1,act_door = 1,
act_absor = 1,act_aircon = 1,act_pump = 1,act_boil = 1,act_humid = 1 where ROWNUM = 1;

insert into members values('pig', 'pig', 3, 'pig');
insert into members values('manage', 'manage', 0, 'manage');
select * from members;

ㅁㄴㅇㄻㄴㄹㅇ
select * from domestic_animals;
insert into automatic_control values('20:20:20',12,31,3,4,5,6,7,8);
insert into domestic_animals values(2,500,sysdate,sysdate,sysdate,sysdate,sysdate,2);