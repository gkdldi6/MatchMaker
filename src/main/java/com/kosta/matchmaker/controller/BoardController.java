package com.kosta.matchmaker.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.matchmaker.domain.ArticleVO;
import com.kosta.matchmaker.domain.PageMaker;
import com.kosta.matchmaker.domain.SearchCriteria;
import com.kosta.matchmaker.service.BoardService;

@Controller
@RequestMapping("/boards")
public class BoardController {
	
	@Inject
	private BoardService service;

	/*게시판 글 목록 읽기*/
	@RequestMapping(value = "", method=RequestMethod.GET)
	public String listAll(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		
		model.addAttribute("list", service.listSearch(cri));
		
		PageMaker pagemaker = new PageMaker();
		pagemaker.setCri(cri);
		pagemaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pagemaker);
		
		return "boards/list";
	}
	
	/*글 작성폼 열기*/
	@RequestMapping(value="/new", method=RequestMethod.GET)
	public String write() throws Exception {
		return "boards/register";
	}
	
	/*글 작성*/
	@RequestMapping(value="/new", method=RequestMethod.POST)
	public String write(RedirectAttributes rttr, ArticleVO article) throws Exception {
		service.register(article);
		
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/boards";
	}
	
	/*글 조회*/
	@RequestMapping(value = "/{bno}/{ano}", method=RequestMethod.GET)
	public String readOne(@PathVariable("bno") int bno, @PathVariable("ano") int ano, 
			@ModelAttribute("cri") SearchCriteria cri,
						Model model) throws Exception {
		
		System.out.println(bno);
		System.out.println(ano);
		
		ArticleVO article = service.readOne(bno, ano);
		
		model.addAttribute("article", article);
		
		return "boards/read";
	}
	

	
	/*글 수정 폼 열기*/
	@RequestMapping(value="/{bno}/{ano}/edit", method=RequestMethod.GET)
	public String editForm(@PathVariable("bno") int bno, @PathVariable("ano") int ano, Model model, @ModelAttribute("cri") SearchCriteria cri) throws Exception {
		
		ArticleVO article = service.readOne(bno ,ano);
		
		model.addAttribute("article", article);
		
		return "/boards/edit";
	}
	
	/*글 수정*/
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String edit(ArticleVO board, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		
		service.modify(board);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/boards";
	}
	
	/*글 삭제*/
	@RequestMapping(value="/{bno}/{ano}/delete", method=RequestMethod.POST)
	public String delete(@PathVariable("bno") int bno, @PathVariable("ano") int ano, SearchCriteria cri,
			RedirectAttributes rttr) throws Exception {
		
		service.remove(bno, ano);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/boards";
	}
	
	/*첨부파일 목록 조회*/
	@ResponseBody
	@RequestMapping("/getAttach/{ano}")
	public List<String> getAttach(@PathVariable("ano") Integer ano)throws Exception{
		
		return service.getAttach(ano);
	}
	
}
