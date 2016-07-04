package com.kosta.matchmaker.controller;

import org.springframework.stereotype.Controller;
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
	
	@RequestMapping("/map")
	public String courts() {
		return "courts/map";
	}
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String listAllPost(Model model, HttpServletRequest request) throws Exception {
//		HttpSession session = request.getSession();
//		UserVO user = (UserVO) session.getAttribute("login");
//		if(user == null){
//			return "home";
//		}
//		String targetid = user.getUserid().toString();
//		model.addAttribute("userid", targetid + "님  ");
//		model.addAttribute("count","쪽지 [" + service.messageCount(targetid) + "]개"); //쪽지 개수
//		model.addAttribute("logout","로그아웃");
//		return "home";
//	}
	
}
