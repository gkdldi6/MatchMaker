package com.kosta.matchmaker.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.matchmaker.domain.UserVO;
import com.kosta.matchmaker.service.MessageService;
import com.kosta.matchmaker.service.UserService;

@Controller
public class HomeController {

	@Inject
	private MessageService service;
	
	
	/*@RequestMapping("/")
	public String home() {
		return "home";
	}*/
	
	@RequestMapping("/matchmaker")
	public String matchmaker() {
		return "matchmaker";
	}
	
	@RequestMapping("/courts")
	public String courts() {
		return "courts/map";
	}

	@RequestMapping("/messages/write")
	public String MessagesWrite() {
		return "messages/write";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String listAllPost(Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		UserVO user = (UserVO) session.getAttribute("login");
		if(user == null){
			return "home";
		}
		String targetid = user.getUserid().toString();
		model.addAttribute("userid", targetid + "님  ");
		model.addAttribute("count","쪽지 [" + service.messageCount(targetid) + "]개"); //쪽지 개수
		model.addAttribute("logout","로그아웃");
		return "home";
	}
	
	
}
