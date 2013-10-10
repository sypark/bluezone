package com.bluezone.bil.service.game;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluezone.bil.dao.game.repository.MatchMstRepository;
import com.bluezone.bil.domain.game.MatchMst;
import com.bluezone.bil.domain.game.MatchMstExample;
import com.bluezone.bil.domain.game.MatchMstExample.Criteria;

@Service
public class MatchMstService {

	@Autowired
	private MatchMstRepository matchMstRepository;
	
	public MatchMst selectByPrimaryKey(Integer matchNo){
		return matchMstRepository.selectByPrimaryKey(matchNo);
	}
	
	public List<MatchMst> selectByExample(MatchMst matchMst) {
		return selectByExample(matchMst, null);
	}
	
	public List<MatchMst> selectByExample(MatchMst matchMst, String orderByClause) {
		MatchMstExample example = new MatchMstExample();
		Criteria criteria = example.createCriteria();
		if(matchMst.getUseYn() != null)
			criteria.andUseYnEqualTo(matchMst.getUseYn());
		if(matchMst.getEndDt() != null){
			criteria.andStdDtLessThanOrEqualTo(matchMst.getEndDt());
			criteria.andEndDtGreaterThanOrEqualTo(matchMst.getEndDt());
		}
		
		if(orderByClause != null){
			example.setOrderByClause(orderByClause);
		}
		
		return matchMstRepository.selectByExample(example);
	}

	public int insert(MatchMst matchMst) {
		return matchMstRepository.insert(matchMst);
	}
	
	public List<MatchMst> custMatchList(Integer custNo){
		return matchMstRepository.custMatchList(custNo);
	}
}
