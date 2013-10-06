package com.bluezone.bil.dao.cust.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bluezone.bil.dao.cust.mapper.CstCustRecordMstMapper;
import com.bluezone.bil.domain.cust.AnalysisCustRecord;
import com.bluezone.bil.domain.cust.CstCustRecordMst;
import com.bluezone.bil.domain.cust.CstCustRecordMstExample;

@Repository
public class CstCustRecordMstRepository {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<CstCustRecordMst> selectByExample(CstCustRecordMstExample example){
		return sqlSession.getMapper(CstCustRecordMstMapper.class).selectByExample(example);
	}
	
	public CstCustRecordMst selectByPrimaryKey(Integer custNo){
		return sqlSession.getMapper(CstCustRecordMstMapper.class).selectByPrimaryKey(custNo);
	}
	
	public int insertCstCustRecordMst(CstCustRecordMst cstCustRecordMst) {
		return sqlSession.getMapper(CstCustRecordMstMapper.class).insertSelective(cstCustRecordMst);
	}

	public int updateByPrimaryKeySelective(CstCustRecordMst cstCustRecordMst) {
		return sqlSession.getMapper(CstCustRecordMstMapper.class).updateByPrimaryKeySelective(cstCustRecordMst);
	}
	
	public AnalysisCustRecord analysisCstCustRecord(Integer custNo) {
		return sqlSession.getMapper(CstCustRecordMstMapper.class).analysisCstCustRecord(custNo);
	}
	
	public List<AnalysisCustRecord> analysisAgainstRecordList(Integer custNo) {
		return sqlSession.getMapper(CstCustRecordMstMapper.class).analysisAgainstRecordList(custNo);
	}
	
	public List<AnalysisCustRecord> totalMemberScoreList() {
		return sqlSession.getMapper(CstCustRecordMstMapper.class).totalMemberScoreList();
	}
}
