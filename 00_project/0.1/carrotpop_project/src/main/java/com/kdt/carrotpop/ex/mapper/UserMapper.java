package com.kdt.carrotpop.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kdt.carrotpop.ex.vo.UserAuthorityVO;


@Mapper
public interface UserMapper {
	List<UserAuthorityVO> getUser(String username);

	void insertUser(UserAuthorityVO user);

}
