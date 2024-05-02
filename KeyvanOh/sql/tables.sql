desc dept;
desc emp;


desc t_users;
select * from t_users;

drop table t_users;
create table t_users (
    rank number(1),
    user_id varchar2(14) primary key,
    pwd varchar2(30),
    name varchar2(14),
    birth varchar2(4),
    tel varchar2(12),
    store_name varchar2(30),
    open_date varchar2(6),
    store_visit number(19),
    sale_num number(19),
    delivery_num number(19),
    image varchar2(1000),
    follower number(19),
    following number(19),
    good_num number(19),
    introduction varchar2(4000)
);

commit;


insert into t_users values (
    0,
    'jk',
    '0619',
    'jko',
    '0101',
    '0100000000',
    'JKO House',
    '240430',
    0,
    0,
    0,
    null,
    0,
    0,
    0,
    'Salam!'
);


commit;


desc t_categories;
select * from t_categories;
drop table t_categories;
create table t_categories (
    category_id number(19) primary key,
    name varchar2(30)
);

desc t_category_des;
select * from t_category_des;
drop table t_category_des;
create table t_category_des (
    category_de_id number(19) primary key,
    name varchar2(30),
    category_id number(19),
    constraint FK_CategoryDes foreign key (category_id) references t_categories(category_id)
);

desc t_category_de_des;
select * from t_category_de_des;
drop table t_category_de_des;
create table t_category_de_des (
    category_de_de_id number(19) primary key,
    name varchar2(30),
    category_de_id number(19),
    constraint FK_CategoryDesDedes foreign key (category_de_id) references t_category_des(category_de_id)
);

commit;


desc emp;

desc t_users;


desc t_goods;
select * from t_goods;
drop table t_goods;
create table t_goods (
    goods_id number(19) primary key,
    title varchar2(100),
    category_id number(19),
    category_de_id number(19),
    category_de_de_id number(19),
    area varchar2(1000),
    state number(1),
    exchange number(1),
    price number(10),
    delivery_fee number(4)
    //content varchar2(4000)
    //count number(3),
    //heart number(19),
    //view number(19),
    //writeday date,
    //user_id varchar2(14),
    //sale_state number(1)
);

commit;



















