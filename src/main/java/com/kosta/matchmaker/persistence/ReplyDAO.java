package com.kosta.matchmaker.persistence;

import java.util.List;

import com.kosta.matchmaker.domain.ReplyVO;

public interface ReplyDAO {
	
	public void create(ReplyVO reply) throws Exception;

	public List<ReplyVO> list(Integer bno) throws Exception;

	public void update(ReplyVO reply) throws Exception;

	public void delete(Integer rno) throws Exception;
	
	public int listCount(Integer rno) throws Exception;
	
}
