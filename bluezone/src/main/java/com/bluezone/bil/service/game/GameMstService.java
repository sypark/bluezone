package com.bluezone.bil.service.game;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bluezone.bil.constant.CommonConstant;
import com.bluezone.bil.dao.cust.repository.CstCustRecordMstRepository;
import com.bluezone.bil.dao.game.repository.GameMstRepository;
import com.bluezone.bil.dao.game.repository.GameRecordRepository;
import com.bluezone.bil.domain.cust.CstCustRecordMst;
import com.bluezone.bil.domain.game.GameMst;
import com.bluezone.bil.domain.game.GameMstExample;
import com.bluezone.bil.domain.game.GameMstExample.Criteria;
import com.bluezone.bil.domain.game.GameRecord;
import com.bluezone.bil.util.DateUtils;

@Service
public class GameMstService {
	
	@Autowired
	private GameMstRepository gameMstRepository;
	@Autowired
	private GameRecordRepository gameRecordRepository;
	@Autowired
	private CstCustRecordMstRepository cstCustRecordMstRepository;
	
	public GameMst selectByPrimaryKey(Integer gameNo){
		return gameMstRepository.selectByPrimaryKey(gameNo);
	}

	public List<GameMst> selectByExample(GameMst gameMst) {
		return selectByExample(gameMst, null);
	}

	public List<GameMst> selectByExample(GameMst gameMst, String orderByClause) {
		GameMstExample example = new GameMstExample();
		Criteria criteria = example.createCriteria();
		if(gameMst.getMatchNo() != null)
			criteria.andMatchNoEqualTo(gameMst.getMatchNo());
		if(gameMst.getStatus() != null)
			criteria.andStatusEqualTo(gameMst.getStatus());
		
		if(orderByClause != null){
			example.setOrderByClause(orderByClause);
		}
		
		return gameMstRepository.selectByExample(example);
	}

	@Transactional
	public int createGame(GameMst gameMst, List<Integer> custList) throws Exception {
		
		if(gameMstRepository.insert(gameMst) < 1){
			throw new Exception();
		}
		
		for (Integer custNo : custList) {
			CstCustRecordMst cstCustRecordMst = cstCustRecordMstRepository.selectByPrimaryKey(custNo);
			GameRecord record = new GameRecord();
			record.setGameNo(gameMst.getGameNo());
			record.setCustNo(custNo);
			record.setScore(cstCustRecordMst.getScore());
			record.setRegrId(gameMst.getRegrId());
			record.setRegDtm(gameMst.getRegDtm());
			record.setUpdrId(gameMst.getUpdrId());
			record.setUpdDtm(gameMst.getUpdDtm());
			record.setInning(gameMst.getInningCnt());
			
			if(gameRecordRepository.insert(record) < 1){
				throw new Exception();
			}
		}
		
		return 1;
	}

	public int updateByPrimaryKeySelective(GameMst gameMst) {
		return gameMstRepository.updateByPrimaryKeySelective(gameMst);
	}

}
