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
import com.kosta.matchmaker.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Inject
	private AdminService service;
	
	@Inject
	private UserService service2;

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
	@RequestMapping(value = "/adminview", method = RequestMethod.GET)
	public void admin(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("pageMaker", pageMaker);

		List<UserVO> userlist = service.selectList(cri);
		int usercount = service.countUser();

		model.addAttribute("userlist", userlist);
		model.addAttribute("usercount", usercount);

		selectedUser("userid", model);
		
		// UserVO userid = service.selectOne(id);
		// model.addAttribute("userid", userid);

		// map.put("userlist", userlist);
		// model.addAttribute("userdelete", service.remove(userid));

	}

	// 유저 조회
	public void selectedUser(@RequestParam String userid, Model model) {

		UserVO userVO = service.selectOne(userid);
		model.addAttribute("user", userVO);

	}

	// public void userRemove(@RequestParam String userid, SearchCriteria cri,
	// Model model) throws Exception {
	//
	// Boolean del = false;
	//
	// if (del == true) {
	// service.remove(userid);
	// }
	//
	// }
	
	//회원 수정
	@RequestMapping(value = "/adminview?{userid}", method=RequestMethod.GET)
	public String postProfile(Model model,@PathVariable("userid") String userid, UserVO user) throws Exception {
		
		
		return "admin/adminview";
	}
}
