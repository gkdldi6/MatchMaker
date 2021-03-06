package com.kosta.matchmaker.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matchmaker.domain.ArticleVO;
import com.kosta.matchmaker.domain.Criteria;
import com.kosta.matchmaker.domain.LoginDTO;
import com.kosta.matchmaker.domain.PlayerVO;
import com.kosta.matchmaker.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "com.kosta.matchmaker.mappers.UserMapper";

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return session.selectOne(namespace + ".selectOne", dto);
	}

	@Override
	public void join(UserVO user) throws Exception {
		session.insert(namespace + ".join", user);
	}
	
	@Override
	public void playerJoin(PlayerVO player) throws Exception {
		session.insert(namespace + ".playerJoin", player);
	}

	@Override
	public List<UserVO> selectList() throws Exception {
		List<UserVO> list = session.selectList(namespace + ".selectList");
		return list;
	}

	@Override
	public UserVO selectOne(String userid, String userpw) {

		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("userpw", userpw);

		UserVO user = session.selectOne(namespace + ".selectOne", map);

		return user;
	}

	@Override
	public void update(UserVO user) {
		session.update(namespace + ".update", user);
	}

	@Override
	public void delete(String userid) {
		
		session.delete(namespace + ".delete", userid);
	}

	@Override
	public UserVO selectId(String userid) {
		UserVO user = session.selectOne(namespace + ".selectId", userid);

		return user;
	}

	@Override
	public int userIdCheck(String userid) {
		if(session.selectOne(namespace + ".selectId", userid) != null) {
			return 0;
		}

		return 1;
	}

	@Override
	public UserVO findId(String username, String email) {
		Map<String, Object> map = new HashMap<>();
		map.put("username", username);
		map.put("email", email);
		
		return session.selectOne(namespace + ".findId", map);
	}

	@Override
	public UserVO findPassword(String username, String userid, String email) {
		Map<String,Object> map = new HashMap<>();
		map.put("username", username);
		map.put("userid", userid);
		map.put("email", email);

		return session.selectOne(namespace + ".findPassword",map);
	}

	@Override
	public List<ArticleVO> articleList(String userid, Criteria cri) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("pageStart", cri.getPageStart());
		map.put("perPageNum", cri.getPerPageNum());
		
		return session.selectList(namespace + ".articleList", map);
	}

	@Override
	public int articleCount(String userid) {
		return session.selectOne(namespace + ".articleCount", userid);
	}

	@Override
	public void userPoint(String userid, int point) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("point", point);
		session.update(namespace + ".userPoint", map);
	}

	@Override
	public PlayerVO selectPlayer(String userid) throws Exception {
		return session.selectOne(namespace + ".selectPlayer", userid);
	}

	@Override
	public void clickLike(String userid, Integer bno, Integer ano) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("ano", ano);
		map.put("userid", userid);
		
		session.insert(namespace + ".clickLike", map);
	}

	@Override
	public int checkLike(String userid, Integer bno, Integer ano) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("ano", ano);
		map.put("userid", userid);
		
		int check = session.selectOne(namespace + ".checkLike", map);
		
		return check;
	}
}