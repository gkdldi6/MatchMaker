package com.kosta.matchmaker.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NavbarController {

	/*메인*/
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/matchmaker")
	public String matchmaker() {
		return "matchmaker";
	}
	
	/*게시판*/
	@RequestMapping("/boards")
	public String board() {
		return "boards/list";
	}
	
	@RequestMapping("/boards/write")
	public String write() {
		return "boards/write";
	}
	
	@RequestMapping("/boards/{bno}")
	public String read(@PathVariable int bno) {
		return "boards/read";
	}
	
	/*회원*/
	@RequestMapping("/users/register")
	public String register() {
		return "users/register";
	}
	
	/*농구 코트*/
	@RequestMapping("/courts")
	public String courts() {
		return "courts/courts";
	}
	
}
