package com.kosta.matchmaker.util;

import org.springframework.scheduling.annotation.Scheduled;

public class DummyTask {
	
	@Scheduled(cron="0/1 * * * * ?")
    public void print() {
        System.out.println("스케줄러 TEST");      
    }
 
}