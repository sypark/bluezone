package com.bluezone.bil.service.game;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluezone.bil.dao.game.repository.GameRecordRepository;
import com.bluezone.bil.domain.game.GameCustComp;
import com.bluezone.bil.domain.game.GameRecord;
import com.bluezone.bil.domain.game.GameRecordExample;
import com.bluezone.bil.domain.game.GameRecordExample.Criteria;

@Service
public class GameRecordService {

	@Autowired
	private GameRecordRepository gameRecordRepository;

	public List<GameRecord> selectByExample(GameRecord gameRecord) {
		GameRecordExample example = new GameRecordExample();
		Criteria criteria = example.createCriteria();
		if(gameRecord.getGameNo() != null)
			criteria.andGameNoEqualTo(gameRecord.getGameNo());
		
		return gameRecordRepository.selectByExample(example);
	}

	public List<GameCustComp> selectGameWithCustInfo(Integer gameNo) {
		
		return gameRecordRepository.selectGameWithCustInfo(gameNo);
	}


}
