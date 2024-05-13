package com.kdt.carrotpop.ex.mapper;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.kdt.carrotpop.ex.vo.UserAuthorityVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class UserMapperTest {
	@Autowired
	private UserMapper userMapper;

	@Test
	void test() {
		// fail("Not yet implemented");
		System.out.println(userMapper.getUser("jk"));
		
		//System.out.println(new BCryptPasswordEncoder().encode("member2"));
	}

	//@Disabled
	@Test
	void testInsertUser() {
		// UserVO user = new UserVO();
		UserAuthorityVO user = new UserAuthorityVO();
		
		user.setRank(0);
		user.setUser_id("member2");
		user.setPwd(new BCryptPasswordEncoder().encode("member2"));
		user.setName("username");
		user.setBirth("920619");
		user.setTel("0000000000");
		user.setStore_name("storename");
		user.setOpen_date("240101");
		user.setStore_visit(0);
		user.setSale_num(0);
		user.setDelivery_num(0);
		//user.setImage(null);
		user.setImage("#");
		user.setFollower(0);
		user.setFollowing(0);
		user.setGood_num(0);
		user.setIntroduction("HI");
		

		// user.setUsername("member2");
		// user.setPassword(new BCryptPasswordEncoder().encode("member2"));
		// user.setEnabled(1);

		userMapper.insertUser(user);
		// userMapper.insertAuthorities(user);
		// userMapper.insertAuthoritiesAdmin(user);

	}
}
