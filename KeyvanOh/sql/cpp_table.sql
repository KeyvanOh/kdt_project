drop table users;
create table users (
    userid varchar2(14) primary key,
    password varchar2(30) not null,
    nickname varchar2(30) not null,
    postcode varchar2(7) not null
);

alter table users
add address varchar2(300);

alter table users
modify address varchar2(300) not null;

alter table users
add addressmore varchar2(300);

alter table users
modify addressmore varchar2(300) not null;



desc users;
select * from users;

commit;




drop table item;
create table item (
    itemid number(19) primary key,
    sellerid varchar2(14) not null,
    title varchar2(100) not null,
    price number(10) not null,
    category1 number(2) not null,
    category2 number(4),
    uploadtime date not null,
    content varchar(4000) not null,
    hit number(19) not null,
    constraint FK_UserItem foreign key (sellerid) references users(userid)
);

desc item;
select * from item;

commit;

drop sequence item_sequence;
create sequence item_sequence start with 1 increment by 1;




drop table deal;
create table deal (
    dealid number(19) primary key,
    itemid number(19) not null,
    buyerid varchar2(14) not null,
    dealtime date not null,
    gooddeal number(1),
    constraint FK_ItemDeal foreign key (itemid) references item(itemid),
    constraint FK_UserDealBuyer foreign key (buyerid) references users(userid)
);

desc deal;
select * from deal;

commit;

drop sequence deal_sequence;
create sequence deal_sequence start with 1 increment by 1;




drop table comments;
create table comments (
    itemid number(19) not null,
    commentid number(19) primary key,
    parentcommentid number(19),
    userid varchar2(14) not null,
    content varchar2(1000) not null,
    commenttime date not null,
    constraint FK_ItemComment foreign key (itemid) references item(itemid),
    constraint FK_UserComment foreign key (userid) references users(userid)
);

desc comments;
select * from comments;

commit;

drop sequence comment_sequence;
create sequence comment_sequence start with 1 increment by 1;




drop table wish;
create table wish (
    wishid number(19) primary key,
    itemid number(19) not null,
    userid varchar2(14) not null,
    constraint FK_ItemWish foreign key (itemid) references item(itemid),
    constraint FK_UserWish foreign key (userid) references users(userid)
);

desc wish;
select * from wish;

commit;

drop sequence wish_sequence;
create sequence wish_sequence start with 1 increment by 1;



drop table address;
create table address (
    addressid number(19) primary key,
    userid varchar2(14) not null,
    do varchar2(30) not null,
    si varchar2(30) not null,
    gu varchar2(30) not null,
    dong varchar2(30) not null,
    constraint FK_UserAddress foreign key (userid) references users(userid)
);

desc address;
select * from address;

commit;

drop sequence address_sequence;
create sequence address_sequence start with 1 increment by 1;



drop table picture;
create table picture (
    pictureid number(19) primary key,
    itemid number(19) not null,
    orderindex number(2) not null,
    src varchar2(1000) not null,
    constraint FK_ItemPicture foreign key (itemid) references item(itemid)
);

desc picture;
select * from picture;

commit;

drop sequence picture_sequence;
create sequence picture_sequence start with 1 increment by 1;



drop table authority;
create table authority (
    authorityid number(19) primary key,
    userid varchar2(14) not null,
    role varchar2(20) not null,
    constraint FK_UserAuthority foreign key (userid) references users(userid)
);

desc authority;
select * from authority;

commit;

drop sequence authority_sequence;
create sequence authority_sequence start with 1 increment by 1;

