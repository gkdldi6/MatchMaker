package com.kosta.matchmaker.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosta.matchmaker.domain.AdminVO;
import com.kosta.matchmaker.domain.Criteria;
import com.kosta.matchmaker.domain.PageMaker;
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

	// @RequestMapping(value = "/", method = RequestMethod.GET)
	// public void loginGet() {}

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

	// /* admin 페이지로 이동 */
	// @RequestMapping(value = "/adminview", method = RequestMethod.GET)
	// public void getProfile() throws Exception {
	//
	// }

	/* Admin 페이지 유저목록 및 카운터 */
	@RequestMapping(value = "/adminview", method = RequestMethod.GET)
	public void admin(Model model) throws Exception {

		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(100);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("cri", cri);
		
		List<UserVO> userlist = service.selectList(cri);
		int usercount = service.countUser();

		model.addAttribute("userlist", userlist);
		model.addAttribute("usercount", usercount);
		model.addAttribute("pageMaker", pageMaker);

		// map.put("userlist", userlist);
		// model.addAttribute("userinfo", service.selectOne(userid));
		// model.addAttribute("userdelete", service.remove(userid));

	}

}
