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
import com.kosta.matchmaker.domain.FreeBoardVO;
import com.kosta.matchmaker.domain.NoticeBoardVO;
import com.kosta.matchmaker.domain.PageMaker;
import com.kosta.matchmaker.domain.ReferenceBoardVO;
import com.kosta.matchmaker.domain.SearchCriteria;
import com.kosta.matchmaker.service.BoardService;

@Controller
@RequestMapping("/boards")
public class BoardController {
	
	@Inject
	private BoardService service;

	/*게시판 글 목록 읽기*/
	@RequestMapping(value = "/{bno}", method=RequestMethod.GET)
	public String listAll(@PathVariable("bno") int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		
		model.addAttribute("map", service.listSearch(bno, cri));
		
		PageMaker pagemaker = new PageMaker();
		pagemaker.setCri(cri);
		pagemaker.setTotalCount(service.listSearchCount(bno, cri));
		
		model.addAttribute("pageMaker", pagemaker);
		
		if(bno == 100 || bno == 0) {
			return "boards/list";
		} else {
			// best게시물용 추가코드
			model.addAttribute("max", service.maximum(bno));
			// ----------------
		}
		return "boards/freeList";
	}
	
	/*글 작성폼 열기*/
	@RequestMapping(value="/{bno}/new", method=RequestMethod.GET)
	public String write(@PathVariable("bno") int bno) throws Exception {
		if(bno == 100) {
			return "boards/refRegister";
		} else if(bno == 0) {
			return "boards/adminRegister";
		} else if(bno == 101) {
			return "boards/locRegister";
		}
		
		return "boards/freeRegister";
	}
	
	/*글 작성*/
	@RequestMapping(value="/{bno}/new", method=RequestMethod.POST)
	public String freeWrite(@PathVariable("bno") int bno, RedirectAttributes rttr, FreeBoardVO article) throws Exception {
		article.setBno(bno);
		service.register(article);
		
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/boards/" + bno;
	}
	
	/*자료글 작성*/
	@RequestMapping(value="/{bno}/ref", method=RequestMethod.POST)
	public String refWrite(@PathVariable("bno") int bno, RedirectAttributes rttr, ReferenceBoardVO article) throws Exception {
		article.setBno(bno);
		service.register(article);
		
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/boards/" + bno;
	}
	
	/*공지글 작성*/
	@RequestMapping(value="/{bno}/notice", method=RequestMethod.POST)
	public String noticeWrite(@PathVariable("bno") int bno, RedirectAttributes rttr, NoticeBoardVO article) throws Exception {
		article.setBno(bno);
		service.register(article);
		
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/boards/" + bno;
	}
	
	/*글 조회*/
	@RequestMapping(value = "/{bno}/{ano}", method=RequestMethod.GET)
	public String readOne(@PathVariable("bno") int bno, @PathVariable("ano") int ano, 
			@ModelAttribute("cri") SearchCriteria cri,
						Model model) throws Exception {
	
		ArticleVO article = service.readOne(bno, ano);
		String articleType = article.getArticle_type();
		
		model.addAttribute("article", article);

		if(articleType.equals("R")) {
			return "boards/refRead";
		}
		
		return "boards/freeRead";
	}
	
	/*글 수정 폼 열기*/
	@RequestMapping(value="/{bno}/{ano}/edit", method=RequestMethod.GET)
	public String editForm(@PathVariable("bno") int bno, @PathVariable("ano") int ano, Model model, @ModelAttribute("cri") SearchCriteria cri) throws Exception {
		
		ArticleVO article = service.readOne(bno ,ano);
		
		model.addAttribute("article", article);
		
		if(bno == 100) {
			return "boards/refEdit";
		}
		return "/boards/freeEdit";
	}
	
	/*글 수정*/
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String edit(ArticleVO board, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		int bno = board.getBno();
		
		service.modify(board);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/boards/" + bno;
	}
	
	/*자료글 수정*/
	@RequestMapping(value="/refEdit", method=RequestMethod.POST)
	public String refEdit(ReferenceBoardVO board, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		int bno = board.getBno();
		
		service.modify(board);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/boards/" + bno;
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
		
		return "redirect:/boards/" + bno;
	}
	
	/*첨부파일 목록 조회*/
	@ResponseBody
	@RequestMapping("/{bno}/{ano}/getAttach")
	public List<String> getAttach(@PathVariable("bno") int bno, @PathVariable("ano") Integer ano)
			throws Exception{
		
		return service.getAttach(bno, ano);
	}
	
}
