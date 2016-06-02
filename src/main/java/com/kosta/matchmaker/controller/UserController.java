package com.kosta.matchmaker.controller;

import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
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
	
	//이메일
	@RequestMapping("/emailAuth")
	public ModelAndView emailAuth(HttpServletResponse response, HttpServletRequest request)throws Exception{
		
		String email = request.getParameter("email");
		String authNum ="";
		
		authNum = RandomNum();
		
		sendEmail(email.toString(),authNum);
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/user/emailAuth.jsp");
		mv.addObject("email",email);
		mv.addObject("authNum",authNum);
		
		return mv;
	}
	
	private void sendEmail(String email, String authNum){
		String host = "smtp.gamil.com";
		String subject = "인증번호 테스트";
		String fromName = "갓선중";
		String from = "sunjoong91@gmail.com";
		String to1 = email;
		
		String content = "인증번호는 [" + authNum + "]";
		try{
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.trans.protocal", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port","465");
			props.put("mail.smtp.user",from);
			props.put("mail.smtp.auth","true");
		
			Session mailSession = Session.getInstance(props,new javax.mail.Authenticator(){
				protected PasswordAuthentication getPasswordAuthentication(){
					return new PasswordAuthentication("sunjoong91", "password");
				}
			});
			
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from,MimeUtility.encodeText(fromName,"UTF-8","B")));
			
			InternetAddress[] address1 = {new InternetAddress(to1)};
			msg.setRecipients(Message.RecipientType.TO, address1);//받는 사람설정
			msg.setSubject(subject);//제목설정
			msg.setSentDate(new java.util.Date());
			msg.setContent(content,"text/html;charset=utf-8");
		
			Transport.send(msg);
		}catch(MessagingException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public String RandomNum(){
		StringBuffer buffer = new StringBuffer();
		for(int i=0; i<=6;i++){
			int n =(int) (Math.random()*10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	
}
