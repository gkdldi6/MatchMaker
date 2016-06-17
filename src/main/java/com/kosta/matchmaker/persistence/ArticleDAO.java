package com.kosta.matchmaker.persistence;

import java.util.List;

import com.kosta.matchmaker.domain.article.ArticleVO;
import com.kosta.matchmaker.domain.article.SearchCriteria;

public interface ArticleDAO {

	// 게시글 등록(create)
	public void freecreate(ArticleVO board) throws Exception;

	// 게시글 조회(selectOne)
	public ArticleVO freereadOne(Integer ano) throws Exception;

	// 게시글 수정(update)
	public void freeupdate(ArticleVO board) throws Exception;

	// 게시글 삭제(delete)
	public void freedelete(Integer ano) throws Exception;

	// 게시글 읽기 (전체목록 read)
	public List<ArticleVO> freereadAll() throws Exception;

	// 게시글 페이징처리중
	// public List<BoardVO> listPage(int page) throws Exception;

	public List<ArticleVO> freelistSearch(SearchCriteria cri) throws Exception;

	public int freelistSearchCount(SearchCriteria cri) throws Exception;

	// 리플라이 카운터 6월 17일 이밑 메서드 ㄴㄴ
	public void updateReplyCnt(Integer bno, int amount) throws Exception;

	// 조회수
	public void updateHit(Integer bno) throws Exception;

	// 첨부파일
	public void addAttach(String fullName) throws Exception;

	public List<String> getAttach(Integer bno) throws Exception;

	// 첨부파일 삭제
	public void deleteAttach(Integer bno) throws Exception;

	// 첨부파일 수정
	public void replaceAttach(String fullName, Integer bno) throws Exception;

}
