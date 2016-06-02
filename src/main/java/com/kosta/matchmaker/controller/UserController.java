package com.kosta.matchmaker.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.matchmaker.domain.LoginDTO;
import com.kosta.matchmaker.domain.UserVO;
import com.kosta.matchmaker.service.UserService;

@Controller
@RequestMapping("/users")
public class UserController {

	@Inject
	private UserService service;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGet(@ModelAttribute("dto") LoginDTO dto){
	
	}
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPOST(LoginDTO dto, HttpSession session, Model model, RedirectAttributes rttr)throws Exception{
		
		UserVO user = service.login(dto);
		
		if(user == null){
			rttr.addFlashAttribute("result", "fail");
			return "redirect:/users/login";
		}
		
		model.addAttribute("userVO",user);
		return "boards/list";
		
	}
	
	//회원가입 페이지 이동 
	@RequestMapping(value = "/join", method=RequestMethod.GET)
	public void join() throws Exception {

	}
	//아이디 체크
	@ResponseBody
	@RequestMapping(value = "/join/idCheck", method=RequestMethod.POST)
	public String idCheck(RedirectAttributes rttr, HttpServletRequest request) throws Exception{
		String userid = request.getParameter("userid");
		int result = service.userIdCheck(userid);
		
		if(result == 1){
			return "idCheckSuccess";
		}else{ 
			return "idCheckFail";
		}
		
	}
		
	
	//회원가입
	@RequestMapping(value = "/join", method=RequestMethod.POST)
	public String write(RedirectAttributes rttr, UserVO user,String userid) throws Exception {
		int result = service.userIdCheck(userid);
		if(result ==1){
			service.join(user);
			rttr.addFlashAttribute("result", "joinSuccess");
			return "redirect:/";
		}
		return "";
	}
	
}
