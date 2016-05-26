package com.kosta.matchmaker.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/users")
public class UserController {

	@RequestMapping("/register")
	public String register() {
		return "users/register";
	}
	
}
