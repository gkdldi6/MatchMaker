package com.kosta.matchmaker.util;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;

import com.kosta.matchmaker.service.CourtService;

public class MatchMakerTask {
	
	@Inject
	private CourtService service;
	
	@Scheduled(cron="0/60 * * * * ?")
    public void print() {
        
        try {
        	service.chkGameState();
	        System.out.println("예약 상태 확인중...");
	        
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
        
    }
 
}