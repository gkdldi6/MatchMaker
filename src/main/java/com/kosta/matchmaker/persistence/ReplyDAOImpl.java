package com.kosta.matchmaker.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matchmaker.domain.Criteria;
import com.kosta.matchmaker.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "com.kosta.matchmaker.mappers.ReplyMapper";

	@Override
	public void create(ReplyVO reply) throws Exception {

		session.insert(namespace + ".create", reply);

	}

	// 페이징 
	@Override
	public List<ReplyVO> list(Integer bno, Integer ano, Criteria cri) throws Exception {

		Map<String, Object> listMap = new HashMap<>();
		listMap.put("bno", bno);
		listMap.put("ano", ano);
		listMap.put("cri", cri);

		return session.selectList(namespace + ".list", listMap);
	}

	@Override
	public void update(ReplyVO reply) throws Exception {

		session.update(namespace + ".update", reply);

	}

	@Override
	public void delete(Integer rno) throws Exception {

		session.delete(namespace + ".delete", rno);

	}

	// 댓글수 카운팅
	@Override
	public int count(Integer bno, Integer ano) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("ano", ano);
		return session.selectOne(namespace + ".count", map);
	}

	// 본글번호 가져오기 
	@Override
	public int getAno(Integer rno) throws Exception {

		return session.selectOne(namespace + ".getAno", rno);
	}

		@Override
	public int listCount(Integer rno) throws Exception {
		
		return session.selectOne(namespace + ".listCount", rno);
	}

}
