package com.kdt.carrotpop.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kdt.carrotpop.ex.vo.AuthorityVO;
import com.kdt.carrotpop.ex.vo.CppGrantedAuthority;
import com.kdt.carrotpop.ex.vo.UsersVO;

@Mapper
public interface UsersMapper {
	List<UsersVO> getUser(String userid);

	List<CppGrantedAuthority> getUserAuthority(String userid);

	void insertUser(UsersVO user);

	void insertAuthority(AuthorityVO authority);

	List<AuthorityVO> selectAuthorityList(String userid);

}