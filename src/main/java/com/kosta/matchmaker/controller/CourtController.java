package com.kosta.matchmaker.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/courts")
public class CourtController {
	
	@RequestMapping("")
	public String courts() {
		return "courts/courts";
	}
	
}
