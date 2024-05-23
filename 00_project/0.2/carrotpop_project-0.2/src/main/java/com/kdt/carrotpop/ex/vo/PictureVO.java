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
public class PictureVO {
	/*
	 * ITEMID NOT NULL NUMBER(19) ORDERINDEX NOT NULL NUMBER(2)
	 */
	private long itemid;
	private int orderindex;
}