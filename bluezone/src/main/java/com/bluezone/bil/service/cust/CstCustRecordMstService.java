package com.bluezone.bil.service.cust;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluezone.bil.constant.CommonConstant;
import com.bluezone.bil.dao.cust.repository.CstCustRecordMstRepository;
import com.bluezone.bil.domain.cust.AnalysisCustRecord;
import com.bluezone.bil.domain.cust.CstCustRecordMst;
import com.bluezone.bil.domain.cust.CstCustRecordMstExample;
import com.bluezone.bil.domain.cust.CstCustRecordMstExample.Criteria;
import com.bluezone.bil.util.DateUtils;

/**
 * @author 박승연
 *
 */
@Service
public class CstCustRecordMstService {
	
	@Autowired
	private CstCustRecordMstRepository cstCustRecordMstRepository;

	public CstCustRecordMst selectByPrimaryKey(Integer custNo) {
		return cstCustRecordMstRepository.selectByPrimaryKey(custNo);
	}
	public List<CstCustRecordMst> selectByExample(CstCustRecordMst cstCustRecordMst){
		return selectByExample(cstCustRecordMst, null);
	}
	
	public List<CstCustRecordMst> selectByExample(CstCustRecordMst cstCustRecordMst, String orderByClause){
		
		CstCustRecordMstExample example = new CstCustRecordMstExample();
		Criteria criteria = example.createCriteria();
		if(cstCustRecordMst != null){
			if(cstCustRecordMst.getCustNo() != null)
				criteria.andCustNoEqualTo(cstCustRecordMst.getCustNo());
		}
		
		if(orderByClause != null){
			example.setOrderByClause(orderByClause);
		}
		
		return cstCustRecordMstRepository.selectByExample(example);
	}

	/**
	 * 고객의 득점 데이터를 종합 집계한다.
	 * 
	 * @param custNo
	 * @return
	 */
	public AnalysisCustRecord analysisCstCustRecord(Integer custNo) {
		return cstCustRecordMstRepository.analysisCstCustRecord(custNo);
	}

	
	public int updateAnalysisCustRecord(Integer custNo){
		AnalysisCustRecord analysisCustRecord = analysisCstCustRecord(custNo);
		
		CstCustRecordMst cstCustRecordMst = new CstCustRecordMst();
		cstCustRecordMst.setCustNo(custNo);
		cstCustRecordMst.setUpdDtm(DateUtils.curTimestamp());
		cstCustRecordMst.setUpdrId(CommonConstant.SYSTEM_ID);
		cstCustRecordMst.setAvg(analysisCustRecord.getGameAvg());
		cstCustRecordMst.setHighRun(analysisCustRecord.getMaxHighRun());
		cstCustRecordMst.setWinCnt(analysisCustRecord.getSumWinCnt());
		cstCustRecordMst.setLoseCnt(analysisCustRecord.getSumLoseCnt());
		cstCustRecordMst.setDrawCnt(analysisCustRecord.getSumDrawCnt());
		
		return cstCustRecordMstRepository.updateByPrimaryKeySelective(cstCustRecordMst);
	}
	
	/**
	 * 상대전적리스트.
	 * @param custNo
	 * @return
	 */
	public List<AnalysisCustRecord> analysisAgainstRecordList(Integer custNo) {
		return cstCustRecordMstRepository.analysisAgainstRecordList(custNo);
	}
	
	public List<AnalysisCustRecord> totalMemberScoreList() {
		return cstCustRecordMstRepository.totalMemberScoreList();
	}
}
