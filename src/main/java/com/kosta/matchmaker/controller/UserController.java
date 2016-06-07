package com.kosta.matchmaker.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	/*로그인 페이지 이동*/
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGet(@ModelAttribute("dto") LoginDTO dto){}
	
	/*로그인*/
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPost(LoginDTO dto, HttpSession session, Model model, RedirectAttributes rttr)throws Exception{
		
		UserVO user = service.login(dto);
		
		if(user == null){
			rttr.addAttribute("result", "fail");
			return "users/login";
		}
		
		model.addAttribute("userVO", user);
		rttr.addAttribute("result", "success");
		return "/boards";
		
	}
	
	/*회원가입 페이지 이동*/ 
	@RequestMapping(value = "/join", method=RequestMethod.GET)
	public void joinGet() throws Exception {}
	
	/*회원가입*/
	@RequestMapping(value = "/join", method=RequestMethod.POST)
	public String joinPost(RedirectAttributes rttr, UserVO user) throws Exception {
	
		service.join(user);
		rttr.addFlashAttribute("result", "joinSuccess");
			
		return "redirect:/users/login";
		
	}
	
	/*아이디 중복 확인*/
	@ResponseBody
	@RequestMapping(value = "/join/idCheck", method=RequestMethod.POST)
	public String idCheck(RedirectAttributes rttr, @RequestParam("userid") String userid) throws Exception{

		int result = service.userIdCheck(userid);
		
		if(result == 1){
			return "idCheckSuccess";
		}else{ 
			return "idCheckFail";
		}
		
	}
	
}
