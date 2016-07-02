package com.kosta.matchmaker.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta.matchmaker.domain.AdminVO;
import com.kosta.matchmaker.domain.UserVO;
import com.kosta.matchmaker.service.AdminService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class AdminServiceTest {

	@Inject
	private AdminService service;

	// 로그인 테스트
	@Test
	public void testLogin() throws Exception {

		AdminVO admin = service.login("2", "2");

		if (admin.getId().equals("2") && admin.getPw().equals("2")) {
			System.out.println("Login Success");
		} else {
			System.out.println("Login Fail..");
		}

		int count = service.countUser();
		System.out.println("현재 가입유저 수 : " + count);
	}

	// 전체유저 목록
	@Test
	public void testSelectList() throws Exception {

		List<UserVO> list = service.selectList();

		for (UserVO user : list) {
			System.out.print(user.getUserid() + "\t");
			System.out.print(user.getUsername() + "\t");
			System.out.print(user.getEmail() + "\t");
			System.out.print(user.getRegdate() + "\t");
			System.out.print(user.getUserage() + "\t");
			System.out.println(user.getUserinfo() + "\t");
		}

	}

	// 유저1인 정보열람
	@Test
	public void testSelectOne() throws Exception {

		UserVO user = service.selectOne("1");

		if (user.getUserid().equals("1")) {
			System.out.print(user.getUserid() + "\t");
			System.out.print(user.getUserpw() + "\t");
			System.out.print(user.getUsername() + "\t");
			System.out.print(user.getEmail() + "\t");
			System.out.print(user.getRegdate() + "\t");
			System.out.print(user.getUserage() + "\t");
			System.out.println(user.getUserinfo());
		}
	}

	// 유저 삭제
	@Test
	public void testDelete() throws Exception {

		service.remove("2");

	}

}
