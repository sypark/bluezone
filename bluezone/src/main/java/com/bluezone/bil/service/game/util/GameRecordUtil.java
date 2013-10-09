package com.bluezone.bil.service.game.util;

import java.util.List;

import com.bluezone.bil.domain.game.GameRecordInning;

public class GameRecordUtil {

	public static Integer getSumScore(List<GameRecordInning> list){
		int sumScore = 0;
		for (GameRecordInning gameRecordInning : list) {
			sumScore += gameRecordInning.getEarnScore();
		}
		
		return new Integer(sumScore);
	}
	
	public static Integer getHighRun(List<GameRecordInning> list){
		int highRun = 0;
		for (GameRecordInning gameRecordInning : list) {
			if(highRun < gameRecordInning.getEarnScore()){
				highRun = gameRecordInning.getEarnScore();
			}
		}
		
		return new Integer(highRun);
	}
	
	public static Float getAvg(int totalInning, int score){
		String avg = String.format("%.2f", (score/(totalInning*1.0f)));
		return new Float(avg);
	}
	
	
}
