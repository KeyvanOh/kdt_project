drop table wish;
drop table deal;
drop table comments;
drop table item;
drop table authority;
drop table users;
drop table itemcategory;
drop table cppaddress;

drop sequence item_sequence;
drop sequence address_sequence;

create sequence address_sequence start with 1 increment by 1;
create sequence item_sequence start with 1 increment by 1;

create table cppaddress(
    addressid number(19) not null,
    jiyeok varchar2(30) not null,
    dongne varchar2(30) not null,
    dong varchar2(30) not null,
    constraint PK_Cppaddress primary key (addressid)
);
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
    postcode varchar2(7) not null,
    address varchar2(300) not null,
    addressmore varchar2(300) not null,
    addressid number(19) not null,
    constraint FK_CppaddressUser foreign key (addressid) references cppaddress(addressid),
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

commit;
