package com.bluezone.bil.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bluezone.bil.dao.mapper.CstCustMstMapper;
import com.bluezone.bil.domain.cust.CstCustMst;
import com.bluezone.bil.domain.cust.CstCustMstExample;

@Repository
public class CstCustMstRepository {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public CstCustMst selectByPrimaryKey(Integer custNo){
		return sqlSession.getMapper(CstCustMstMapper.class).selectByPrimaryKey(custNo);
	}

	public CstCustMst dupChkNickName(CstCustMst cstCustMst){
		return sqlSession.getMapper(CstCustMstMapper.class).dupChkNickName(cstCustMst);
	}

	public CstCustMst dupChkEmail(CstCustMst cstCustMst) {
		return sqlSession.getMapper(CstCustMstMapper.class).dupChkEmail(cstCustMst);
	}

	public int insertCstCustMst(CstCustMst cstCustMst) {
		return sqlSession.getMapper(CstCustMstMapper.class).insertSelective(cstCustMst);
	}

	public int countByExample(CstCustMstExample example) {
		return sqlSession.getMapper(CstCustMstMapper.class).countByExample(example);
	}

	public List<CstCustMst> selectByExample(CstCustMstExample example) {
		return sqlSession.getMapper(CstCustMstMapper.class).selectByExample(example);
	}
	
}
