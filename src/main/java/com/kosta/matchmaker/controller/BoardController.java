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

import com.kosta.matchmaker.domain.article.ArticleVO;
import com.kosta.matchmaker.domain.article.FreeBoardVO;
import com.kosta.matchmaker.domain.article.PageMaker;
import com.kosta.matchmaker.domain.article.SearchCriteria;
import com.kosta.matchmaker.service.BoardService;

@Controller
@RequestMapping("/boards")
public class BoardController {
	
	@Inject
	private BoardService service;

	/*게시판 글 목록 읽기*/
	@RequestMapping(value = "", method=RequestMethod.GET)
	public String listAll(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		
		model.addAttribute("freelist", service.freelistSearch(cri));
		
		PageMaker pagemaker = new PageMaker();
		pagemaker.setCri(cri);
		pagemaker.setTotalCount(service.freelistSearchCount(cri));
		
		model.addAttribute("pageMaker", pagemaker);
		
		return "boards/freelist";
	}
	
	/*글 작성폼 열기*/
	@RequestMapping(value="/new", method=RequestMethod.GET)
	public String write() throws Exception {
		return "boards/freeregister";
	}
	
	/*글 작성*/
	@RequestMapping(value="/new", method=RequestMethod.POST)
	public String write(RedirectAttributes rttr, ArticleVO article) throws Exception {
		service.freeregister(article);
		
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/boards";
	}
	
	/*글 조회*/
	@RequestMapping(value = "/{bno}", method=RequestMethod.GET)
	public String readOne(@PathVariable int bno, 
			@ModelAttribute("cri") SearchCriteria cri,
						Model model) throws Exception {
		
		ArticleVO article = service.freereadOne(bno);
		
		model.addAttribute("article", article);
		
		return "boards/freeread";
	}
	
	/*글 수정 폼 열기*/
	@RequestMapping(value="/{bno}/edit", method=RequestMethod.GET)
	public String editForm(@PathVariable int bno, Model model, @ModelAttribute("cri") SearchCriteria cri) throws Exception {
		
		ArticleVO article = service.freereadOne(bno);
		
		model.addAttribute("article", article);
		
		return "/boards/freeedit";
	}
	
	/*글 수정*/
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String edit(ArticleVO board, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		
		service.freemodify(board);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/boards";
	}
	
	/*글 삭제*/
	@RequestMapping(value="/{bno}/delete", method=RequestMethod.POST)
	public String delete(@PathVariable int bno, SearchCriteria cri,
			RedirectAttributes rttr) throws Exception {
		
		service.freeremove(bno);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/boards";
	}
	
	/*첨부파일 목록 조회 6월 17일 여긴 아직 안함요*/
	@ResponseBody
	@RequestMapping("/getAttach/{bno}")
	public List<String> getAttach(@PathVariable("bno") Integer bno)throws Exception{
		
		return service.getAttach(bno);
	}
	
}
