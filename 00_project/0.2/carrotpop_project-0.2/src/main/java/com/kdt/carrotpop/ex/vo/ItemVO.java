package com.kdt.carrotpop.ex.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ItemVO {

	/*
	 * ITEMID NOT NULL NUMBER(19) SELLERID NOT NULL VARCHAR2(14) TITLE NOT NULL
	 * VARCHAR2(100) PRICE NOT NULL NUMBER(10) CATEGORY1 NOT NULL NUMBER(2)
	 * CATEGORY2 NUMBER(4) UPLOADTIME NOT NULL DATE CONTENT NOT NULL VARCHAR2(4000)
	 * HIT NOT NULL NUMBER(19)
	 */

	private long itemid;
	private String sellerid;
	private String title;
	private int price;
	private int category1;
	private int category2;
	private Date uploadtime;
	private String content;
	private long hit;

}