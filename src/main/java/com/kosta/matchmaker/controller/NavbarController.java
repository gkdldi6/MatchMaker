package com.kosta.matchmaker.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NavbarController {

	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/boards")
	public String board() {
		return "board/board";
	}
	
	@RequestMapping("/matchmaker")
	public String matchmaker() {
		return "matchmaker";
	}
	
	@RequestMapping("/boards/write")
	public String write() {
		return "board/write";
	}
	
	@RequestMapping("/boards/{bno}")
	public String read(@PathVariable int bno) {
		System.out.println(bno);
		
		return "board/read";
	}
	
}
