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
	
	
	public List<MatchMst> selectByExample(MatchMst matchMst) {
		MatchMstExample example = new MatchMstExample();
		Criteria criteria = example.createCriteria();
		if(matchMst.getUseYn() != null)
			criteria.andUseYnEqualTo(matchMst.getUseYn());
		if(matchMst.getMatchDt() != null)
			criteria.andMatchDtGreaterThanOrEqualTo(matchMst.getMatchDt());
		
		return matchMstRepository.selectByExample(example);
	}
}
