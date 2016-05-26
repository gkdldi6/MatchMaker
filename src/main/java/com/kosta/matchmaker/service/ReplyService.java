package com.kosta.matchmaker.service;

import java.util.List;

import com.kosta.matchmaker.domain.ReplyVO;

public interface ReplyService {

	//
	public void addReply(ReplyVO reply) throws Exception;
	
	public List<ReplyVO> listReply(Integer bno) throws Exception;
	
	public void modifyReply(ReplyVO reply) throws Exception;
	
	public void deleteReply(Integer rno) throws Exception;
	
	
}
