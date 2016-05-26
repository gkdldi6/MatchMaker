package com.kosta.matchmaker.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.matchmaker.domain.BoardVO;
import com.kosta.matchmaker.service.BoardService;

@Controller
@RequestMapping("/boards")
public class BoardController {
	
	@Inject
	private BoardService service;

	/*게시판 글 목록 읽기*/
	@RequestMapping("")
	public String list(Model model) throws Exception {
		List<BoardVO> list = service.readAll();
		
		model.addAttribute("list", list);
		
		return "boards/list";
	}
	
	/*글 작성폼 불러오기*/
	@RequestMapping(value="/new", method=RequestMethod.GET)
	public String write() throws Exception {
		return "boards/register";
	}
	
	/*글 작성*/
	@RequestMapping(value="/new", method=RequestMethod.POST)
	public String write(RedirectAttributes rttr, BoardVO article) throws Exception {
		service.register(article);
		
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/boards";
	}
	
	/*글 조회*/
	@RequestMapping("/{bno}")
	public String read(@PathVariable int bno, Model model) throws Exception {
		BoardVO article = service.readOne(bno);
		
		model.addAttribute("article", article);
		
		return "boards/read";
	}

	/*글 수정*/
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String edit(BoardVO board, RedirectAttributes rttr) throws Exception {
		service.modify(board);
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/boards";
	}
	
	/*글 삭제*/
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(@RequestParam int bno, RedirectAttributes rttr) throws Exception {
		service.remove(bno);
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/boards";
	}
	
}
