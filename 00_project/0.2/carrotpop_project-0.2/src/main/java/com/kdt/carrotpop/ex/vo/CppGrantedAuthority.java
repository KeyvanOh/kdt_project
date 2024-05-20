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
public class CppGrantedAuthority implements GrantedAuthority {
	/*
	 * USERID NOT NULL VARCHAR2(14) PASSWORD NOT NULL VARCHAR2(30) NICKNAME NOT NULL
	 * VARCHAR2(30) POSTCODE NOT NULL VARCHAR2(7) ADDRESS NOT NULL VARCHAR2(300)
	 * ADDRESSMORE NOT NULL VARCHAR2(300)
	 */

	private String userid;
	private String password;
	private int role;

	@Override
	public String getAuthority() {
		return String.valueOf(this.role);
	}

	public String getUserid() {
		return userid;
	}

	public String getPassword() {
		return password;
	}

	public int getRole() {
		return role;
	}

}
