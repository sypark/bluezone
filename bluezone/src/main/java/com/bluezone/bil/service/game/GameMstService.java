package com.bluezone.bil.service.game;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluezone.bil.dao.game.repository.GameMstRepository;
import com.bluezone.bil.domain.game.GameMst;
import com.bluezone.bil.domain.game.GameMstExample;
import com.bluezone.bil.domain.game.GameMstExample.Criteria;

@Service
public class GameMstService {
	
	@Autowired
	private GameMstRepository gameMstRepository;

	public List<GameMst> selectByExample(GameMst gameMst) {
		GameMstExample example = new GameMstExample();
		Criteria criteria = example.createCriteria();
		if(gameMst.getMatchNo() != null)
			criteria.andMatchNoEqualTo(gameMst.getMatchNo());
		if(gameMst.getUseYn() != null)
			criteria.andUseYnEqualTo(gameMst.getUseYn());
		
		return gameMstRepository.selectByExample(example);
	}

}
