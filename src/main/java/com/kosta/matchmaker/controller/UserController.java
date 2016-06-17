package com.kosta.matchmaker.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.matchmaker.domain.LoginDTO;
import com.kosta.matchmaker.domain.UserVO;
import com.kosta.matchmaker.service.UserService;

import net.tanesha.recaptcha.ReCaptchaResponse;

@Controller
@RequestMapping("/users")
public class UserController {

	@Inject
	private UserService service;
	
	/*로그인 페이지 이동*/
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGet() {}
	
	/*로그인*/
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPost(LoginDTO dto, Model model)throws Exception{
		
		UserVO user = service.login(dto);
		
		if(user == null){
			return;
		}
		
		model.addAttribute("userVO", user);
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
	//캡차
	@ResponseBody
	@RequestMapping(value = "/test/validateRecaptcha", method = RequestMethod.POST)
	public String validateRecaptcha(@RequestParam Map<String, String> paramMap) {
	    
		service.reCaptcha();
		
	    String check = "";
	    String host = paramMap.get("host");
	    String challenge = paramMap.get("challenge");
	    String res = paramMap.get("response");
	    
	    ReCaptchaResponse reCaptchaResponse = service.reCaptcha().checkAnswer(host, challenge, res);
	 
	    if (reCaptchaResponse.isValid()) {
	        //System.out.println("true");
	        check = "Y";
	    } else {
	        //System.out.println("false");
	        check = "N";
	    }
	     
	    return check;
	}
	
	@RequestMapping(value = "/recapcha", method=RequestMethod.GET)
	public void validateRecaptcha() throws Exception {}
	
}
