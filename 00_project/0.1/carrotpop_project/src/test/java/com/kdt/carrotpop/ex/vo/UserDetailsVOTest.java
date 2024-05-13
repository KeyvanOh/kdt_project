package com.kdt.carrotpop.ex.vo;

import static org.junit.jupiter.api.Assertions.assertNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kdt.carrotpop.ex.mapper.UserMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class UserDetailsVOTest {

	// @Autowired
	// private UserDetailsVO userDetailsVO;

	@Autowired
	private UserMapper userMapper;

	@Test
	void test() {
		// fail("Not yet implemented");
		// UserDetailsVO userDetailsVO = new UserDetailsVO(new UserAuthorityVO());
		UserDetailsVO userDetailsVO = new UserDetailsVO(userMapper.getUser("jk").get(0));
		
		//System.out.println("authorities: " + userDetailsVO.getAuthorities());
		//System.out.println(userDetailsVO.getAuthorities());
		System.out.println(userDetailsVO);
		System.out.println(userDetailsVO.getUsername());
		System.out.println(userDetailsVO.getAuthorities());
		//assertNotNull(userDetailsVO.getAuthorities());
		//assertNull(userDetailsVO.getAuthorities());
	}

}
