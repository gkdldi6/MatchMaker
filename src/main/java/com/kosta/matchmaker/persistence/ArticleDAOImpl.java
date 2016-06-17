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
	public void freecreate(ArticleVO board) throws Exception {

		session.insert(namespace + ".create", board);
	}

	@Override
	public List<ArticleVO> freereadAll() throws Exception {
		return session.selectList(namespace + ".readAll");
	}

	@Override
	public ArticleVO freereadOne(Integer ano) throws Exception {
		return session.selectOne(namespace + ".readOne", ano);
	}

	@Override
	public void freeupdate(ArticleVO board) throws Exception {
		session.update(namespace + ".update", board);
	}

	@Override
	public void freedelete(Integer ano) throws Exception {
		session.delete(namespace + ".delete", ano);

	}

	@Override
	public List<ArticleVO> freelistSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".listSearch", cri);
	}
	
	@Override
	public int freelistSearchCount(SearchCriteria cri) throws Exception {
		return 0;
	}
	
	
	
	// 아래부터는 테스트 하지않은 미완성 코드..


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
