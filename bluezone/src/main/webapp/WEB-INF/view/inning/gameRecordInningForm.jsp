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
	int custNo0 = CookieMgr.getCustNo(request);
	String custNm0 = "";
	float avg0 = 0f;
	int score0 = 0;
	
	System.out.println("custNo0"+custNo0);
	
	int custNo1 = 0;
	String custNm1 = "";
	float avg1 = 0f;
	int score1 = 0;
	for(GameCustComp gameCustComp : gameCustCompList){
		if(gameCustComp.getCustNo() != custNo0){
			custNo1 = gameCustComp.getCustNo();
			custNm1 = gameCustComp.getCustNm();
			score1 = gameCustComp.getScore() != null ? gameCustComp.getScore():0;
			avg1 = gameCustComp.getAvg() != null ? gameCustComp.getAvg():0f;
		}else{
			custNm0 = gameCustComp.getCustNm();
			score0 = gameCustComp.getScore() != null ? gameCustComp.getScore():0;
			avg0 = gameCustComp.getAvg() != null ? gameCustComp.getAvg():0f;
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
</head>

<body>
	<div class="container">
		<!-- Body content-->
		<jsp:include page="/WEB-INF/view/common/top_navi.jsp"></jsp:include>
		
		<div class="row-fluid">
        <div class="span12">
        <input type="hidden" name="inningCnt" id="inningCnt" value="<%=inningCnt%>" />
        <input type="hidden" name="custNo0" id="custNo0" value="<%=custNo0%>" />
        <input type="hidden" name="custNo1" id="custNo1" value="<%=custNo1%>" />
        <input type="hidden" name="score0" id="score0" value="<%=score0%>" />
        <input type="hidden" name="score1" id="score1" value="<%=score1%>" />
        	<div id="inning_table" align="center">
				<table class="table table-hover" style="width:600px;">
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
						<th style="text-align:center;">이닝</th>
						<th style="text-align:center;">득점</th>
						<th style="text-align:center;">이닝</th>
						<th style="text-align:center;">득점</th>
						<th style="text-align:center;"><i class="icon-plus"></i></th>
						<th style="text-align:center;background:lightyellow;">이닝</th>
						<th style="text-align:center;background:lightyellow;">득점</th>
						<th style="text-align:center;background:lightyellow;">이닝</th>
						<th style="text-align:center;background:lightyellow;">득점</th>
					</tr>
				</thead>
				<tbody>
				<%for(int i = 0 ; i < 20 ; i++){ %>
					<tr>
						<td style="text-align:center;"><%=(i+1)%></td>
						<td style="text-align:center;"><input type="text" name="inning_0" id="inning_0_<%=(i+1)%>" placeholder="0" style="width:50px;" /></td>
						<td style="text-align:center;"><%=(i+21)%></td>
						<td style="text-align:center;"><input type="text" name="inning_0" id="inning_0_<%=(i+21)%>" placeholder="0" style="width:50px;" /></td>
						<td style="text-align:center;">|</td>
						<td style="text-align:center;background:lightyellow;"><%=(i+1)%></td>
						<td style="text-align:center;background:lightyellow;"><input type="text" name="inning_1" id="inning_1_<%=(i+1)%>" placeholder="0" style="width:50px;" /></td>
						<td style="text-align:center;background:lightyellow;"><%=(i+21)%></td>
						<td style="text-align:center;background:lightyellow;"><input type="text" name="inning_1" id="inning_1_<%=(i+21)%>" placeholder="0" style="width:50px;" /></td>
					</tr>
					<%} %>
				</tbody>
				</table>
				<div style="margin:10px 0 10px 0;width:600px;">
					<button class="btn btn-small btn-primary" type="button" id="btn_complete" style="width:280px;height:50px;margin-right:35px;"><h4>Complete</h4></button>
					<button class="btn btn-small" type="button" id="btn_send_data" style="width:280px;height:50px;"><h4>데이터 전송</h4></button>
				</div>
				<div style="margin:10px 0 10px 0"><button class="btn btn-small btn-warning" type="button" id="btn_total" style="width:600px;">
					<p>
					<span style="width:100px;margin:0 10px auto;">총득점</span><span style="width:200px;margin:10px 50px 0 0;"><input type="text" name="total_score" id="total_score_0" value="0" style="width:100px;height:15px;" readonly/></span>
					<span style="width:100px;margin:0 10px 0 10px;">총득점</span><span style="width:200px;margin:0px auto;"><input type="text" name="total_score" id="total_score_1" value="0" style="width:100px;height:15px;" readonly/></span>
					</p>
					<p>
					<span style="width:100px;margin:0 10px auto;">High Run</span><span style="width:200px;margin:10px 32px 0 0;"><input type="text" name="total_high_run" id="total_high_run_0" value="0" style="width:100px;height:15px;" readonly/></span>
					<span style="width:100px;margin:0 10px 0 10px;">High Run</span><span style="width:200px;margin:0px 17px 0 0;"><input type="text" name="total_high_run" id="total_high_run_1" value="0" style="width:100px;height:15px;" readonly/></span>
					</p>
					<p>
					<span style="width:100px;margin:0 10px auto;">총이닝</span>
					<span style="width:200px;margin:0px 40px 0 0;">
						<select name="total_inning" id="total_inning_0" style="width:110px;height:25px;">
						<%for(int i=1 ; i <= inningCnt ; i++){%>
						<option value="<%=i%>"><%=i%>이닝</option>
						<%}%>
						</select>
					</span>
					<span style="width:100px;margin:0 10px 0 15px;">총이닝</span>
					<span style="width:200px;margin:0px 5px 0 0;">
						<select name="total_inning" id="total_inning_1" style="width:110px;height:25px;">
						<%for(int i=1 ; i <= inningCnt ; i++){%>
						<option value="<%=i%>"><%=i%>이닝</option>
						<%}%>
						</select>
					</span>
					</p>
					<p>
					<span style="width:100px;margin:0 10px auto;">에&nbsp;&nbsp;버</span><span style="width:200px;margin:10px 22px 0 0;"><input type="text" name="total_avg" id="total_avg_0" value="0" style="width:100px;height:15px;" readonly/></span>
					<span style="width:100px;margin:0 10px 0 40px;">에&nbsp;&nbsp;버</span><span style="width:200px;margin:0px 0px 0 0;"><input type="text" name="total_avg" id="total_avg_1" value="0" style="width:100px;height:15px;" readonly/></span>
					</p>
				</button></div>
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
		  			<td>&nbsp;</td>
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
      	<br>
		<!-- //Body content-->
	</div>
	</center>
<script>
var InningRecord={
	inningCnt:0,
	isComplete:false,
	sumInning:function(num){
		var sum=0;
		jQuery("input[name=inning_"+num+"]").each(function(index){
			if(jQuery(this).val() != undefined && jQuery(this).val() != null && jQuery(this).val() != ""){
				sum += parseInt(jQuery(this).val());
			}
		});
		if(jQuery("#score"+num).val() < sum){
			sum = jQuery("#score"+num).val();
		}
		return sum;
	},
	countInning:function(num){
		var sum=0;
		var cnt=0;
		for(var i=1 ; i<=InningRecord.inningCnt ; i++){
			value = jQuery("#inning_"+num+"_"+i).val();
			
			if(value != undefined && value != null && value != ""){
				sum += parseInt(value);
			}
			if(sum >= parseInt(jQuery("#score"+num).val())){
				cnt=i;
				
				//초과한 만큼 현재 이닝 차감.
				jQuery("#inning_"+num+"_"+i).val(value-(sum-parseInt(jQuery("#score"+num).val())));
				// 나머지 이닝 초기화.
				for(var j=i+1 ; j<=InningRecord.inningCnt ; j++){
					jQuery("#inning_"+num+"_"+j).val("");
				}
				break;
			}
		}
		return (cnt == 0 ? InningRecord.inningCnt:cnt);
	},
	getHighRun:function(num){
		var highRun = 0;
		for(var i=1 ; i<=InningRecord.inningCnt ; i++){
			value = jQuery("#inning_"+num+"_"+i).val();
			if(value != undefined && value != null && value != ""){
				if(highRun < parseInt(value)){
					highRun = parseInt(value);
				}
			}
		}
		return highRun;
	},
	getTotalAvg:function(num){
		var avg = InningRecord.sumInning(num)/InningRecord.countInning(num);
		
		return avg.toFixed(2);		
	}
};

jQuery(document).ready(function(){
	InningRecord.inningCnt = parseInt(jQuery("#inningCnt").val());
	for(var i=0;i<2;i++){
		var cnt=1;
		jQuery("input[name=inning_"+i+"]").each(function(){
			if(cnt > InningRecord.inningCnt){
				jQuery("#inning_"+i+"_"+cnt).attr("disabled", true);
			}
			cnt++;
		});
	}
	jQuery("input[name=inning_0]").blur(function(){
		for(var i=0;i<2;i++){
			jQuery("#total_score_"+i).val(InningRecord.sumInning(i));
			jQuery("#total_high_run_"+i).val(InningRecord.getHighRun(i));
			jQuery("#total_inning_"+i).val(InningRecord.countInning(i));
			jQuery("#total_avg_"+i).val(InningRecord.getTotalAvg(i));
		}
	});
	jQuery("input[name=inning_1]").blur(function(){
		for(var i=0;i<2;i++){
			jQuery("#total_score_"+i).val(InningRecord.sumInning(i));
			jQuery("#total_high_run_"+i).val(InningRecord.getHighRun(i));
			jQuery("#total_inning_"+i).val(InningRecord.countInning(i));
			jQuery("#total_avg_"+i).val(InningRecord.getTotalAvg(i));
		}
	});
	jQuery("#btn_complete").click(function(){
		var totalInningSel = false;
		for(var i=0;i<2;i++){
			jQuery("#total_score_"+i).val(InningRecord.sumInning(i));
			jQuery("#total_high_run_"+i).val(InningRecord.getHighRun(i));
			//jQuery("#total_inning_"+i).val(InningRecord.countInning(i));
			jQuery("#total_avg_"+i).val(InningRecord.getTotalAvg(i));
			
			if(totalInningSel == false && InningRecord.sumInning(i) == parseInt(jQuery("#score"+i).val())){
				jQuery("#total_inning_0").val(InningRecord.countInning(i));
				jQuery("#total_inning_1").val(InningRecord.countInning(i));
				totalInningSel = true;
			}
		}
		
		var disabled = false;
		if(InningRecord.isComplete == false){
			InningRecord.isComplete = true;
			disabled = true;
		}else{
			InningRecord.isComplete = false;
			disabled = false;
		}
		
		for(var i=0;i<2;i++){
			jQuery("input[name=inning_"+i+"]").each(function(index){
				if(index <= InningRecord.inningCnt){
					jQuery("#inning_"+i+"_"+index).attr("disabled", disabled);
				}
			});
		}
		
		if(InningRecord.isComplete == true){
			if(parseInt(jQuery("#score0").val()) == parseInt(jQuery("#total_score_0").val())){
				jQuery("#cust_result_0").html("<button class='btn btn-large btn-danger' type='button'><h3>Win!!</h3></button>");
				jQuery("#cust_result_1").html("");
			}else if(parseInt(jQuery("#score1").val()) == parseInt(jQuery("#total_score_1").val())){
				jQuery("#cust_result_0").html("");
				jQuery("#cust_result_1").html("<button class='btn btn-large btn-danger' type='button'><h4>Win!!</h4></button>");
			}else{
				//alert("총 득점이 참가자분들의 점수와 불일치합니다.");
				jQuery("#cust_result_0").html("<button class='btn' type='button'><h4>무승부</h4></button>");
				jQuery("#cust_result_1").html("<button class='btn' type='button'><h4>무승부</h4></button>");
			}
			jQuery("#gameResultModal").modal("show");
		}
	});
	jQuery("#btn_send_data").click(function(){
		if(InningRecord.isComplete == false){
			alert("Complete 버튼을 눌러서 경기를 종료해 주세요.");
			return;
		}
		if(parseInt(jQuery("#score0").val()) != jQuery("#total_score_0").val() && parseInt(jQuery("#score1").val()) != jQuery("#total_score_1").val()){
			if(!confirm("총 득점이 참가자분들의 점수와 불일치합니다.\n그래도 전송하시겠습니까?")){
				return;
			}
		}
		
		alert(1);
	});
});
</script>

	</body>
</html>
