package com.bluezone.bil.domain.game;

public class GameCustComp extends GameRecord{
	
	private Integer custNo;
	private String custNm;
	private String email;
	private String nickName;
	private Integer custScore;
	private Float custScoreAvg;
	private Float custAvg;
	private Integer custHighRun;
	private Integer custWinCnt;
	private Integer custLoseCnt;
	private Integer custDrawCnt;
	private String gameNm;
	private String gameDt;
	private Integer inningCnt;
	
	public Integer getCustNo() {
		return custNo;
	}
	public void setCustNo(Integer custNo) {
		this.custNo = custNo;
	}
	public String getCustNm() {
		return custNm;
	}
	public void setCustNm(String custNm) {
		this.custNm = custNm;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public Integer getCustScore() {
		return custScore;
	}
	public void setCustScore(Integer custScore) {
		this.custScore = custScore;
	}
	public Float getCustScoreAvg() {
		return custScoreAvg;
	}
	public void setCustScoreAvg(Float custScoreAvg) {
		this.custScoreAvg = custScoreAvg;
	}
	public Float getCustAvg() {
		return custAvg;
	}
	public void setCustAvg(Float custAvg) {
		this.custAvg = custAvg;
	}
	public Integer getCustHighRun() {
		return custHighRun;
	}
	public void setCustHighRun(Integer custHighRun) {
		this.custHighRun = custHighRun;
	}
	public Integer getCustWinCnt() {
		return custWinCnt;
	}
	public void setCustWinCnt(Integer custWinCnt) {
		this.custWinCnt = custWinCnt;
	}
	public Integer getCustLoseCnt() {
		return custLoseCnt;
	}
	public void setCustLoseCnt(Integer custLoseCnt) {
		this.custLoseCnt = custLoseCnt;
	}
	public Integer getCustDrawCnt() {
		return custDrawCnt;
	}
	public void setCustDrawCnt(Integer custDrawCnt) {
		this.custDrawCnt = custDrawCnt;
	}
	public String getGameNm() {
		return gameNm;
	}
	public void setGameNm(String gameNm) {
		this.gameNm = gameNm;
	}
	public String getGameDt() {
		return gameDt;
	}
	public void setGameDt(String gameDt) {
		this.gameDt = gameDt;
	}
	public Integer getInningCnt() {
		return inningCnt;
	}
	public void setInningCnt(Integer inningCnt) {
		this.inningCnt = inningCnt;
	}
	
}
