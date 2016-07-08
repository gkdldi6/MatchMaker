package com.kosta.matchmaker.test;

import java.util.List;
import java.util.Scanner;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta.matchmaker.domain.ArticleVO;
import com.kosta.matchmaker.domain.FreeBoardVO;
import com.kosta.matchmaker.domain.SearchCriteria;
import com.kosta.matchmaker.persistence.ArticleDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })

public class ArticleDAOTest {

	@Inject
	private ArticleDAO dao;

	@Test
	public void testCreate() throws Exception {
		System.out.println("sdfsdf");
		ArticleVO board = new ArticleVO();

		board.setBno(1);
		board.setAno(5);
		board.setTitle("5");
		board.setContent("5");
		board.setWriter("5");

		dao.create(board);

	}


	@Test
	public void testUpdate() throws Exception {

		ArticleVO board = new ArticleVO();

		board.setBno(1);
		board.setAno(1);
		board.setTitle("zzzz");
		board.setContent("성공");
		board.setWriter("성공한자sssss");

		dao.update(board);
	}
	
	@Test
	public void testlistSearch() throws Exception {
		
		SearchCriteria cri = new SearchCriteria();
		cri.setSearchType("t");
		cri.setKeyword("ㅅㅅ");
		List<ArticleVO> list = dao.listSearch(1, cri);
		
		
		for (ArticleVO board : list) {
			System.out.println(board.getBno() + "\t" + board.getAno() + "\t" + board.getTitle() + "\t"
						+ board.getWriter() + "\t" + board.getRegdate() + "\t" + board.getHit());
		}
		
	}
	
	//------------------안댐-----------------------
	@Test
	public void testaddAttach() throws Exception {

		Scanner sc = new Scanner(System.in);
		System.out.println("파일명 입력하시오");
		String fullName = sc.next();
		dao.addAttach(fullName);
		sc.close();
	}
	
	// 베스트 게시글 선정(추천, 조회, 댓글)
	@Test
	public void testBestArticle() throws Exception {

		List<FreeBoardVO> listL = dao.maximumLike(1);
		List<FreeBoardVO> listH = dao.maximumHit(1);
		List<FreeBoardVO> listR = dao.maximumReply(1);

		System.out.println(listL);

		if (listL == null) {
			System.out.println("따봉에러");
		} else {
			System.out.println("따봉리스트 ㄱㄱ");
			for (FreeBoardVO board : listL) {
				System.out.println(board.getAno() + "\t" + board.getHit() + "\t" + board.getReplycnt());
			}
		}

		if (listH == null) {
			System.out.println("히트에러");
		} else {
			System.out.println("히트리스트 ㄱㄱ");
			for (FreeBoardVO board : listH) {
				System.out.println(board.getAno() + "\t" + board.getHit() + "\t" + board.getReplycnt());
			}
		}

		if (listR == null) {
			System.out.println("댓글에러");
		} else {
			System.out.println("댓글리스트 ㄱㄱ");
			for (FreeBoardVO board : listR) {
				System.out.println(board.getAno() + "\t" + board.getHit() + "\t" + board.getReplycnt());
			}
		}

	}

}
