package com.bluezone.bil.dao.game.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bluezone.bil.dao.game.mapper.GameRecordInningMapper;
import com.bluezone.bil.domain.game.GameRecordInning;
import com.bluezone.bil.domain.game.GameRecordInningExample;

@Repository
public class GameRecordInningRepository {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<GameRecordInning> selectByExample(GameRecordInningExample example) {
		return sqlSession.getMapper(GameRecordInningMapper.class).selectByExample(example);
	}
	
	
}
