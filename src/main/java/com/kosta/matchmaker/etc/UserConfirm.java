package com.kosta.matchmaker.etc;

import java.net.PasswordAuthentication;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.util.mime.MimeUtility;
import org.aspectj.bridge.Message;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

public class UserConfirm {

//	@RequestMapping(value = "/login", method = RequestMethod.GET)
//	public void loginGet(@ModelAttribute("dto") LoginDTO dto){
//	
//	}
	
	@RequestMapping("/users/emailConfirm")
	public ModelAndView EmailAuth(HttpServletResponse response, HttpServletRequest request) throws Exception{

		//String email = request.getParameter("email");
		String email = "sunjoong91@naver.com";
		String authNum = RandomNum();

		sendEmail(email, authNum);
		System.out.println("이메일 보내짐ㅅㅅ");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/users/emailConfirm");
		mv.addObject("email", email);
		mv.addObject("authNum", authNum);

		return mv;
		
	}

	private void sendEmail(String email, String authNum){
		//System.out.println("이메일 보내짐ㅅㅅ");
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
			System.out.println("사망ㅅㅅ");
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
