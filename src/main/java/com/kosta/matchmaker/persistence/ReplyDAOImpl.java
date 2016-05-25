package com.kosta.matchmaker.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matchmaker.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.kosta.matchmaker.ReplyMapper";

	@Override
	public void create(ReplyVO reply) throws Exception {

		session.insert(namespace + ".create", reply);

	}

	@Override
	public List<ReplyVO> list(Integer bno) throws Exception {

		return session.selectList(namespace + ".list", bno);

	}

	@Override
	public void update(ReplyVO reply) throws Exception {

		session.update(namespace + ".update", reply);

	}

	@Override
	public void delete(Integer rno) throws Exception {

		session.delete(namespace + ".delete", rno);

	}

}
