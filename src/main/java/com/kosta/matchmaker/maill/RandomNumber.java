package com.kosta.matchmaker.maill;
import java.util.Random;

public class RandomNumber {
	public String RandumNuber(){
		int number;
		String result = null;

		Random random = new Random();

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
}
