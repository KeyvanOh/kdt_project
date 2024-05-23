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
	ITEMID         NOT NULL NUMBER(19)     
	SELLERID       NOT NULL VARCHAR2(14)   
	TITLE          NOT NULL VARCHAR2(100)  
	PRICE          NOT NULL NUMBER(10)     
	CATEGORYNUMBER NOT NULL NUMBER(2)      
	UPLOADTIME     NOT NULL DATE           
	CONTENT        NOT NULL VARCHAR2(4000) 
	HIT            NOT NULL NUMBER(19)     
	HOWMANYIMGS    NOT NULL NUMBER(2)     	
	*/
	private long itemid;
	private String sellerid;
	private String title;
	private int price;
	private int categorynumber;
	private Date uploadtime;
	private String content;
	private long hit;
	private int howmanyimgs;
	
}