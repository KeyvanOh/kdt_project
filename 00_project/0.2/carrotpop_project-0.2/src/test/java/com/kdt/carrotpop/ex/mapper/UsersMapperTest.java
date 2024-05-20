package com.kdt.carrotpop.ex.mapper;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.kdt.carrotpop.ex.vo.AuthorityVO;
import com.kdt.carrotpop.ex.vo.UsersVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class UsersMapperTest {
	@Autowired
	private UsersMapper usersMapper;

	@Disabled
	@Test
	void getUserTest() {
		System.out.println(usersMapper.getUser("jk"));
	}

	@Disabled
	@Test
	void getUserAuthorityTest() {
		System.out.println(usersMapper.getUserAuthority("jk"));
	}

	@Disabled
	@Test
	void testInsertUser() {
		String userid = "jk4";
		UsersVO user = new UsersVO(userid, new BCryptPasswordEncoder().encode("0619"), "JK", "00000",
				"경기도 성남시 중원구 어디동 어디길", "어디 고시원 몇호");
		AuthorityVO authority = new AuthorityVO(userid, 0);
		usersMapper.insertUser(user);
		usersMapper.insertAuthority(authority);
	}

	@Disabled
	@Test
	void testNewUser() {
		System.out.println(usersMapper.selectAuthorityList("jk3"));
		System.out.println(usersMapper.selectAuthorityList("jk3").size());
	}
	
	
	
	
	
	

}
