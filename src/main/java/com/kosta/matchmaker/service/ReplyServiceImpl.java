package com.kosta.matchmaker.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosta.matchmaker.domain.Criteria;
import com.kosta.matchmaker.domain.ReplyVO;
import com.kosta.matchmaker.persistence.ArticleDAO;
import com.kosta.matchmaker.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO dao;

	@Inject
	private ArticleDAO aDao;

	// 트랜젝션

	@Transactional
	@Override
	public void addReply(ReplyVO reply) throws Exception {

		dao.create(reply);	
		aDao.updateReplyCnt(reply.getAno(), 1);

	}

	// 페이징 v1

	public List<ReplyVO> listReply(Integer bno, Integer ano, Criteria cri) throws Exception {

		return dao.list(bno, ano, cri);
	}

	@Override
	public void modifyReply(ReplyVO reply) throws Exception {

		dao.update(reply);
	}

	@Transactional
	@Override
	public void removeReply(Integer rno) throws Exception {
		

		int ano = dao.getAno(rno);
		dao.delete(rno);
		aDao.updateReplyCnt(ano, -1);

	}

	// counter
	@Override
	public int count(Integer bno, Integer ano) throws Exception {
		
		return dao.count(bno, ano);
	}

//	@Override
//	public List<ReplyVO> listReply(Integer ano) throws Exception {
//		// TODO Auto-generated method stub
//		return null;
//	}

}
