package com.kdt.carrotpop.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
//@RequestMapping("/board")
public class CpController {

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
		return "/main";
	}

}
