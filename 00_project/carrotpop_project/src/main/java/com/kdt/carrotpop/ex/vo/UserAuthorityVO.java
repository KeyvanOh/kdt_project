package com.kdt.carrotpop.ex.vo;

import org.springframework.security.core.GrantedAuthority;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
//@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class UserAuthorityVO implements GrantedAuthority {
	/*
	 * private String username; private String password; private int enabled;
	 * 
	 * private String authority;
	 */

	/*
	 * RANK NUMBER(1) USER_ID NOT NULL VARCHAR2(14) PWD VARCHAR2(30) NAME
	 * VARCHAR2(14) BIRTH VARCHAR2(4) TEL VARCHAR2(12) STORE_NAME VARCHAR2(30)
	 * OPEN_DATE VARCHAR2(6) STORE_VISIT NUMBER(19) SALE_NUM NUMBER(19) DELIVERY_NUM
	 * NUMBER(19) IMAGE VARCHAR2(1000) FOLLOWER NUMBER(19) FOLLOWING NUMBER(19)
	 * GOOD_NUM NUMBER(19) INTRODUCTION VARCHAR2(4000)
	 */

	private int rank;
	private String user_id;
	private String pwd;
	private String name;
	private String birth;
	private String tel;
	private String store_name;
	private String open_date;
	private int store_visit;
	private int sale_num;
	private int delivery_num;
	private String image;
	//private String image = null;
	private int follower;
	private int following;
	private int good_num;
	private String introduction;

	// private String authority = null;
	// private String authority = "0";

	@Override
	public String getAuthority() {
		// return authority;
		return String.valueOf(this.rank);
	}

	public int getRank() {
		return rank;
	}

	public String getUser_id() {
		return user_id;
	}

	public String getPwd() {
		return pwd;
	}

	public String getName() {
		return name;
	}

	public String getBirth() {
		return birth;
	}

	public String getTel() {
		return tel;
	}

	public String getStore_name() {
		return store_name;
	}

	public String getOpen_date() {
		return open_date;
	}

	public int getStore_visit() {
		return store_visit;
	}

	public int getSale_num() {
		return sale_num;
	}

	public int getDelivery_num() {
		return delivery_num;
	}

	public String getImage() {
		return image;
	}

	public int getFollower() {
		return follower;
	}

	public int getFollowing() {
		return following;
	}

	public int getGood_num() {
		return good_num;
	}

	public String getIntroduction() {
		return introduction;
	}

}
