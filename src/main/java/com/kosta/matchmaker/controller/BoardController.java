package com.kosta.matchmaker.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.matchmaker.domain.BoardVO;
import com.kosta.matchmaker.service.BoardService;

@Controller
@RequestMapping("/boards")
public class BoardController {
	
	@Inject
	private BoardService service;

	@RequestMapping("")
	public String list(Model model) throws Exception {
		List<BoardVO> list = service.readAll();
		
		model.addAttribute("list", list);
		
		return "boards/list";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String write() throws Exception {
		return "boards/register";
	}
	
	@RequestMapping(value="/boards", method=RequestMethod.POST)
	public String write(RedirectAttributes rttr, BoardVO article) throws Exception {
		service.register(article);
		
		rttr.addAttribute("result", "success");
		
		return "boards";
	}
	
	@RequestMapping("/{bno}")
	public String read(@PathVariable int bno, Model model) throws Exception {
		BoardVO article = service.readOne(bno);
		
		model.addAttribute("article", article);
		
		return "boards/read";
	}
	
}
