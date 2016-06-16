package com.kosta.matchmaker.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matchmaker.domain.article.ArticleVO;
import com.kosta.matchmaker.domain.article.SearchCriteria;

@Repository
public class ArticleDAOImpl implements ArticleDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "com.kosta.matchmaker.mappers.BoardMapper";

	@Override
	public void create(ArticleVO board) throws Exception {

		session.insert(namespace + ".create", board);
	}

	@Override
	public List<ArticleVO> readAll() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".readAll");
	}

	@Override
	public ArticleVO readOne(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".readOne", bno);
	}

	@Override
	public void update(ArticleVO board) throws Exception {
		session.update(namespace + ".update", board);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		session.delete(namespace + ".delete", bno);

	}

	// 아래부터는 테스트 하지않은 미완성 코드..

	@Override
	public List<ArticleVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateReplyCnt(Integer bno, int amount) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateHit(Integer bno) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void addAttach(String fullName) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteAttach(Integer bno) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void replaceAttach(String fullName, Integer bno) throws Exception {
		// TODO Auto-generated method stub

	}

}
