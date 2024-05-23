package com.kdt.carrotpop.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kdt.carrotpop.ex.mapper.UsersMapper;
import com.kdt.carrotpop.ex.vo.AuthorityVO;
import com.kdt.carrotpop.ex.vo.ItemVO;
import com.kdt.carrotpop.ex.vo.ItemcategoryVO;
import com.kdt.carrotpop.ex.vo.UsersVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CppServiceImpl implements CppService {

	@Autowired
	private UsersMapper usersMapper;

	@Transactional
	@Override
	public void registerUser(UsersVO vo) {
		log.info("registerUser()..");

		/*
		 * String userid = "jk4"; UsersVO user = new UsersVO(userid, new
		 * BCryptPasswordEncoder().encode("0619"), "JK", "00000", "경기도 성남시 중원구 어디동 어디길",
		 * "어디 고시원 몇호"); AuthorityVO authority = new AuthorityVO(userid, 0);
		 * usersMapper.insertUser(user); usersMapper.insertAuthority(authority);
		 */

		String userid = vo.getUserid();
		String password = vo.getPassword();
		vo.setPassword(new BCryptPasswordEncoder().encode(password));
		AuthorityVO authority = new AuthorityVO(userid, 0);
		usersMapper.insertUser(vo);
		usersMapper.insertAuthority(authority);

		// usersMapper.insertUser(vo);
	}

	@Override
	public List<AuthorityVO> getListWithUserid(String userid) {
		log.info("getListWithUserid()..");
		// System.out.println(usersMapper.selectAuthorityList("jk3"));
		return usersMapper.selectAuthorityList(userid);
	}

	@Override
	public List<ItemcategoryVO> getItemcategoryList() {
		log.info("getItemcategoryList()..");
		// return null;
		return usersMapper.selectItemcategoryList();
	}

	@Override
	public void uploadGoods(ItemVO item) {
		log.info("uploadGoods()..");
		usersMapper.insertItem(item);
	}

	@Override
	public long getLatestItemid() {
		log.info("getLatestItemid()..");
		return usersMapper.selectItemidMax();
	}

}
