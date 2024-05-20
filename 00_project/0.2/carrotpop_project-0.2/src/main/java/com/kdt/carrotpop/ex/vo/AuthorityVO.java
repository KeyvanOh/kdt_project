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
public class AuthorityVO implements GrantedAuthority {
	@Override
	public String getAuthority() {
		// return null;
		return String.valueOf(this.role);
	}

	/*
	 * USERID NOT NULL VARCHAR2(14) ROLE NOT NULL NUMBER(1)
	 */

	private String userid;
	private int role;

	public String getUserid() {
		return userid;
	}

	public int getRole() {
		return role;
	}
}