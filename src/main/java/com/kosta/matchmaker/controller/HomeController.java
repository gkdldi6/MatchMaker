package com.kosta.matchmaker.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String home() {
		return "home";
	}

	@RequestMapping("/matchmaker")
	public String matchmaker() {
		return "matchmaker";
	}

	@RequestMapping("/courts")
	public String courts() {
		return "courts/map";
	}

//	@RequestMapping("/admin")
//	public String admin() {
//		return "adminhome";
//	}

}
