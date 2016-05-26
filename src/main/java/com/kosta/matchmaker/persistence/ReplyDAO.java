package com.kosta.matchmaker.persistence;

import java.util.List;

import com.kosta.matchmaker.domain.ReplyVO;

public interface ReplyDAO {
	
	//ㄹ
	public void create(ReplyVO reply) throws Exception;

	public List<ReplyVO> list(Integer bno) throws Exception;

	public void update(ReplyVO reply) throws Exception;

	public void delete(Integer rno) throws Exception;

}
