package com.kosta.matchmaker.test;

import java.util.Scanner;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta.matchmaker.domain.UserVO;
import com.kosta.matchmaker.mail.MailSend;
import com.kosta.matchmaker.mail.RandomString;
import com.kosta.matchmaker.service.UserService;
import com.kosta.matchmaker.util.work.crypt.SHA256;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class UserServiceTest {
	
	SHA256 sha = SHA256.getInsatnce();
	
	@Inject
	private UserService service;
	
	@Test
	public void findId() throws Exception{
		
		RandomString random = new RandomString();
		
		String authNum = random.RandumPass(6);
		
		String username = "user00";
		String email = "sunjoong91@naver.com";
		
		UserVO user = service.findId(username, email);
		if(user != null){
			MailSend mailsend = new MailSend();
			mailsend.sendMail(email, authNum);
			
			Scanner scanner = new Scanner(System.in);
			
			System.out.println("인증번호를 입력하세요 : ");
			String temp = scanner.next();
			if(temp.equals(authNum)){
				System.out.println("아이디 : " + user.getUserid());
			}else{
				System.out.println("인증번호가 잘못되었습니다.");
			}
		}else{
			System.out.println("찾고자하는 회원이 없습니다.");
		}
	}
	
	@Test
	public void findPassword() throws Exception{
		RandomString random = new RandomString();
		
		String authNum = random.RandumPass(6);
		
		String username = "김선중";
		String email = "sunjoong91@nate.com";
		String userid = "user00";

		UserVO user = service.findPassword(username, userid, email);
		if(user != null){
			MailSend mailsend = new MailSend();
			mailsend.sendMail(email, authNum);
			
			Scanner scanner = new Scanner(System.in);
			
			System.out.println("인증번호를 입력하세요 : ");
			String temp = scanner.next();
			if(temp.equals(authNum)){
				System.out.println("바뀌기전 비밀번호" + user.getUserpw());
				System.out.println("비밀번호를 입력해 주세요");
				String newPassword = scanner.next();
				
	    		user.setUserpw(newPassword);
		        service.update(user);
		        System.out.println("바뀐후 비밀번호" + user.getUserpw());
			}else{
				System.out.println("인증번호가 잘못되었습니다.");
			}
		}else{
			System.out.println("찾고자하는 회원이 없습니다.");
		}
	}
}
