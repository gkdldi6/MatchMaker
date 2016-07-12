package com.kosta.matchmaker.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.matchmaker.domain.Criteria;
import com.kosta.matchmaker.domain.MessageVO;
import com.kosta.matchmaker.domain.PageMaker;
import com.kosta.matchmaker.domain.UserVO;
import com.kosta.matchmaker.service.MessageService;

@Controller
@RequestMapping("/messages")
public class MessageController {

	@Inject
	private MessageService service;

	@RequestMapping("/write")
	public String MessagesWrite(@ModelAttribute("targetid") String targetid) {
		return "messages/write";
	}
	
	@RequestMapping(value = "/send", method = RequestMethod.POST)
	public String addMessage(RedirectAttributes rttr, MessageVO vo){
		try{
			service.addMessage(vo);
			rttr.addFlashAttribute("msg", "sendsuccess");
		}catch(Exception e){
			e.printStackTrace();
			rttr.addFlashAttribute("msg", "sendfail");
		
		}
		return "redirect:/messages";
	}
	
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String listAllPost(Model model, HttpServletRequest request, Criteria cri) throws Exception {
		HttpSession session = request.getSession();
		UserVO user = (UserVO) session.getAttribute("login");
		String targetid = user.getUserid().toString();

		model.addAttribute("list", service.idReadListCriteria(targetid, cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.messageCount(targetid));
		
		model.addAttribute("pageMaker", pageMaker);
		
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
		rttr.addFlashAttribute("msg", "removesucess");
		return "redirect:/messages";
	}
	
	@RequestMapping(value = "/notReadMsg", method = RequestMethod.GET)
	public @ResponseBody List<MessageVO> notReadMsg(@RequestParam("targetid") String targetid) throws Exception{
		return service.notReadMessage(targetid);
	}
	
}
