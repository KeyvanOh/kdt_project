package com.kdt.carrotpop.ex.security;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.kdt.carrotpop.ex.mapper.UserMapper;
import com.kdt.carrotpop.ex.vo.UserAuthorityVO;
import com.kdt.carrotpop.ex.vo.UserDetailsVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CppUserDetailsService implements UserDetailsService {
	@Autowired
	private UserMapper userMapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn("Load User By UserAuthorityVO member: " + username);

		List<UserAuthorityVO> users = userMapper.getUser(username);

		// return null;
		return users == null ? null : new UserDetailsVO(users.get(0));
	}

}