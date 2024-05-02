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
    delivery_fee number(4),
    goods_content varchar2(4000),
    count number(3),
    heart number(19),
    hits number(19),
    writeday date,
    user_id varchar2(14),
    sale_state number(1),
    constraint FK_UserGoods foreign key (user_id) references t_users(user_id),
    constraint FK_CategoryGoods foreign key (category_id) references t_categories(category_id),
    constraint FK_CategorydesGoods foreign key (category_de_id) references t_category_des(category_de_id),
    constraint FK_CategorydedesGoods foreign key (category_de_de_id) references t_category_de_des(category_de_de_id)
);

commit;




desc t_reviews;
select * from t_reviews;
drop table t_reviews;
create table t_reviews (
    review_id number(19) primary key,
    user_id varchar2(14),
    goods_id number(19),
    star number(1),
    review_content varchar2(1000),
    writeday date,
    constraint FK_UserReviews foreign key (user_id) references t_users(user_id),
    constraint FK_GoodsReviews foreign key (goods_id) references t_goods(goods_id)
);

commit;





desc t_alarm;
select * from t_alarm;
drop table t_alarm;
create table t_alarm (
    alarm_id number(19) primary key,
    alarm_content varchar2(1000),
    writeday date,
    goods_id number(19),
    user_id varchar2(14),
    constraint FK_UserAlarm foreign key (user_id) references t_users(user_id),
    constraint FK_GoodsAlarm foreign key (goods_id) references t_goods(goods_id)
);

commit;



desc t_heart_goods;
select * from t_heart_goods;
drop table t_heart_goods;
create table t_heart_goods (
    heart_id number(19) primary key,
    goods_id number(19),
    user_id varchar2(14),
    constraint FK_UserHeart foreign key (user_id) references t_users(user_id),
    constraint FK_GoodsHeart foreign key (goods_id) references t_goods(goods_id)
);

commit;



desc t_questions;
select * from t_questions;
drop table t_questions;
create table t_questions (
    question_id number(19) primary key,
    user_id varchar2(14),
    question_content varchar2(4000),
    goods_id number(19),
    writeday date,
    constraint FK_UserQuestion foreign key (user_id) references t_users(user_id),
    constraint FK_GoodsQuestion foreign key (goods_id) references t_goods(goods_id)
);

commit;





desc t_question_comments;
select * from t_question_comments;
drop table t_question_comments;
create table t_question_comments (
    question_comment_id number(19) primary key,
    user_id varchar2(14),
    question_id number(19),
    question_comment_content varchar2(1000),
    writeday date,
    constraint FK_QuestionQuestioncomments foreign key (question_id) references t_questions(question_id),
    constraint FK_UserQuestioncomments foreign key (user_id) references t_users(user_id)
);

commit;





































