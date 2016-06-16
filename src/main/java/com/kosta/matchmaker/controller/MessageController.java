package com.kosta.matchmaker.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.matchmaker.domain.MessageVO;
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
	
	@RequestMapping(value = "", method=RequestMethod.GET)
	public String listAll(Model model) throws Exception {
		model.addAttribute("list", service.readAll());
		return "messages/list";
	}
	
}
