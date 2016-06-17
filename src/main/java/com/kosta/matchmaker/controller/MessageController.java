package com.kosta.matchmaker.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.matchmaker.domain.MessageVO;
import com.kosta.matchmaker.domain.UserVO;
import com.kosta.matchmaker.service.MessageService;

@Controller
@RequestMapping("/messages")
public class MessageController {

	@Inject
	private MessageService service;

	@RequestMapping(value = "/send", method = RequestMethod.POST)
	public ResponseEntity<String> addMessage(@RequestBody MessageVO vo){
		
		ResponseEntity<String> entity = null;
		try{
			service.addMessage(vo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>("FAIL",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String listAllPost(Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		UserVO user = (UserVO) session.getAttribute("login");
		String targetid = user.getUserid().toString();
		//model.addAttribute("count",service.messageCount(targetid)); //쪽지 개수
		model.addAttribute("list", service.idReadAll(targetid));
		return "/messages/list";
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("mno") int mno, Model model)throws Exception{
		service.updateDate(mno); //opendate 처리
		MessageVO message = service.readOne(mno);
		model.addAttribute("MessageVO",message);
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("mno") int mno, RedirectAttributes rttr) throws Exception{
		service.delete(mno);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/messages";
	}
	
}
