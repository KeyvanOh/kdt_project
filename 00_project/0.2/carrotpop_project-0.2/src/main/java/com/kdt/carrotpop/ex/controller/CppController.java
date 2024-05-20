package com.kdt.carrotpop.ex.controller;

import java.security.Principal;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
//@RequestMapping("/board")
public class CppController {

	// @Autowired
	// private BoardService boardService;

	// @GetMapping("/list")
	@GetMapping("/")
	// public String list(Model model) {
	public String main() {
		System.out.println("main()..");
		// model.addAttribute("boards", boardService.getList());

		return "/main";
		// return "/login";
		// return "/main.html";
	}

	@GetMapping("/login")
	public String login() {
		log.info("login()..");
		return "/login";
	}
	
	@GetMapping("/fleamarket")
	public String fleamarket() {
		log.info("fleamarket()..");
		return "/fleamarket";
	}
	
	@GetMapping("/register")
	public String register() {
		log.info("register()..");
		return "/register";
	}
	
	@GetMapping("/postingitem")
	public String postingitem() {
		log.info("postingitem()..");
		return "/postingitem";
	}
	
//	@GetMapping("/logout")
//	public String logout() {
//		log.info("logout()..");
//		return "/main";
//	}

	@GetMapping("/loginInfo")
	public String loginInfo(Authentication authentication, Principal principal, Model model) {
		log.info("loginInfo()..");
		if (principal != null) {
			System.out.println(principal.getClass());
			System.out.println(principal.getName());

			System.out.println(authentication.getAuthorities());
			System.out.println(authentication.getDetails());
			System.out.println(authentication.getClass());
			System.out.println(authentication.getPrincipal());

			UserDetails user = (UserDetails) authentication.getPrincipal();
			System.out.println(user.getPassword());
			System.out.println(user.getUsername());
			System.out.println(user.getAuthorities());
			System.out.println(user.getClass());

			WebAuthenticationDetails web = (WebAuthenticationDetails) authentication.getDetails();
			System.out.println(web.getSessionId());
			System.out.println(web.getClass());
			System.out.println(web.getRemoteAddress());

			// SecurityContextHolder holder = web.
			UserDetails user2 = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			System.out.println(user2.getPassword());
			System.out.println(user2.getUsername());
			System.out.println(user2.getAuthorities());
			System.out.println(user2.getClass());			
		} else {
			System.out.println("LOGOUT SUSSESS I GUESS?");
		};


		return "/main";
	}

}
