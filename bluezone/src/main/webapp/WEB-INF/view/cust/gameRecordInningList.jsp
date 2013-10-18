<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="com.bluezone.bil.util.StringUtils" %>
<%@page import="com.bluezone.bil.domain.game.GameMst" %>
<%@page import="com.bluezone.bil.domain.game.GameRecord" %>
<%@page import="com.bluezone.bil.domain.game.GameRecordInning" %>
<%@page import="com.bluezone.bil.util.StringUtils" %>
<%
	int gameRecNo = new Integer((String)request.getParameter("gameRecNo")).intValue();
	GameMst gameMst = (GameMst)request.getAttribute("gameMst");
	List<GameRecord> gameRecordList = (List<GameRecord>)request.getAttribute("gameRecordList");
	GameRecord gameRecord0 = null;
	GameRecord gameRecord1 = null;
	for(GameRecord gameRecord : gameRecordList){
		if(gameRecNo == gameRecord.getGameRecNo()){
			gameRecord0 = gameRecord;
		}else{
			gameRecord1 = gameRecord;
		}
	}
	
	List<GameRecordInning> gameRecordInningList0 = null;
	List<GameRecordInning> gameRecordInningList1 = null;
	if(request.getAttribute("gameRecordInningList0") != null){
		gameRecordInningList0 = (List<GameRecordInning>)request.getAttribute("gameRecordInningList0");
	}
	if(request.getAttribute("gameRecordInningList1") != null){
		gameRecordInningList1 = (List<GameRecordInning>)request.getAttribute("gameRecordInningList1");
	}
%>
<!-- Head -->
<jsp:include page="/WEB-INF/view/common/top_navi_blue.jsp">
	<jsp:param name="title" value="게임이닝정보" />
</jsp:include>
<script>
var GameRecordInnng={
	ajaxCstCustInfo:function(idx){
		var requestUrl = "/cust/ajaxSelectCstCustInfoFromGameRecNo.do";
		var params = new function(){
			this.gameRecNo = jQuery("#gameRecNo"+idx).val();
		};
		jQuery.ajax({
			method : "GET",
			url : requestUrl,
			data : params,
			timeout : 3000,
			success:function(data){
				jQuery("#nickName"+idx).html("<i class=\"icon-user icon-white\"></i> "+data.nickName);
			}
		});
	}	
};
jQuery(document).ready(function(){
	jQuery(".tableList01").each(function(idx){
		GameRecordInnng.ajaxCstCustInfo(idx);
		if(jQuery("#highrun"+idx).val() > 0){
			jQuery(this).find(".badge").each(function(){
				if(jQuery(this).attr("score") == jQuery("#highrun"+idx).val()){
					jQuery(this).attr("class", "badge badge-important");
				}
			});
		}
	});
});
</script>
		
		<!-- Body content-->
		<div class="row-fluid">
	        <div class="span2">
	        <jsp:include page="/cust/leftmenu.do"/>
			</div><!-- // span2 -->
			<div class="span10">
				<h4><button class="btn btn-large btn-block btn-primary" type="button"><i class="icon-th icon-white"></i>게임명 : <%=gameMst.getGameNm()%> 
					<i class="icon-th icon-white" style="margin-left:30px;"></i>게임일자 : <%=StringUtils.getDateYYYYMMDD(gameMst.getGameDt(), "/")%></button></h4>
				<%if(gameRecordInningList0 != null){ %>
				<div class="alert alert-info">
					<span class="bigger-110">
						<span class="badge badge-info" id="nickName0"></span>
						<span class="badge badge-info">수지:<%=gameRecord0.getScore()%></span>
						<span class="badge badge-info">득점:<%=gameRecord0.getEarnScore()%></span>
						<span class="badge badge-info">AVG:<%=gameRecord0.getAvg()%></span>
						<span class="badge badge-info">HighRun:<%=gameRecord0.getHighRun()%></span>
					</span>
				</div>
				<table class="tableList01">
	              <tbody>
					<%
					int gameInning = gameRecord0.getInning();
					int highRun = 0;
					int rowcnt = 0;
	              	for(int i = 1 ; i <= 40 ; i++){
	              		int score = 0;
	              		for(GameRecordInning gameRecordInning :gameRecordInningList0){
	              			if(gameRecordInning.getInningNum() == i){
	              				score = gameRecordInning.getEarnScore();
	              				break;
	              			}
	              		}
	              		if(score > highRun){
	              			highRun = score;
	              		}
	              		if(i%10 == 1){
					%>
					<thead>
	                <tr>
	                <%
	                	for(int k = 1 ; k <= 10 ; k++){
	                %>
	                  <th class="cdata"><%=k+(10*rowcnt)%>th</th>
	                 <%
	                 	}
	                	rowcnt += 1;
	                 %>
	                </tr>
	              </thead>
	              <tr>
					<%}%>
	                  <td class="cdata"><span class="badge <%=(score > 0 ? "badge-success":"")%>" score="<%=score%>"><%=(i > gameInning ? "X":score+"")%></span></td>
					<%
						if(i%10 == 0){
							out.println("</tr>");
						}
					%>
	                <%}%>
	              </tbody>
	            </table>
	            <input type="hidden" name="highrun0" id="highrun0" value="<%=highRun%>" />
	            <input type="hidden" name="gameRecNo0" id="gameRecNo0" value="<%=gameRecord0.getGameRecNo()%>" />
	            <%}%>
	            <br>
				<%if(gameRecordInningList1 != null){ %>
				<div class="alert alert-success">
					<span class="bigger-110">
						<span class="badge badge-success" id="nickName1"></span>
						<span class="badge badge-success">수지:<%=gameRecord1.getScore()%></span>
						<span class="badge badge-success">득점:<%=gameRecord1.getEarnScore()%></span>
						<span class="badge badge-success">AVG:<%=gameRecord1.getAvg()%></span>
						<span class="badge badge-success">HighRun:<%=gameRecord1.getHighRun()%></span>
					</span>
				</div>
				<table class="tableList01">
	              <tbody>
					<%
					int gameInning = gameRecord1.getInning();
					int highRun = 0;
					int rowcnt = 0;
	              	for(int i = 1 ; i <= 40 ; i++){
	              		int score = 0;
	              		for(GameRecordInning gameRecordInning :gameRecordInningList1){
	              			if(gameRecordInning.getInningNum() == i){
	              				score = gameRecordInning.getEarnScore();
	              				break;
	              			}
	              		}
	              		if(score > highRun){
	              			highRun = score;
	              		}
	              		if(i%10 == 1){
					%>
					<thead>
	                <tr>
	                <%
	                	for(int k = 1 ; k <= 10 ; k++){
	                %>
	                  <th class="cdata"><%=k+(10*rowcnt)%>th</th>
	                 <%
	                 	}
	                	rowcnt += 1;
	                 %>
	                </tr>
	              </thead>
	              <tr>
					<%}%>
	                  <td class="cdata"><span class="badge <%=(score > 0 ? "badge-success":"")%>" score="<%=score%>"><%=(i > gameInning ? "X":score+"")%></span></td>
					<%
						if(i%10 == 0){
							out.println("</tr>");
						}
					%>
	                <%}%>
	              </tbody>
	            </table>
	            <input type="hidden" name="highrun1" id="highrun1" value="<%=highRun%>" />
	            <input type="hidden" name="gameRecNo1" id="gameRecNo1" value="<%=gameRecord1.getGameRecNo()%>" />
	            <%}%>
			</div><!-- // span10 -->
		</div>
		
	<!-- //Body content-->
	</div>
	<!-- Footer -->
	<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
	<!-- // Footer -->
</body>
</html>