package com.kosta.matchmaker.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matchmaker.domain.AdminDTO;
import com.kosta.matchmaker.domain.AdminVO;
import com.kosta.matchmaker.domain.SearchCriteria;
import com.kosta.matchmaker.domain.UserVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "com.kosta.matchmaker.mappers.AdminMapper";

	@Override
	public AdminVO login(AdminDTO dto) throws Exception {
		return session.selectOne(namespace + ".selectAdmin", dto);
	}

	@Override
	public void join(AdminVO admin) throws Exception {
		session.insert(namespace + ".join", admin);
	}
	
	@Override
	public List<UserVO> selectList(SearchCriteria criteria) throws Exception {
		
		Map<String, Object> listCri = new HashMap<>();
		listCri.put("cri", criteria);
		
		
//		List<UserVO> list = session.selectList(namespace + ".selectList");
//		return list;
		
		return session.selectList(namespace + ".selectList", listCri);
		
	}

	@Override
	public int countUser() throws Exception {

		return session.selectOne(namespace + ".countUser");
	}

	@Override
	public UserVO selectOne(String userid) {
		UserVO user = session.selectOne(namespace + ".selectOne", userid);
		return user;
	}

	@Override
	public void delete(String userid) {
		session.delete(namespace + ".delete", userid);
	}

	

}