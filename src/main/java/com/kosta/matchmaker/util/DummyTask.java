package com.kosta.matchmaker.util;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;

import com.kosta.matchmaker.persistence.CourtDAO;

public class DummyTask {
	
	@Inject
	private CourtDAO dao;
	
	@Scheduled(cron="0/60 * * * * ?")
    public void print() {
        
        try {
			dao.checkMatch1();
			dao.checkMatch2();
	        dao.checkMatch3();
	        
	        System.out.println("게임 상태 확인중...");
		} catch (Exception e) {
			e.printStackTrace();
		}
        
    }
 
}