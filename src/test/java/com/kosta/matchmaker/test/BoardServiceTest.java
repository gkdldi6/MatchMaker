package com.kosta.matchmaker.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta.matchmaker.domain.ArticleVO;
import com.kosta.matchmaker.domain.FreeBoardVO;
import com.kosta.matchmaker.domain.NoticeBoardVO;
import com.kosta.matchmaker.domain.SearchCriteria;
import com.kosta.matchmaker.service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class BoardServiceTest {

	@Inject
	private BoardService service;

	@Test
	public void testRegister() throws Exception {

		FreeBoardVO board = new FreeBoardVO();
		// NoticeBoardVO board = new NoticeBoardVO();
		// ReferenceBoardVO board = new ReferenceBoardVO();

		board.setBno(2);
		board.setArticle_type("F");
		board.setTitle("dadasd");
		board.setContent("asds");
		board.setWriter("sasdasd");
		// board.setLiked(100);
		// board.setDeadline("1991.05.28");
		// board.setBound("free");
		// board.setFullname("fafdighaeoifgoaierjg");

		service.register(board);

	}

	// @Test
	// public void testReadAll() throws Exception {
	//
	// List<ArticleVO> list = service.readAll(1);
	//
	// if (list.isEmpty()) {
	// System.out.println("없다");
	// return;
	// }
	//
	// for (ArticleVO board : list) {
	// System.out.println(board.getBno() + "\t" + board.getTitle() + "\t" +
	// board.getWriter() + "\t"
	// + board.getRegdate() + "\t" + board.getHit() + "\n" + board.toString());
	// }
	// }
	
	@Test
	public void testlistSearch() throws Exception {

			SearchCriteria cri = new SearchCriteria();
			cri.setSearchType("t");
			cri.setKeyword("광진");
			
			int bno = 1;
			
			List<ArticleVO> list = service.listSearch(bno, cri);
			
			
			for (ArticleVO board : map) {
				System.out.println(board.getBno() + "\t" + board.getAno() + "\t" + board.getTitle() + "\t"
							+ board.getWriter() + "\t" + board.getRegdate() + "\t" + board.getHit());
			}
		
		}
	

	@Test
	public void testReadOne() throws Exception {

		NoticeBoardVO article = (NoticeBoardVO) service.readOne(2, 1);

		System.out.println(article.getBno() + "\t" + article.getTitle() + "\t" + article.getWriter() + "\t"
				+ article.getRegdate() + "\t" + article.getHit());
	}

	@Test
	public void testModify() throws Exception {

		FreeBoardVO board = new FreeBoardVO();
		// NoticeBoardVO board = new NoticeBoardVO();
		// ReferenceBoardVO board = new ReferenceBoardVO();

		board.setBno(1);
		board.setAno(1);
		// board.setArticle_type("F");
		board.setTitle("뭐야이거");
		board.setContent("바뀜");
		board.setWriter("다음으로");
		// board.setLiked(200);
		// board.setDeadline("1991.05.28");
		// board.setBound("free");

		service.modify(board);

	}

	@Test
	public void testRemove() throws Exception {

		service.remove(1, 2);

	}

	// 베스트 게시글 선정(추천, 조회, 댓글)
	@Test
	public void testBestArticle() throws Exception {

		List<FreeBoardVO> listL = service.maximumLike(1);
		List<FreeBoardVO> listH = service.maximumHit(1);
		List<FreeBoardVO> listR = service.maximumReply(1);

		System.out.println(listL);

		if (listL == null) {
			System.out.println("따봉에러");
		} else {
			for (FreeBoardVO board : listL) {
				System.out.println("따봉리스트 ㄱㄱ");
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
