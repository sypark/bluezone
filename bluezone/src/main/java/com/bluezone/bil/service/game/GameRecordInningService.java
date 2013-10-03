package com.bluezone.bil.service.game;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluezone.bil.dao.game.repository.GameRecordInningRepository;
import com.bluezone.bil.domain.game.GameRecordInning;
import com.bluezone.bil.domain.game.GameRecordInningExample;
import com.bluezone.bil.domain.game.GameRecordInningExample.Criteria;

@Service
public class GameRecordInningService {

	@Autowired
	private GameRecordInningRepository gameRecordInningRepository;

	public List<GameRecordInning> selectByExample(GameRecordInning gameRecordInning) {
		GameRecordInningExample example = new GameRecordInningExample();
		Criteria criteria = example.createCriteria();
		
		return gameRecordInningRepository.selectByExample(example);
	}

}
