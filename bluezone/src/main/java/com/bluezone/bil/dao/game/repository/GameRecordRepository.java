package com.bluezone.bil.dao.game.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bluezone.bil.dao.game.mapper.GameRecordMapper;
import com.bluezone.bil.domain.game.GameCustComp;
import com.bluezone.bil.domain.game.GameRecord;
import com.bluezone.bil.domain.game.GameRecordExample;

@Repository
public class GameRecordRepository {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insert(GameRecord record){
		return sqlSession.getMapper(GameRecordMapper.class).insert(record);
	}

	public List<GameRecord> selectByExample(GameRecordExample example) {
		return sqlSession.getMapper(GameRecordMapper.class).selectByExample(example);
	}

	public GameRecord selectByPrimaryKey(Integer gameRecNo) {
		return sqlSession.getMapper(GameRecordMapper.class).selectByPrimaryKey(gameRecNo);
	}
	
	public int updateByPrimaryKeySelective(GameRecord record) {
		return sqlSession.getMapper(GameRecordMapper.class).updateByPrimaryKeySelective(record);
	}
	
	public List<GameCustComp> selectGameWithCustInfo(Integer gameNo) {
		return sqlSession.getMapper(GameRecordMapper.class).selectGameWithCustInfo(gameNo);
	}
	
	public List<GameCustComp> selectTotalCustGameRecordList(GameCustComp gameCustComp) {
		return sqlSession.getMapper(GameRecordMapper.class).selectTotalCustGameRecordList(gameCustComp);
	}
}
