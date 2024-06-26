package com.kdt.carrotpop.ex.service;

import java.util.List;

import com.kdt.carrotpop.ex.vo.AuthorityVO;
import com.kdt.carrotpop.ex.vo.ItemVO;
import com.kdt.carrotpop.ex.vo.ItemcategoryVO;
import com.kdt.carrotpop.ex.vo.UsersVO;

public interface CppService {

	void registerUser(UsersVO vo);

	List<AuthorityVO> getListWithUserid(String userid);

	List<ItemcategoryVO> getItemcategoryList();

	void uploadGoods(ItemVO vo);

	long getLatestItemid();
	
	//void uploadItem();

}
