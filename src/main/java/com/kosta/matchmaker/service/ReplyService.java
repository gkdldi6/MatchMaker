package com.kosta.matchmaker.service;

import java.util.List;

import com.kosta.matchmaker.domain.Criteria;
import com.kosta.matchmaker.domain.ReplyVO;

public interface ReplyService {

	public void addReply(ReplyVO reply) throws Exception;

	// 페이징 이전
	// public List<ReplyVO> listReply(Integer bno) throws Exception;

	// 페이징 v1
	public List<ReplyVO> listReply(Integer bno, Criteria cri) throws Exception;

	public void modifyReply(ReplyVO reply) throws Exception;

	public void removeReply(Integer rno) throws Exception;

	// reply 글수 
	public int count(Integer bno) throws Exception;

	public List<ReplyVO> listReply(Integer bno) throws Exception;

}
