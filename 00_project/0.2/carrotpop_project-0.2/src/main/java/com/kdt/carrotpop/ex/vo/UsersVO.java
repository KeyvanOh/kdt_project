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
public class UsersVO {
	/*
	 * USERID NOT NULL VARCHAR2(14) PASSWORD NOT NULL VARCHAR2(30) NICKNAME NOT NULL
	 * VARCHAR2(30) POSTCODE NOT NULL VARCHAR2(7) ADDRESS NOT NULL VARCHAR2(300)
	 * ADDRESSMORE NOT NULL VARCHAR2(300)
	 */

	private String userid;
	private String password;
	private String nickname;
	private String postcode;
	private String address;
	private String addressmore;

}
