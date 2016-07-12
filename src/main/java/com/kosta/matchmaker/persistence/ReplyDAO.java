package com.kosta.matchmaker.persistence;

import java.util.List;

import com.kosta.matchmaker.domain.Criteria;
import com.kosta.matchmaker.domain.ReplyVO;

public interface ReplyDAO {
	
	public void create(ReplyVO reply) throws Exception;

	// 코트 댓글 목록
	public List<ReplyVO> creplyList(Integer bno, Integer ano, Integer page) throws Exception;

	// 페이징 처리 v1
	public List<ReplyVO> list(Integer bno, Integer ano, Criteria cri) throws Exception;

	public void update(ReplyVO reply) throws Exception;

	public void delete(Integer rno) throws Exception;

	//댓글수
	public int count(Integer bno, Integer ano) throws Exception;

	// 본글번호 가져오기 
	public int getAno(Integer rno) throws Exception;
	
	// 본 게시판번호 가져오기
	public int getBno(Integer rno) throws Exception;

	public int listCount(Integer rno) throws Exception;
	
}
