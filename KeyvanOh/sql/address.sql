drop table address;

drop sequence address_sequence;

create sequence address_sequence start with 1 increment by 1;

CREATE TABLE address (
    zip varchar2(5) not null,
    sido varchar2(21) not null,
    sidoe varchar2(17) not null,
    sigungu varchar2(25),
    sigungue varchar2(27),
    eummyeon varchar2(18),
    eummyeone varchar2(23),
    dorocode varchar2(12) not null,
    doro varchar2(33) not null,
    doroe varchar2(48) not null,
    isjiha varchar2(1) not null,
    buildingnumber1 varchar2(5) not null,
    buildingnumber2 varchar2(4) not null,
    buildingnumberm varchar2(25) not null,
    building varchar2(60),
    donglawcode varchar2(10) not null,
    donglaw varchar2(16),
    li varchar2(18),
    dong varchar2(27),
    ismountain varchar2(1) not null,
    lotnumber1 varchar2(4) not null,
    eummyeondongserial varchar2(2) not null,
    lotnumber2 varchar2(4) not null,
    constraint PK_Address primary key (buildingnumberm)
);
commit;
