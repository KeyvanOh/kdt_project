drop table sidos;
CREATE TABLE sidos (
    TABLEID NUMBER(2) NOT NULL,
    SIDO VARCHAR2(21) NOT NULL,
    constraint PK_Sidos primary key (TABLEID)
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
commit;
