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

	private static String namespace = "com.kosta.matchmaker.mappers.ReplyMapper";

	@Override
	public void create(ReplyVO reply) throws Exception {

		session.insert(namespace + ".create", reply);

	}

	// 페이징 이전임
	// @Override
	// public List<ReplyVO> list(Integer bno) throws Exception {
	//
	// return session.selectList(namespace + ".list", bno);
	//
	// }

	// 페이징 v1
	@Override
	public List<ReplyVO> list(Integer bno, Criteria cri) throws Exception {

		Map<String, Object> listMap = new HashMap<>();
		listMap.put("bno", bno);
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
	public int count(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".count", bno);
	}

	// 본글번호 가져오기 
	@Override
	public int getBno(Integer rno) throws Exception {

		return session.selectOne(namespace + ".getBno", rno);
	}

		@Override
	public int listCount(Integer rno) throws Exception {
		
		return session.selectOne(namespace + ".listCount", rno);
	}

}
