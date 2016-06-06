package com.kosta.matchmaker.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.matchmaker.domain.LoginDTO;
import com.kosta.matchmaker.domain.UserVO;
import com.kosta.matchmaker.persistence.UserDAO;
import com.kosta.matchmaker.util.work.crypt.BCrypt;
import com.kosta.matchmaker.util.work.crypt.SHA256;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO dao;

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public void join(UserVO user) throws Exception {
		SHA256 sha = SHA256.getInsatnce();
		
		String orgPass = user.getUserpw();
		String shaPass = sha.getSha256(orgPass.getBytes());
		String bcPass = BCrypt.hashpw(shaPass, BCrypt.gensalt());

		user.setUserpw(bcPass);

		dao.join(user);
	}

	@Override
	public List<UserVO> selectList() throws Exception {
		return dao.selectList();
	}

	@Override
	public UserVO selectOne(String userid, String userpw) {
		return dao.selectOne(userid, userpw);
	}

	@Override
	public void update(UserVO user) {

		dao.update(user);
	}

	@Override
	public void delete(String userid, String userpw) {
		dao.delete(userid, userpw);
	}

	@Override
	public int userIdCheck(String userid) {
		//result :0 - 중복  1 - 중복 아님
		int result = dao.userIdCheck(userid);

		return result;
	}
	
	

}
