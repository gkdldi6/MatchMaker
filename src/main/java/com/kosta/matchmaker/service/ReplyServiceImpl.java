package com.kosta.matchmaker.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.matchmaker.domain.ReplyVO;
import com.kosta.matchmaker.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO dao;

	@Override
	public void addReply(ReplyVO reply) throws Exception {
		// TODO Auto-generated method stub

		dao.create(reply);

	}

	@Override
	public List<ReplyVO> listReply(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(bno);
	}

	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		// TODO Auto-generated method stub

		dao.update(reply);

	}

	@Override
	public void deleteReply(Integer rno) throws Exception {
		// TODO Auto-generated method stub

		dao.delete(rno);

	}

}
