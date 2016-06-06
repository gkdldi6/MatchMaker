package com.kosta.matchmaker.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosta.matchmaker.domain.BoardVO;
import com.kosta.matchmaker.domain.ReplyVO;
import com.kosta.matchmaker.persistence.BoardDAO;
import com.kosta.matchmaker.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO dao;
	
	@Inject
	private BoardDAO bdao;

	@Transactional
	@Override
	public void addReply(ReplyVO reply) throws Exception {

		
		dao.create(reply);
		bdao.updateReplyCnt(reply.getBno(), 1);

	}

	@Override
	public List<ReplyVO> listReply(Integer bno) throws Exception {
		
		return dao.list(bno);
	}

	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		

		dao.update(reply);

	}

	@Transactional
	@Override
	public void deleteReply(Integer rno) throws Exception {
		
		int bno = dao.listCount(rno);
		dao.delete(rno);
		bdao.updateReplyCnt(bno, -1);

	}

}
