package com.kosta.matchmaker.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	
	/*로그인 페이지로 이동*/
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
	
	/*프로파일 페이지로 이동*/ 
	@RequestMapping(value = "/profile", method=RequestMethod.GET)
	public void getProfile() throws Exception {}
	
	/*회원가입 페이지로 이동*/ 
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
	@RequestMapping(value = "/recapcha", method=RequestMethod.GET)
	public void validateRecaptcha() throws Exception {}
	
	@ResponseBody
	@RequestMapping(value = "/validateRecaptcha", method = RequestMethod.POST)
	public String validateRecaptcha(@RequestParam Map<String, String> paramMap) {
	    
		service.reCaptcha();
		
	    String check = "";
	    String host = paramMap.get("host");
	    String challenge = paramMap.get("challenge");
	    String res = paramMap.get("response");
	    
	    ReCaptchaResponse reCaptchaResponse = service.reCaptcha().checkAnswer(host, challenge, res);
	 
	    if (reCaptchaResponse.isValid()) {
	        check = "Y";
	    } else {
	        check = "N";
	    }
	     
	    return check;
	}
	
	
	//로그 아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		if(session.getAttribute("login") !=null){
			session.removeAttribute("login");
			session.invalidate();
		}
		return "home";
	}
	
	//회원 정보 수정
	@RequestMapping(value = "/update", method=RequestMethod.GET)
	public void updateGet() throws Exception {}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updatePost(UserVO user, RedirectAttributes rttr) throws Exception{
		service.update(user);
		rttr.addFlashAttribute("result", "updatesuccess");
		
		return "redirect:/users/login";
	}
	
	//회원 인증(비밀번호 바꾸기전에 이전 비밀번호 확인)
	@ResponseBody
	@RequestMapping(value = "/update/authCheck", method=RequestMethod.POST)
	public String authCheck(RedirectAttributes rttr, @RequestParam("userid") String userid,
					@RequestParam("userpw") String userpw) throws Exception{
		int result = service.userAuth(userid, userpw);
		if(result == 1){
			return "authchecksuccess";
		}else{ 
			return "authcheckfail";
		}
		
	}
	
	//비밀번호 찾기
	@RequestMapping(value = "/findPassword", method =RequestMethod.GET)
	public String findPassword(){
		return "users/findPassword";
	}
	//아이디 찾기
	@RequestMapping(value = "/findId", method =RequestMethod.GET)
	public String findId(){
		return "users/findId";
	}
}
