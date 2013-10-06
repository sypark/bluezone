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
	
	public GameRecord selectByPrimaryKey(Integer gameRecNo){
		return gameRecordRepository.selectByPrimaryKey(gameRecNo);
	}

	public List<GameRecord> selectByExample(GameRecord gameRecord) {
		return selectByExample(gameRecord, null);
	}
	
	public List<GameRecord> selectByExample(GameRecord gameRecord, String orderByClause) {
		GameRecordExample example = new GameRecordExample();
		Criteria criteria = example.createCriteria();
		if(gameRecord != null){
			if(gameRecord.getGameNo() != null)
				criteria.andGameNoEqualTo(gameRecord.getGameNo());
			if(gameRecord.getCustNo() != null)
				criteria.andCustNoEqualTo(gameRecord.getCustNo());
		}
		
		if(orderByClause != null){
			example.setOrderByClause(orderByClause);
		}
		
		return gameRecordRepository.selectByExample(example);
	}

	public List<GameCustComp> selectGameWithCustInfo(Integer gameNo) {
		return gameRecordRepository.selectGameWithCustInfo(gameNo);
	}

	public int updateByPrimaryKeySelective(GameRecord gameRecord){
		return gameRecordRepository.updateByPrimaryKeySelective(gameRecord);
	}

}
