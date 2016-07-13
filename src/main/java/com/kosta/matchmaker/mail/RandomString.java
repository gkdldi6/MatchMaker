package com.kosta.matchmaker.mail;

import java.util.Random;

public class RandomString {
	public String RandumPass(int length) {
		String result = "";
		Random random = new Random();
		StringBuffer str = new StringBuffer();
	  
		 for(int i = 0; i < length; i++ ) {
			 if (random.nextBoolean()){
				 //str = str + String.valueOf((char)((int)(random.nextInt(26))+97)).toUpperCase();
				 str.append(String.valueOf((char)((int)(random.nextInt(26))+97)).toUpperCase());
			 } else {
				 str.append((random.nextInt(10))); 
			}
	}	
	System.out.println(str);
	result = String.valueOf(str);
	return result;
	}
}
/*
	public String RandumNuber() {
		String random[] = new random();

		number = random.nextInt(1000);

		if (number < 10) {
			result = "000" + number;
		} else if (number < 100 && number >= 10) {
			result = "00" + number;
		} else if (number < 1000 && number >= 100) {
			result = "0" + number;
		} else {
			result = String.valueOf(number);
		}
		return result;
	}
}*/
