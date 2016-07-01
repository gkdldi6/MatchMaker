package com.kosta.matchmaker.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matchmaker.domain.Criteria;
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
	public List<MessageVO> idReadAll(String targetid,int page) throws Exception {
		
		if(page <=0){
			page =1;
		}
		page = (page -1)*10;
		
		Map<String, Object> map = new HashMap<>();
		map.put("targetid", targetid);
		map.put("page", page);
		
		return session.selectList(namespace + ".idReadAll", map);
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

	@Override
	public int messageCount(String targetid) throws Exception {
		return session.selectOne(namespace + ".messageCount",targetid);
	}

	@Override
	public List<MessageVO> idReadListCriteria(String targetid, Criteria cri) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("targetid", targetid);
		map.put("pageStart", cri.getPageStart());
		map.put("perPageNum", cri.getPerPageNum());
		
		return session.selectList(namespace + ".listCriteria", map);
	}

	
}
