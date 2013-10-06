<!DOCTYPE HTML>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="com.bluezone.bil.util.StringUtils" %>
<%@page import="com.bluezone.bil.domain.cust.CstCustMst" %>
<%@page import="com.bluezone.bil.domain.game.GameMst" %>
<%@page import="com.bluezone.bil.domain.game.MatchMst" %>
<%@page import="com.bluezone.bil.domain.game.GameCustComp" %>
<%@page import="com.bluezone.bil.util.cookie.CookieMgr" %>
<%@page import="com.bluezone.bil.util.StringUtils" %>
<%
	MatchMst matchMst = (MatchMst)request.getAttribute("matchMst");
	GameMst gameMst = (GameMst)request.getAttribute("gameMst");
	List<GameCustComp> gameCustCompList = (List<GameCustComp>)request.getAttribute("gameCustCompList");
	
	int cookieCustNo = CookieMgr.getCustNo(request);
	
	int custNo0 = 0;
	int gameRecNo0 = 0;
	String custNm0 = "";
	float avg0 = 0f;
	int score0 = 0;
	
	System.out.println("custNo0"+custNo0);
	
	int custNo1 = 0;
	int gameRecNo1 = 0;
	String custNm1 = "";
	float avg1 = 0f;
	int score1 = 0;
	for(GameCustComp gameCustComp : gameCustCompList){
		if(cookieCustNo == gameCustComp.getCustNo()){
			gameRecNo0 = gameCustComp.getGameRecNo();
			custNo0 = gameCustComp.getCustNo();
			custNm0 = gameCustComp.getCustNm();
			score0 = gameCustComp.getScore() != null ? gameCustComp.getScore():0;
			avg0 = gameCustComp.getAvg() != null ? gameCustComp.getAvg():0f;
		}else{
			gameRecNo1 = gameCustComp.getGameRecNo();
			custNo1 = gameCustComp.getCustNo();
			custNm1 = gameCustComp.getCustNm();
			score1 = gameCustComp.getScore() != null ? gameCustComp.getScore():0;
			avg1 = gameCustComp.getAvg() != null ? gameCustComp.getAvg():0f;
		}
	}
	int inningCnt = gameMst.getInningCnt();
%>
<html>
<head>
<title>Main</title>
<meta charset="utf-8" />
<meta name="description" content="Draggabble Widget Boxes &amp; Containers" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="/static/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="/static/css/bluezone.css" rel="stylesheet" media="screen">
<script src="/static/js/jquery-1.10.2.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/game/game_record_inning.js"></script>
</head>

<body>
	<div class="container">
		<!-- Body content-->
		<jsp:include page="/WEB-INF/view/common/top_navi_blue.jsp"></jsp:include>
		
		<form>
        <input type="hidden" name="gameRecNo0" id="gameRecNo0" value="<%=gameRecNo0%>" />
        <input type="hidden" name="gameRecNo1" id="gameRecNo1" value="<%=gameRecNo1%>" />
        <input type="hidden" name="inningCnt" id="inningCnt" value="<%=inningCnt%>" />
        <input type="hidden" name="cookieCustNo" id="cookieCustNo" value="<%=cookieCustNo%>" />
        <input type="hidden" name="custNo0" id="custNo0" value="<%=custNo0%>" />
        <input type="hidden" name="custNo1" id="custNo1" value="<%=custNo1%>" />
        <input type="hidden" name="score0" id="score0" value="<%=score0%>" />
        <input type="hidden" name="score1" id="score1" value="<%=score1%>" />
        <input type="hidden" name="gameResult0" id="gameResult0" value="" />
        <input type="hidden" name="gameResult1" id="gameResult1" value="" />
        </form>
		<div class="row-fluid">
	        <div class="span6">
	        	<div id="inning_table" align="center">
	        	<table class="table table-hover" style="width:50%;">
				<colgroup>
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				</colgroup>
				<thead>
					<tr>
						<th style="text-align:center;">&nbsp;</th>
						<th style="text-align:center;">득점</th>
						<th style="text-align:center;">&nbsp;</th>
						<th style="text-align:center;">득점</th>
						<th style="text-align:center;"><i class="icon-plus"></i></th>
						<th style="text-align:center;background:lightyellow;">&nbsp;</th>
						<th style="text-align:center;background:lightyellow;">득점</th>
						<th style="text-align:center;background:lightyellow;">&nbsp;</th>
						<th style="text-align:center;background:lightyellow;">득점</th>
					</tr>
				</thead>
				<tbody>
				<%for(int i = 0 ; i < 20 ; i++){ %>
					<tr>
						<td style="text-align:center;"><%=(i+1)%></td>
						<td style="text-align:center;"><input type="text" name="inning_0" id="inning_0_<%=(i+1)%>" placeholder="0" style="width:40px;" /></td>
						<td style="text-align:center;"><%=(i+21)%></td>
						<td style="text-align:center;"><input type="text" name="inning_0" id="inning_0_<%=(i+21)%>" placeholder="0" style="width:40px;" /></td>
						<td style="text-align:center;">|</td>
						<td style="text-align:center;background:lightyellow;"><%=(i+1)%></td>
						<td style="text-align:center;background:lightyellow;"><input type="text" name="inning_1" id="inning_1_<%=(i+1)%>" placeholder="0" style="width:40px;" /></td>
						<td style="text-align:center;background:lightyellow;"><%=(i+21)%></td>
						<td style="text-align:center;background:lightyellow;"><input type="text" name="inning_1" id="inning_1_<%=(i+21)%>" placeholder="0" style="width:40px;" /></td>
					</tr>
					<%} %>
				</tbody>
				</table>
				</div>
			</div><!-- // span6 -->
			<div class="span6">
				<div id="inning_summary" align="center">
					<div style="margin:10px 0 10px 30px;">
						<button class="btn btn-small btn-primary" type="button" id="btn_complete" style="width:200px;height:50px;margin-right:25px;"><h4><span id="font_complete">Complete</span></h4></button>
						<button class="btn btn-small" type="button" id="btn_send_data" style="width:200px;height:50px;"><h4>데이터 전송</h4></button>
					</div>
					<div style="margin:10px 0 10px 30px;">
						<button class="btn btn-small btn-warning" type="button" id="btn_total" style="width:430px;">
						<p>
						<span style="width:70px;margin:0 10px auto;">총득점</span><span style="width:130px;margin:10px 20px 0 0;"><input type="text" name="total_score" id="total_score_0" value="0" style="width:100px;height:15px;" readonly/></span>
						<span style="width:70px;margin:0 10px 0 10px;">총득점</span><span style="width:130px;margin:0px 0 0 0;"><input type="text" name="total_score" id="total_score_1" value="0" style="width:100px;height:15px;" readonly/></span>
						</p>
						<p>
						<span style="width:70px;margin:0 10px 0 10px;">High Run</span><span style="width:130px;margin:10px 5px 0 0;"><input type="text" name="total_high_run" id="total_high_run_0" value="0" style="width:100px;height:15px;" readonly/></span>
						<span style="width:70px;margin:0 10px 0 10px;">High Run</span><span style="width:130px;margin:0px 17px 0 0;"><input type="text" name="total_high_run" id="total_high_run_1" value="0" style="width:100px;height:15px;" readonly/></span>
						</p>
						<p>
						<span style="width:70px;margin:0 10px 0 22px;">총이닝</span>
						<span style="width:150px;margin:0px 20px 0 0;">
							<select name="total_inning" id="total_inning_0" style="width:113px;height:25px;">
							<%for(int i=1 ; i <= inningCnt ; i++){%>
							<option value="<%=i%>"><%=i%>이닝</option>
							<%}%>
							</select>
						</span>
						<span style="width:70px;margin:0 10px 0 10px;">총이닝</span>
						<span style="width:150px;margin:0px 15px 0 0;">
							<select name="total_inning" id="total_inning_1" style="width:113px;height:25px;">
							<%for(int i=1 ; i <= inningCnt ; i++){%>
							<option value="<%=i%>"><%=i%>이닝</option>
							<%}%>
							</select>
						</span>
						</p>
						<p>
						<span style="width:70px;margin:0 10px 0 30px;">에&nbsp;&nbsp;버</span><span style="width:130px;margin:10px 30px 0 0;"><input type="text" name="total_avg" id="total_avg_0" value="0" style="width:100px;height:15px;" readonly/></span>
						<span style="width:70px;margin:0 10px 0 10px;">에&nbsp;&nbsp;버</span><span style="width:130px;margin:0px 15px 0 0;"><input type="text" name="total_avg" id="total_avg_1" value="0" style="width:100px;height:15px;" readonly/></span>
						</p>
						</button>
					</div>
				</div>
			</div><!-- // span6 -->
		</div>
		<!-- Modal -->
		<div id="sendDataModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-body">
			<p style="text-align:center"><img src="/static/img/ajax-loader_big.gif"></p>
			</div>
		</div>
		
		<!-- Modal -->
		<div id="gameResultModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
		    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		    	<h3 id="myModalLabel">게임결과</h3>
		  	</div>
		  	<div class="modal-body">
		  		<table class="table" style="width:500px;">
		  		<colgroup>
				<col width="248px" />
				<col width="*" />
				<col width="248px" />
				</colgroup>
		  		<tr>
		  			<td style="text-align:center;"><h3><%=custNm0%></h3></td>
		  			<td style="text-align:center;vertical-align:middle;"><h4>VS</h4></td>
		  			<td style="text-align:center;"><h3><%=custNm1%></h3></td>
		  		</tr>
		  		<tr>
		  			<td style="text-align:center;"><span id="cust_result_0"></span></td>
		  			<td>&nbsp;</td>
		  			<td style="text-align:center;"><span id="cust_result_1"></span></td>
		  		</tr>
		  		</table>
		  	</div>
		  	<div class="modal-footer" id="modal_bottom">
		    	<button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">확인</button>
		  	</div>
		</div>
		<!-- //Modal -->
	<!-- //Body content-->
	</div>
	<!-- Footer -->
	<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
	<!-- // Footer -->
</body>
</html>
