package com.bluezone.bil.dao.cust.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bluezone.bil.dao.cust.mapper.CstCustRecordMstMapper;
import com.bluezone.bil.domain.cust.CstCustRecordMst;

@Repository
public class CstCustRecordMstRepository {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public CstCustRecordMst selectByPrimaryKey(Integer custNo){
		return sqlSession.getMapper(CstCustRecordMstMapper.class).selectByPrimaryKey(custNo);
	}
	
	public int insertCstCustRecordMst(CstCustRecordMst cstCustRecordMst) {
		return sqlSession.getMapper(CstCustRecordMstMapper.class).insertSelective(cstCustRecordMst);
	}
}
