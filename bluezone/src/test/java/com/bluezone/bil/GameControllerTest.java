package com.bluezone.bil;

public class GameControllerTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println(getAvg(24, 22));
	}
	public static Float getAvg(int totalInning, int score){
		String avg = String.format("%.2f", (score/(totalInning*1.0f)));
		return new Float(avg);
	}
	
}
