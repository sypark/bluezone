package com.bluezone.bil.service.game;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bluezone.bil.constant.CommonConstant;
import com.bluezone.bil.dao.game.repository.GameRecordInningRepository;
import com.bluezone.bil.domain.game.GameMst;
import com.bluezone.bil.domain.game.GameRecord;
import com.bluezone.bil.domain.game.GameRecordInning;
import com.bluezone.bil.domain.game.GameRecordInningExample;
import com.bluezone.bil.domain.game.GameRecordInningExample.Criteria;
import com.bluezone.bil.service.cust.CstCustRecordMstService;
import com.bluezone.bil.service.game.util.GameRecordUtil;
import com.bluezone.bil.util.DateUtils;
import com.bluezone.bil.util.StringUtils;

@Service
public class GameRecordInningService {

	@Autowired
	private GameMstService gameMstService;
	
	@Autowired
	private GameRecordService gameRecordService;
	
	@Autowired
	private CstCustRecordMstService cstCustRecordMstService;
	
	@Autowired
	private GameRecordInningRepository gameRecordInningRepository;
	
	public List<GameRecordInning> selectByExample(GameRecordInning gameRecordInning) {
		return selectByExample(gameRecordInning, null);
	}

	public List<GameRecordInning> selectByExample(GameRecordInning gameRecordInning, String orderByClause) {
		GameRecordInningExample example = new GameRecordInningExample();
		Criteria criteria = example.createCriteria();
		if(gameRecordInning != null){
			if(gameRecordInning.getGameRecNo() != null)
				criteria.andGameRecNoEqualTo(gameRecordInning.getGameRecNo());
			if(gameRecordInning.getInningNum() != null)
				criteria.andInningNumEqualTo(gameRecordInning.getInningNum());
		}
		
		if(orderByClause != null)
			example.setOrderByClause(orderByClause);
		
		return gameRecordInningRepository.selectByExample(example);
	}
	
	public int countByExample(GameRecordInning gameRecordInning){
		GameRecordInningExample example = new GameRecordInningExample();
		Criteria criteria = example.createCriteria();
		if(gameRecordInning != null){
			if(gameRecordInning.getGameRecNo() != null)
				criteria.andGameRecNoEqualTo(gameRecordInning.getGameRecNo());
			if(gameRecordInning.getInningNum() != null)
				criteria.andInningNumEqualTo(gameRecordInning.getInningNum());
		}
		
		return gameRecordInningRepository.countByExample(example);
	}
	
	public int insert(GameRecordInning record){
		return gameRecordInningRepository.insert(record);
	}
	
	public int updateByExampleSelective(GameRecordInning record, GameRecordInningExample example){
		return gameRecordInningRepository.updateByExampleSelective(record, example);
	}

	public int insertAndupdate(GameRecordInning gameRecordInning) {
		// 해당 게임의 이닝이 존재하는지 체크
		if(countByExample(gameRecordInning) > 0){
			GameRecordInning updatInning = new GameRecordInning();
			updatInning.setEarnScore(gameRecordInning.getEarnScore());
			updatInning.setUpdrId(CommonConstant.SYSTEM_ID);
			updatInning.setUpdDtm(DateUtils.curTimestamp());
			
			GameRecordInningExample example = new GameRecordInningExample();
			Criteria criteria = example.createCriteria();
			criteria.andGameRecNoEqualTo(gameRecordInning.getGameRecNo());
			criteria.andInningNumEqualTo(gameRecordInning.getInningNum());
			
			return updateByExampleSelective(updatInning, example);
		}else{
			gameRecordInning.setRegrId(CommonConstant.SYSTEM_ID);
			gameRecordInning.setRegDtm(DateUtils.curTimestamp());
			gameRecordInning.setUpdrId(CommonConstant.SYSTEM_ID);
			gameRecordInning.setUpdDtm(DateUtils.curTimestamp());
			
			return insert(gameRecordInning);
		}
	}

	/**
	 * 게임의 점수를 집계한다.
	 * record 에는 승/무/패 점수값이 들어가 있다.
	 * 1) game_record update
	 * 2) game_mst update
	 * 3) cst_cust_record_mst update
	 * 
	 * @param gameRecordInning
	 * @param record
	 * @return
	 * @throws Exception 
	 */
	@Transactional
	public int gameInningResult(GameRecordInning gameRecordInning, GameRecord record) throws Exception {
		
		// 이닝데이터를 가져온다.
		List<GameRecordInning> inningList = selectByExample(gameRecordInning);
		// 현재 게임 데이터.
		GameRecord gameRecord = gameRecordService.selectByPrimaryKey(record.getGameRecNo());
		
		Integer highRun = GameRecordUtil.getHighRun(inningList);
		Integer earnScore = GameRecordUtil.getSumScore(inningList);
		Float avg = GameRecordUtil.getAvg(gameRecord.getInning(), earnScore);
		
		// 수정해야할 데이터
		record.setHighRun(highRun);
		record.setEarnScore(earnScore);
		record.setAvg(avg);
		record.setUpdDtm(DateUtils.curTimestamp());
		record.setUpdrId(CommonConstant.SYSTEM_ID);
		
		if(gameRecordService.updateByPrimaryKeySelective(record) < 1){
			throw new Exception();
		}
		
		// 상대방의 Game Record에도 승/무/패를 update한다.
		{
			GameRecord dto = new GameRecord();
			dto.setGameNo(gameRecord.getGameNo());
			List<GameRecord> gameRecordList = gameRecordService.selectByExample(dto);
			for (GameRecord temp : gameRecordList) {
				if(temp.getCustNo() != gameRecord.getCustNo()){
					GameRecord againstDto = new GameRecord();
					againstDto.setGameRecNo(temp.getGameRecNo());
					if(StringUtils.getInt(record.getDrawCnt()) > 0){
						againstDto.setDrawCnt(1);
					}else if(StringUtils.getInt(record.getWinCnt()) > 0){
						againstDto.setLoseCnt(1);
					}else if(StringUtils.getInt(record.getLoseCnt()) > 0){
						againstDto.setWinCnt(1);
					}
					gameRecordService.updateByPrimaryKeySelective(againstDto);
					break;
				}
			}
		}
		
		// 게임 상태를 종료로 Update
		GameMst gameMst = new GameMst();
		gameMst.setGameNo(gameRecord.getGameNo());
		gameMst.setStatus(CommonConstant.GAME_STATUS_END);
		if(gameMstService.updateByPrimaryKeySelective(gameMst) < 1){
			throw new Exception();
		}
		
		// 고객의 점수를 종합 집계한다.
		if(cstCustRecordMstService.updateAnalysisCustRecord(gameRecord.getCustNo()) < 1){
			throw new Exception();
		}
		
		return 1;
	}

}
