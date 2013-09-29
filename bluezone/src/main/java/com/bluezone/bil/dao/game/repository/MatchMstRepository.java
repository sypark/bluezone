package com.bluezone.bil.dao.game.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bluezone.bil.dao.game.mapper.MatchMstMapper;
import com.bluezone.bil.domain.game.MatchMst;
import com.bluezone.bil.domain.game.MatchMstExample;

@Repository
public class MatchMstRepository {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<MatchMst> selectByExample(MatchMstExample example) {
		return sqlSession.getMapper(MatchMstMapper.class).selectByExample(example);
	}
}
