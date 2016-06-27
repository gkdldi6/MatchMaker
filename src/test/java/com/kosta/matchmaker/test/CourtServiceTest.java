package com.kosta.matchmaker.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta.matchmaker.domain.CourtVO;
import com.kosta.matchmaker.service.CourtService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class CourtServiceTest {

	@Inject
	private CourtService service;
	
	@Test
	public void courtTest() throws Exception {
		List<CourtVO> list = service.getAllCourts();
		
		for (CourtVO courtVO : list) {
			System.out.println("cno: " + courtVO.getCno() + "\tlat: " + courtVO.getLat() + "\tlng: " +  courtVO.getLng()
					 			+ "\taddress: " + courtVO.getAddress());
		}
	}
	
}
