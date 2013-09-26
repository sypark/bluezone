package com.bluezone.bil.service.cust;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluezone.bil.dao.CstCustRecordMstRepository;
import com.bluezone.bil.domain.cust.CstCustRecordMst;

@Service
public class CstCustRecordMstService {
	
	@Autowired
	private CstCustRecordMstRepository cstCustRecordMstRepository;

	public CstCustRecordMst selectByPrimaryKey(Integer custNo) {
		return cstCustRecordMstRepository.selectByPrimaryKey(custNo);
	}

	
}
