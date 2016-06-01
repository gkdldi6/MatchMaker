package com.kosta.matchmaker.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosta.matchmaker.domain.Criteria;
import com.kosta.matchmaker.domain.ReplyVO;
import com.kosta.matchmaker.persistence.BoardDAO;
import com.kosta.matchmaker.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO replyDAO;

	@Inject
	private BoardDAO boardDAO;

	// 트랜젝션 이전
	// @Override
	// public void addReply(ReplyVO reply) throws Exception {
	//
	// dao.create(reply);
	//
	// }

	// 트랜젝션
	@Transactional
	@Override
	public void addReply(ReplyVO reply) throws Exception {

		replyDAO.create(reply);
		boardDAO.updateReplyCnt(reply.getBno(), 1);

	}

	// 페이징 이전
	// @Override
	// public List<ReplyVO> listReply(Integer bno) throws Exception {
	// // TODO Auto-generated method stub
	// return dao.list(bno);
	// }

	// 페이징 v1
	@Override
	public List<ReplyVO> listReply(Integer bno, Criteria cri) throws Exception {

		return replyDAO.list(bno, cri);
	}

	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		// TODO Auto-generated method stub

		replyDAO.update(reply);

	}

	// 트랜잭션 이전
	// @Override
	// public void removeReply(Integer rno) throws Exception {
	// // TODO Auto-generated method stub
	//
	// replyDAO.delete(rno);
	//
	// }

	// 트랜잭션
	@Transactional
	@Override
	public void removeReply(Integer rno) throws Exception {
		// TODO Auto-generated method stub

		int bno = replyDAO.getBno(rno);
		replyDAO.delete(rno);
		boardDAO.updateReplyCnt(bno, -1);

	}

	// counter
	@Override
	public int count(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return replyDAO.count(bno);
	}

}
