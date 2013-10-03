package com.bluezone.bil.service.cust;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bluezone.bil.dao.cust.repository.CstCustMstRepository;
import com.bluezone.bil.dao.cust.repository.CstCustRecordMstRepository;
import com.bluezone.bil.domain.cust.CstCustMst;
import com.bluezone.bil.domain.cust.CstCustMstExample;
import com.bluezone.bil.domain.cust.CstCustMstExample.Criteria;
import com.bluezone.bil.domain.cust.CstCustRecordMst;

@Service
public class CstCustMstService {

	@Autowired
	private CstCustMstRepository cstCustMstRepository;
	
	@Autowired
	private CstCustRecordMstRepository cstCustRecordMstRepository;
	
	public CstCustMst dupChkNickName(CstCustMst cstCustMst){
		return cstCustMstRepository.dupChkNickName(cstCustMst);
	}

	public CstCustMst dupChkEmail(CstCustMst cstCustMst) {
		return cstCustMstRepository.dupChkEmail(cstCustMst);
	}

	@Transactional
	public int insertCstCustMst(CstCustMst cstCustMst, CstCustRecordMst cstCustRecordMst) throws Exception {
		
		if(cstCustMstRepository.insertCstCustMst(cstCustMst) > 0){
			
			// 고객정보 생성후 고객번호 채번.
			cstCustRecordMst.setCustNo(cstCustMst.getCustNo());
			
			if(cstCustRecordMstRepository.insertCstCustRecordMst(cstCustRecordMst) > 0){
				return cstCustMst.getCustNo();
			}else{
				throw new Exception();
			}
		}else{
			throw new Exception();
		}
		
	}

	public CstCustMst selectByPrimaryKey(Integer custNo) {
		return cstCustMstRepository.selectByPrimaryKey(custNo);
	}
	
	public List<CstCustMst> selectByExample(CstCustMst cstCustMst) {
		CstCustMstExample example = new CstCustMstExample();
		if(cstCustMst != null){
			Criteria criteria = example.createCriteria();
			if(cstCustMst.getCustNm() != null)
				criteria.andCustNmEqualTo(cstCustMst.getCustNm());
		}
		
		return cstCustMstRepository.selectByExample(example);
	}

	public int loginChk(CstCustMst cstCustMst) {
		CstCustMstExample example = new CstCustMstExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmailEqualTo(cstCustMst.getEmail());
		criteria.andPasswdEqualTo(cstCustMst.getPasswd());
		
		List<CstCustMst> list = cstCustMstRepository.selectByExample(example);
		
		if(list != null && list.size() == 1){
			return list.get(0).getCustNo();
		}else{
			return 0;
		}
	}
}
