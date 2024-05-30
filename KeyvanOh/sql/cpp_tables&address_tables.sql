drop table wish;
drop table deal;
drop table comments;
drop table item;
drop table authority;
drop table users;
drop table itemcategory;

drop sequence item_sequence;

create sequence item_sequence start with 1 increment by 1;

create table itemcategory(
    itemcategoryid number(2) not null,
    itemcategoryname varchar2(20) not null,
    constraint PK_Itemcategory primary key (itemcategoryid)
);
insert into itemcategory values (
    1,
    '디지털기기'
);
insert into itemcategory values (
    2,
    '가구/인테리어'
);
insert into itemcategory values (
    3,
    '유아동'
);
insert into itemcategory values (
    4,
    '여성의류'
);
insert into itemcategory values (
    5,
    '여성잡화'
);
insert into itemcategory values (
    6,
    '남성패션/잡화'
);
insert into itemcategory values (
    7,
    '생활가전'
);
insert into itemcategory values (
    8,
    '생활/주방'
);
insert into itemcategory values (
    9,
    '스포츠/레저'
);
insert into itemcategory values (
    10,
    '취미/게임/음반'
);
insert into itemcategory values (
    11,
    '뷰티/미용'
);
insert into itemcategory values (
    12,
    '식물'
);
insert into itemcategory values (
    13,
    '가공식품'
);
insert into itemcategory values (
    14,
    '건강기능식품'
);
insert into itemcategory values (
    15,
    '반려동물용품'
);
insert into itemcategory values (
    16,
    '티켓/교환권'
);
insert into itemcategory values (
    17,
    '도서'
);
insert into itemcategory values (
    18,
    '유아도서'
);
insert into itemcategory values (
    19,
    '기타 중고물품'
);
insert into itemcategory values (
    20,
    '삽니다'
);
create table users (
    userid varchar2(14) not null,
    password varchar2(60) not null,
    nickname varchar2(30) not null,
    ADDRESSID number(25) not null,
    constraint FK_AddressUser foreign key (ADDRESSID) references address2(ADDRESSID),
    constraint PK_User primary key (userid)
);
create table authority (
    userid varchar2(14) not null,
    role number(1) not null,
    constraint FK_UserAuthority foreign key (userid) references users(userid),
    constraint PK_Authority primary key (userid, role)
);
create table item (
    itemid number(19) not null,
    sellerid varchar2(14) not null,
    title varchar2(100) not null,
    price number(10) not null,
    categorynumber number(2) not null,
    uploadtime timestamp not null,
    content varchar(4000) not null,
    hit number(19) not null,
    howmanyimgs number(2) not null,
    constraint FK_UserItem foreign key (sellerid) references users(userid),
    constraint FK_ItemcategoryItem foreign key (categorynumber) references itemcategory(itemcategoryid),
    constraint PK_Item primary key (itemid)
);
create table comments (
    itemid number(19) not null,
    commentid number(19) not null,
    parentcommentid number(19),
    userid varchar2(14) not null,
    content varchar2(1000) not null,
    commenttime timestamp not null,
    constraint FK_ItemComment foreign key (itemid) references item(itemid),
    constraint FK_UserComment foreign key (userid) references users(userid),
    constraint PK_Comment primary key (itemid, commentid)
);
create table deal (
    itemid number(19) not null,
    buyerid varchar2(14) not null,
    dealtime timestamp not null,
    gooddeal number(1),
    constraint FK_ItemDeal foreign key (itemid) references item(itemid),
    constraint FK_UserDealBuyer foreign key (buyerid) references users(userid),
    constraint PK_Deal primary key (itemid, buyerid)
);
create table wish (
    itemid number(19) not null,
    userid varchar2(14) not null,
    constraint FK_ItemWish foreign key (itemid) references item(itemid),
    constraint FK_UserWish foreign key (userid) references users(userid),
    constraint PK_Wish primary key (itemid, userid)
);



drop table addresskeyword;
CREATE TABLE addresskeyword (
    keyword VARCHAR2(60) not null,
    column1 number(1) not null,
    column2 number(1) not null,
    tableid number(2) not null,
    constraint PK_Addresskeyword primary key (keyword)
);


drop table a00otheraddress;

drop table a01sigunguaddress;
drop table a02eummyeonaddress;
drop table a05donglawaddress;
drop table a06liaddress;
drop table a03doroaddress;
drop table a04buildingaddress;

drop table a26gyeonggi;
drop table a25gyeongsangbuk;
drop table a24gyeongsangnam;
drop table a23jeollanam;
drop table a22chungcheongnam;
drop table a21seoul;
drop table a20jeonbuk;
drop table a19gangwon;
drop table a18chungcheongbuk;
drop table a17busan;
drop table a16daegu;
drop table a15incheon;
drop table a14jeju;
drop table a13gwangju;
drop table a12daejeon;
drop table a11ulsan;
drop table a10sejong;


drop table sidos;
CREATE TABLE sidos (
    TABLEID NUMBER(2) NOT NULL,
    SIDO VARCHAR2(21) NOT NULL,
    constraint PK_Sidos primary key (SIDO)
);
INSERT INTO sidos VALUES (
    10,
    '세종특별자치시'
);
INSERT INTO sidos VALUES (
    11,
    '울산광역시'
);
INSERT INTO sidos VALUES (
    12,
    '대전광역시'
);
INSERT INTO sidos VALUES (
    13,
    '광주광역시'
);
INSERT INTO sidos VALUES (
    14,
    '제주특별자치도'
);
INSERT INTO sidos VALUES (
    15,
    '인천광역시'
);
INSERT INTO sidos VALUES (
    16,
    '대구광역시'
);
INSERT INTO sidos VALUES (
    17,
    '부산광역시'
);
INSERT INTO sidos VALUES (
    18,
    '충청북도'
);
INSERT INTO sidos VALUES (
    19,
    '강원특별자치도'
);
INSERT INTO sidos VALUES (
    20,
    '전북특별자치도'
);
INSERT INTO sidos VALUES (
    21,
    '서울특별시'
);
INSERT INTO sidos VALUES (
    22,
    '충청남도'
);
INSERT INTO sidos VALUES (
    23,
    '전라남도'
);
INSERT INTO sidos VALUES (
    24,
    '경상남도'
);
INSERT INTO sidos VALUES (
    25,
    '경상북도'
);
INSERT INTO sidos VALUES (
    26,
    '경기도'
);


CREATE TABLE a26gyeonggi (
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
    constraint PK_a26gyeonggi primary key (ADDRESSID)
);
insert into a26gyeonggi (
    SELECT * FROM address2 where SIDO = '경기도'
);

CREATE TABLE a25gyeongsangbuk (
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
    constraint PK_a25gyeongsangbuk primary key (ADDRESSID)
);
insert into a25gyeongsangbuk (
    SELECT * FROM address2 where SIDO = '경상북도'
);

CREATE TABLE a24gyeongsangnam (
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
    constraint PK_a24gyeongsangnam primary key (ADDRESSID)
);
insert into a24gyeongsangnam (
    SELECT * FROM address2 where SIDO = '경상남도'
);

CREATE TABLE a23jeollanam (
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
    constraint PK_a23jeollanam primary key (ADDRESSID)
);
insert into a23jeollanam (
    SELECT * FROM address2 where SIDO = '전라남도'
);

CREATE TABLE a22chungcheongnam (
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
    constraint PK_a22chungcheongnam primary key (ADDRESSID)
);
insert into a22chungcheongnam (
    SELECT * FROM address2 where SIDO = '충청남도'
);

CREATE TABLE a21seoul (
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
    constraint PK_a21seoul primary key (ADDRESSID)
);
insert into a21seoul (
    SELECT * FROM address2 where SIDO = '충청남도'
);

CREATE TABLE a20jeonbuk (
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
    constraint PK_a20jeonbuk primary key (ADDRESSID)
);
insert into a20jeonbuk (
    SELECT * FROM address2 where SIDO = '전북특별자치도'
);

CREATE TABLE a19gangwon (
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
    constraint PK_a19gangwon primary key (ADDRESSID)
);
insert into a19gangwon (
    SELECT * FROM address2 where SIDO = '강원특별자치도'
);

CREATE TABLE a18chungcheongbuk (
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
    constraint PK_a18chungcheongbuk primary key (ADDRESSID)
);
insert into a18chungcheongbuk (
    SELECT * FROM address2 where SIDO = '충청북도'
);

CREATE TABLE a17busan (
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
    constraint PK_a17busan primary key (ADDRESSID)
);
insert into a17busan (
    SELECT * FROM address2 where SIDO = '부산광역시'
);

CREATE TABLE a16daegu (
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
    constraint PK_a16daegu primary key (ADDRESSID)
);
insert into a16daegu (
    SELECT * FROM address2 where SIDO = '대구광역시'
);

CREATE TABLE a15incheon (
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
    constraint PK_a15incheon primary key (ADDRESSID)
);
insert into a15incheon (
    SELECT * FROM address2 where SIDO = '인천광역시'
);

CREATE TABLE a14jeju (
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
    constraint PK_a14jeju primary key (ADDRESSID)
);
insert into a14jeju (
    SELECT * FROM address2 where SIDO = '제주특별자치도'
);

CREATE TABLE a13gwangju (
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
    constraint PK_a13gwangju primary key (ADDRESSID)
);
insert into a13gwangju (
    SELECT * FROM address2 where SIDO = '광주광역시'
);

CREATE TABLE a12daejeon (
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
    constraint PK_a12daejeon primary key (ADDRESSID)
);
insert into a12daejeon (
    SELECT * FROM address2 where SIDO = '대전광역시'
);

CREATE TABLE a11ulsan (
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
    constraint PK_a11ulsan primary key (ADDRESSID)
);
insert into a11ulsan (
    SELECT * FROM address2 where SIDO = '울산광역시'
);

CREATE TABLE a10sejong (
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
    constraint PK_a10sejong primary key (ADDRESSID)
);
insert into a10sejong (
    SELECT * FROM address2 where SIDO = '세종특별자치시'
);


CREATE TABLE a00otheraddress (
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
    constraint PK_a00otheraddress primary key (ADDRESSID)
);

drop table temp;
create table temp (
    keyword varchar2(60)
);
insert into temp (
    select BUILDING from address2 where BUILDING = LI group by BUILDING
);
select BUILDING from address2 where BUILDING = LI group by BUILDING;
insert into a00otheraddress (
    SELECT * FROM address2 where (
        BUILDING in (select keyword from temp) or
        LI in (select keyword from temp)
    )
);
insert into addresskeyword select BUILDING, 4, 6, 0 from address2 where BUILDING = LI group by BUILDING;

drop table temp;
create table temp (
    keyword varchar2(60)
);
insert into temp (
    select DORO from address2 where DORO = BUILDING group by DORO
);
insert into a00otheraddress (
    SELECT * FROM address2 where (
        DORO in (select keyword from temp) or
        BUILDING in (select keyword from temp)
    )
);
insert into addresskeyword select DORO, 3, 4, 0 from address2 where DORO = BUILDING group by DORO;

drop table temp;
create table temp (
    keyword varchar2(60)
);
insert into temp (
    select DORO from address2 where DORO = DONGLAW group by DORO
);
insert into a00otheraddress (
    SELECT * FROM address2 where (
        DORO in (select keyword from temp) or
        DONGLAW in (select keyword from temp)
    )
);
insert into addresskeyword select DORO, 3, 5, 0 from address2 where DORO = DONGLAW group by DORO;

drop table temp;
create table temp (
    keyword varchar2(60)
);
insert into temp (
    select BUILDING from address2 where BUILDING = DONGLAW group by BUILDING
);
insert into a00otheraddress (
    SELECT * FROM address2 where (
        BUILDING in (select keyword from temp) or
        DONGLAW in (select keyword from temp)
    )
);
insert into addresskeyword select BUILDING, 4, 5, 0 from address2 where BUILDING = DONGLAW group by BUILDING;

drop table temp;


CREATE TABLE a01sigunguaddress (
    ZIP                      NUMBER(5) NOT NULL,
    SIDO                     VARCHAR2(21) NOT NULL,
    SIGUNGU                 VARCHAR2(25),
    EUMMYEON                  VARCHAR2(18),
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
    constraint PK_a01sigunguaddress primary key (ADDRESSID)
);
insert into a01sigunguaddress (
    select * from address2 where SIGUNGU in (
        select k from (
            select k, count(*) as c from (
                select SIGUNGU as k, SIDO, count(*) from address2 group by SIGUNGU, SIDO order by SIGUNGU
            ) group by k
        ) where c > 1 and k not in (select keyword from addresskeyword)
    )
);
insert into addresskeyword 
select k, 1, 0, 1 from (
    select k, count(*) as c from (
        select SIGUNGU as k, SIDO, count(*) from address2 group by SIGUNGU, SIDO order by SIGUNGU
    ) group by k
) where c > 1 and k not in (select keyword from addresskeyword);

CREATE TABLE a02eummyeonaddress (
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
    constraint PK_a02eummyeonaddress primary key (ADDRESSID)
);
insert into a02eummyeonaddress (
    select * from address2 where EUMMYEON in (
        select k from (
            select k, count(*) as c from (
                select EUMMYEON as k, SIDO, count(*) from address2 group by EUMMYEON, SIDO order by EUMMYEON
            ) group by k
        ) where c > 1 and k not in (select keyword from addresskeyword)
    )
);
insert into addresskeyword 
select k, 2, 0, 2 from (
    select k, count(*) as c from (
        select EUMMYEON as k, SIDO, count(*) from address2 group by EUMMYEON, SIDO order by EUMMYEON
    ) group by k
) where c > 1 and k not in (select keyword from addresskeyword);

CREATE TABLE a05donglawaddress (
    ZIP                      NUMBER(5) NOT NULL,
    SIDO                     VARCHAR2(21) NOT NULL,
    SIGUNGU                 VARCHAR2(25),
    EUMMYEON                  VARCHAR2(18),
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
    constraint PK_a05donglawaddress primary key (ADDRESSID)
);
insert into a05donglawaddress (
    select * from address2 where DONGLAW in (
        select k from (
            select k, count(*) as c from (
                select DONGLAW as k, SIDO, count(*) from address2 group by DONGLAW, SIDO order by DONGLAW
            ) group by k
        ) where c > 1 and k not in (select keyword from addresskeyword)
    )
);
insert into addresskeyword 
select k, 5, 0, 5 from (
    select k, count(*) as c from (
        select DONGLAW as k, SIDO, count(*) from address2 group by DONGLAW, SIDO order by DONGLAW
    ) group by k
) where c > 1 and k not in (select keyword from addresskeyword);

CREATE TABLE a06liaddress (
    ZIP                      NUMBER(5) NOT NULL,
    SIDO                     VARCHAR2(21) NOT NULL,
    SIGUNGU                 VARCHAR2(25),
    EUMMYEON                  VARCHAR2(18),
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
    constraint PK_a06liaddress primary key (ADDRESSID)
);
insert into a06liaddress (
    select * from address2 where LI in (
        select k from (
            select k, count(*) as c from (
                select LI as k, SIDO, count(*) from address2 group by LI, SIDO order by LI
            ) group by k
        ) where c > 1 and k not in (select keyword from addresskeyword)
    )
);
insert into addresskeyword 
select k, 6, 0, 6 from (
    select k, count(*) as c from (
        select LI as k, SIDO, count(*) from address2 group by LI, SIDO order by LI
    ) group by k
) where c > 1 and k not in (select keyword from addresskeyword);

CREATE TABLE a03doroaddress (
    ZIP                      NUMBER(5) NOT NULL,
    SIDO                     VARCHAR2(21) NOT NULL,
    SIGUNGU                 VARCHAR2(25),
    EUMMYEON                  VARCHAR2(18),
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
    constraint PK_a03doroaddress primary key (ADDRESSID)
);
insert into a03doroaddress (
    select * from address2 where DORO in (
        select k from (
            select k, count(*) as c from (
                select DORO as k, SIDO, count(*) from address2 group by DORO, SIDO order by DORO
            ) group by k
        ) where c > 1 and k not in (select keyword from addresskeyword)
    )
);
insert into addresskeyword 
select k, 3, 0, 3 from (
    select k, count(*) as c from (
        select DORO as k, SIDO, count(*) from address2 group by DORO, SIDO order by DORO
    ) group by k
) where c > 1 and k not in (select keyword from addresskeyword);

CREATE TABLE a04buildingaddress (
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
    constraint PK_a04buildingaddress primary key (ADDRESSID)
);
insert into a04buildingaddress (
    select * from address2 where BUILDING in (
        select k from (
            select k, count(*) as c from (
                select BUILDING as k, SIDO, count(*) from address2 group by BUILDING, SIDO order by BUILDING
            ) group by k
        ) where c > 1 and k not in (select keyword from addresskeyword)
    )
);
insert into addresskeyword 
select k, 4, 0, 4 from (
    select k, count(*) as c from (
        select BUILDING as k, SIDO, count(*) from address2 group by BUILDING, SIDO order by BUILDING
    ) group by k
) where c > 1 and k not in (select keyword from addresskeyword);


insert into addresskeyword 
select key, 8, 0, TABLEID from (
    select key, TABLEID from (
        select SIDO as key, SIDO as s from address2 where SIDO in (
            select k from (select k, count(*) as c from (select SIDO as k, SIDO, count(*) from address2 group by SIDO, SIDO) group by k) where c = 1
        ) group by SIDO, SIDO
    ), sidos where s = SIDO
) where key not in (select keyword from addresskeyword);

insert into addresskeyword 
select key, 1, 0, TABLEID from (
    select key, TABLEID from (
        select SIGUNGU as key, SIDO as s from address2 where SIGUNGU in (
            select k from (select k, count(*) as c from (select SIGUNGU as k, SIDO, count(*) from address2 group by SIGUNGU, SIDO) group by k) where c = 1
        ) group by SIGUNGU, SIDO
    ), sidos where s = SIDO
) where key not in (select keyword from addresskeyword);

insert into addresskeyword 
select key, 2, 0, TABLEID from (
    select key, TABLEID from (
        select EUMMYEON as key, SIDO as s from address2 where EUMMYEON in (
            select k from (select k, count(*) as c from (select EUMMYEON as k, SIDO, count(*) from address2 group by EUMMYEON, SIDO) group by k) where c = 1
        ) group by EUMMYEON, SIDO
    ), sidos where s = SIDO
) where key not in (select keyword from addresskeyword);

insert into addresskeyword 
select key, 5, 0, TABLEID from (
    select key, TABLEID from (
        select DONGLAW as key, SIDO as s from address2 where DONGLAW in (
            select k from (select k, count(*) as c from (select DONGLAW as k, SIDO, count(*) from address2 group by DONGLAW, SIDO) group by k) where c = 1
        ) group by DONGLAW, SIDO
    ), sidos where s = SIDO
) where key not in (select keyword from addresskeyword);

insert into addresskeyword 
select key, 6, 0, TABLEID from (
    select key, TABLEID from (
        select LI as key, SIDO as s from address2 where LI in (
            select k from (select k, count(*) as c from (select LI as k, SIDO, count(*) from address2 group by LI, SIDO) group by k) where c = 1
        ) group by LI, SIDO
    ), sidos where s = SIDO
) where key not in (select keyword from addresskeyword);

insert into addresskeyword 
select key, 7, 0, TABLEID from (
    select key, TABLEID from (
        select ZIP as key, SIDO as s from address2 where ZIP in (
            select k from (select k, count(*) as c from (select ZIP as k, SIDO, count(*) from address2 group by ZIP, SIDO) group by k) where c = 1
        ) group by ZIP, SIDO
    ), sidos where s = SIDO
);

insert into addresskeyword 
select key, 3, 0, TABLEID from (
    select key, TABLEID from (
        select DORO as key, SIDO as s from address2 where DORO in (
            select k from (select k, count(*) as c from (select DORO as k, SIDO, count(*) from address2 group by DORO, SIDO) group by k) where c = 1
        ) group by DORO, SIDO
    ), sidos where s = SIDO
) where key not in (select keyword from addresskeyword);

insert into addresskeyword 
select key, 4, 0, TABLEID from (
    select key, TABLEID from (
        select BUILDING as key, SIDO as s from address2 where BUILDING in (
            select k from (select k, count(*) as c from (select BUILDING as k, SIDO, count(*) from address2 group by BUILDING, SIDO) group by k) where c = 1
        ) group by BUILDING, SIDO
    ), sidos where s = SIDO
) where key not in (select keyword from addresskeyword);


drop table sidos;


commit;
