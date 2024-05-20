package com.kdt.carrotpop.ex.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kdt.carrotpop.ex.service.CppService;
import com.kdt.carrotpop.ex.vo.AuthorityVO;
import com.kdt.carrotpop.ex.vo.UsersVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/ajax")
public class CppRestController {
	@Autowired
	private CppService cppService;
	
	
	@RequestMapping("/users_insert")
	public void usersInsert(
		@RequestParam("userid") String userid,
		@RequestParam("password") String password,
		@RequestParam("nickname") String nickname,
		@RequestParam("postcode") String postcode,
		@RequestParam("address") String address,
		@RequestParam("addressmore") String addressmore
	) {
		log.info("usersInsert()..");
		UsersVO vo = new UsersVO(userid, password, nickname, postcode, address, addressmore);
		cppService.registerUser(vo);
		
		
		//BuserVO vo = new BuserVO(buid, bupw);
		//boardService.registerBuser(vo);
	}
	
	
	@RequestMapping("/authority_list")
	public List<AuthorityVO> authorityList(
			@RequestParam("userid") String userid
			) {
		log.info("authority_list()..");
		return cppService.getListWithUserid(userid);
	}
	
	
	
	
	@GetMapping("/login_info")
	//public void loginInfo(Authentication authentication, Principal principal) {
	public String loginInfo(Authentication authentication, Principal principal) {
		log.info("loginInfo()..");
		String userid = null;
		if (principal != null) {
			UserDetails user = (UserDetails) authentication.getPrincipal();
			System.out.println(user.getUsername());
			System.out.println(user.getAuthorities());
			userid = user.getUsername();
		} else {
			System.out.println("LOGOUT SUSSESS I GUESS?");
			//userid = null;
		}
		return userid;

		//return "/main";
	}	
	
	
	
	
	
	
	
	
	
}
