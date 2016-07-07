package com.kosta.matchmaker.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosta.matchmaker.domain.AdminVO;
import com.kosta.matchmaker.domain.PageMaker;
import com.kosta.matchmaker.domain.SearchCriteria;
import com.kosta.matchmaker.domain.UserVO;
import com.kosta.matchmaker.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Inject
	private AdminService service;
	
	/* 관리자 로그인 페이지로 이동 */
	@RequestMapping("/")
	public String admin() {
		return "adminhome";
	}

	/* 로그인 */
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPost(@RequestParam("id") String id, @RequestParam("pw") String pw, Model model) throws Exception {

		AdminVO admin = service.login(id, pw);

		if (admin == null) {
			return;
		}

		model.addAttribute("adminVO", admin);
		System.out.println("post사용");
	}

	/* Admin 페이지 */
	/*@RequestMapping(value = "/adminview", method=RequestMethod.GET)
	public void adminfirst(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("pageMaker", pageMaker);

		List<UserVO> userlist = service.selectList(cri);
		int usercount = service.countUser();

		model.addAttribute("userlist", userlist);
		model.addAttribute("usercount", usercount);

		selectedUser("userid", model);
		
	}*/
	
	@RequestMapping(value = "/adminview", method=RequestMethod.GET)
	public void admin(@ModelAttribute("cri") SearchCriteria cri, @ModelAttribute("userid") String userid, Model model) throws Exception {

		List<UserVO> userlist = service.selectList(cri);
		int usercount = service.countUser();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("pageMaker", pageMaker);

		model.addAttribute("userlist", userlist);
		model.addAttribute("usercount", usercount);

		selectedUser("userid", model);
		
		//유저정보 조회
		UserVO userVO = service.selectOne(userid);
		model.addAttribute("user", userVO);
	}

	// 유저 조회
	public void selectedUser(@RequestParam String userid, Model model) {

		UserVO userVO = service.selectOne(userid);
		model.addAttribute("user", userVO);

	}
	/*
	//회원 한명 정보 불러오기
	@RequestMapping(value = "/adminview?{userid}", method=RequestMethod.GET)
	public String getProfile(Model model,@RequestParam String userid) throws Exception {
		System.out.println("메시 ㅅㅅ");
		UserVO userVO = service.selectOne(userid);
		model.addAttribute("user", userVO);
		System.out.println("메시 ㅅㅅ");
		System.out.println(userVO.getUserid());
		
		return "admin/adminview";
	}
	*/
	/*
	@RequestMapping(value = "/adminview?{userid}", method=RequestMethod.POST)
	public String postProfile(Model model,@PathVariable("userid") String userid, UserVO user) throws Exception {
		
		
		
		return "admin/adminview";
	}*/
}
