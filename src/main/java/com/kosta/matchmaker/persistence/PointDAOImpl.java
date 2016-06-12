package com.kosta.matchmaker.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class PointDAOImpl implements PointDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace="com.kosta.matchmaker.mappers.PointMapper";
	
	@Override
	public void updatePoint(String targetid, int point) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("targetid", targetid);
		paramMap.put("point", point);
	
		session.update(namespace + ".updatePoint", paramMap);
	}
}
