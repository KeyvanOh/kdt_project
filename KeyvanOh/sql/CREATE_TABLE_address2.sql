drop table address2;
CREATE TABLE address2 (
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
    constraint PK_Address2 primary key (ADDRESSID)
);

insert into address2 (
    SELECT ZIP, SIDO, SIGUNGU, EUMMYEON, DORO, ISJIHA, BUILDINGNUMBER1, BUILDINGNUMBER2, BUILDINGNUMBERM, BUILDING, DONGLAW, LI, DONG, LOTNUMBER1, LOTNUMBER2 FROM address
);

commit;
