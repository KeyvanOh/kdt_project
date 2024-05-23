package com.kdt.carrotpop.ex.vo;

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
public class ItemcategoryVO {
	/*
	 * ITEMCATEGORYID NOT NULL NUMBER(2) ITEMCATEGORYNAME NOT NULL VARCHAR2(20)
	 */

	private int itemcategoryid;
	private String itemcategoryname;
}