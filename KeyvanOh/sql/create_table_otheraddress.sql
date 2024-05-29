drop table otheraddress;
CREATE TABLE otheraddress (
    ZIP                      NUMBER(5) NOT NULL,
    SIDO                     VARCHAR2(21) NOT NULL,
    SIGUNGU                  VARCHAR2(25),
    EUMMYEON                 VARCHAR2(18),
    DORO                     VARCHAR2(33) NOT NULL,
    ISJIHA                   NUMBER(1) NOT NULL,   
    BUILDINGNUMBER1          NUMBER(5) NOT NULL,   
    BUILDINGNUMBER2          NUMBER(4) NOT NULL,  
    ADDRESSID                NUMBER(25) NOT NULL,
    BUILDING                 VARCHAR2(60),
    DONGLAW                  VARCHAR2(16),
    LI                       VARCHAR2(18),
    DONG                     VARCHAR2(27),
    LOTNUMBER1               NUMBER(4) NOT NULL,   
    LOTNUMBER2               NUMBER(4) NOT NULL,
    constraint PK_Otheraddress primary key (ADDRESSID)
);

drop table temp;
create table temp (
    keyword varchar2(60)
);
insert into temp (
    select BUILDING from address where BUILDING = LI group by BUILDING
);
insert into otheraddress (
    SELECT ZIP, SIDO, SIGUNGU, EUMMYEON, DORO, ISJIHA, BUILDINGNUMBER1, BUILDINGNUMBER2, BUILDINGNUMBERM, BUILDING, DONGLAW, LI, DONG, LOTNUMBER1, LOTNUMBER2 FROM address where (
        BUILDING in (select keyword from temp) or
        LI in (select keyword from temp)
    )
);

drop table temp;
create table temp (
    keyword varchar2(60)
);
insert into temp (
    select DORO from address where DORO = BUILDING group by DORO
);
insert into otheraddress (
    SELECT ZIP, SIDO, SIGUNGU, EUMMYEON, DORO, ISJIHA, BUILDINGNUMBER1, BUILDINGNUMBER2, BUILDINGNUMBERM, BUILDING, DONGLAW, LI, DONG, LOTNUMBER1, LOTNUMBER2 FROM address where (
        DORO in (select keyword from temp) or
        BUILDING in (select keyword from temp)
    )
);

drop table temp;
create table temp (
    keyword varchar2(60)
);
insert into temp (
    select DORO from address where DORO = DONGLAW group by DORO
);
insert into otheraddress (
    SELECT ZIP, SIDO, SIGUNGU, EUMMYEON, DORO, ISJIHA, BUILDINGNUMBER1, BUILDINGNUMBER2, BUILDINGNUMBERM, BUILDING, DONGLAW, LI, DONG, LOTNUMBER1, LOTNUMBER2 FROM address where (
        DORO in (select keyword from temp) or
        DONGLAW in (select keyword from temp)
    )
);

drop table temp;
create table temp (
    keyword varchar2(60)
);
insert into temp (
    select BUILDING from address where BUILDING = DONGLAW group by BUILDING
);
insert into otheraddress (
    SELECT ZIP, SIDO, SIGUNGU, EUMMYEON, DORO, ISJIHA, BUILDINGNUMBER1, BUILDINGNUMBER2, BUILDINGNUMBERM, BUILDING, DONGLAW, LI, DONG, LOTNUMBER1, LOTNUMBER2 FROM address where (
        BUILDING in (select keyword from temp) or
        DONGLAW in (select keyword from temp)
    )
);

commit;
