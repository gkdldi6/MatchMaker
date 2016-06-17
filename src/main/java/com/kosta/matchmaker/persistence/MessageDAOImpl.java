package com.kosta.matchmaker.persistence;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matchmaker.domain.MessageVO;
import com.kosta.matchmaker.domain.UserVO;

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
	public List<MessageVO> idReadAll(String targetid) throws Exception {
		return session.selectList(namespace + ".idReadAll", targetid);
	}

	@Override
	public MessageVO readOne(Integer mno) throws Exception {
		return session.selectOne(namespace + ".readMessage", mno);
	}

	@Override
	public void delete(Integer mno) throws Exception {
		session.delete(namespace + ".delete", mno);
	}

	@Override
	public void updateDate(Integer mno) throws Exception {
		session.update(namespace + ".updateDate", mno);
	}

	
}
