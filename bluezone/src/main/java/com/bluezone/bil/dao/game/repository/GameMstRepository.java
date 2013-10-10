package com.bluezone.bil.dao.game.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bluezone.bil.dao.game.mapper.GameMstMapper;
import com.bluezone.bil.domain.game.GameMst;
import com.bluezone.bil.domain.game.GameMstExample;

@Repository
public class GameMstRepository {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public GameMst selectByPrimaryKey(Integer gameNo) {
		return sqlSession.getMapper(GameMstMapper.class).selectByPrimaryKey(gameNo);
	}
	
	public List<GameMst> selectByExample(GameMstExample example) {
		return sqlSession.getMapper(GameMstMapper.class).selectByExample(example);
	}
	
	public int insert(GameMst record){
		return sqlSession.getMapper(GameMstMapper.class).insert(record);
	}

	public int updateByPrimaryKeySelective(GameMst record) {
		return sqlSession.getMapper(GameMstMapper.class).updateByPrimaryKeySelective(record);
	}
	
	public int deleteByPrimaryKey(Integer gameNo){
		return sqlSession.getMapper(GameMstMapper.class).deleteByPrimaryKey(gameNo);
	}
	
	public List<GameMst>  custGameList(Integer custNo){
		return sqlSession.getMapper(GameMstMapper.class).custGameList(custNo);
	}
}
