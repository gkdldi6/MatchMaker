package com.kosta.matchmaker.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matchmaker.domain.AdminVO;
import com.kosta.matchmaker.domain.UserVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "com.kosta.matchmaker.mappers.AdminMapper";

	@Override
	public AdminVO login(String id, String pw) throws Exception {

		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);

		AdminVO admin = session.selectOne(namespace + ".selectAdmin", map);
		return admin;
	}

	@Override
	public List<UserVO> selectList() throws Exception {
		List<UserVO> list = session.selectList(namespace + ".selectList");
		return list;
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
