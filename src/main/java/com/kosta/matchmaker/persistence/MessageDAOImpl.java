package com.kosta.matchmaker.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matchmaker.domain.MessageVO;

@Repository
public class MessageDAOImpl implements MessageDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace="com.kosta.matchmaker.mappers.MessageMapper";
	
	
	@Override
	public void create(MessageVO vo) throws Exception {
		session.insert(namespace+".create", vo);
	}

	@Override
	public List<MessageVO> readAll() throws Exception {
		return session.selectList(namespace + ".readAll");
	}
	
	@Override
	public void updateState(Integer mid) throws Exception {
		session.update(namespace+".updateState",mid);
	}

	
}
