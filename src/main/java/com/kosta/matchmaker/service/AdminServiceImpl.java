package com.kosta.matchmaker.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.matchmaker.domain.AdminDTO;
import com.kosta.matchmaker.domain.AdminVO;
import com.kosta.matchmaker.domain.SearchCriteria;
import com.kosta.matchmaker.domain.UserVO;
import com.kosta.matchmaker.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;

	// 관리자 로그인
	@Override
	public AdminVO login(AdminDTO dto) throws Exception {

		if (dao.login(dto) != null) {
			return dao.login(dto);
		}

		return null;
	}

	// 회원 전체조회
	@Override
	public List<UserVO> selectList(SearchCriteria cri) throws Exception {
		return dao.selectList(cri);
	}

	// 회원수 카운트
	@Override
	public int countUser() throws Exception {
		// TODO Auto-generated method stub
		return dao.countUser();
	}

	// 회원 한명 조회
	@Override
	public UserVO selectOne(String userid) {
		return dao.selectOne(userid);
	}

	// 회원 삭제
	@Override
	public void remove(String userid) {
		dao.delete(userid);
	}

	//관리자 회원가입	
	@Override
	public void join(AdminVO admin) throws Exception {
		dao.join(admin);
	}

}