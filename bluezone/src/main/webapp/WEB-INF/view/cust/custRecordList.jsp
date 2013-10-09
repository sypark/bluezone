<!DOCTYPE HTML>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="com.bluezone.bil.util.StringUtils" %>
<%@page import="com.bluezone.bil.domain.game.GameCustComp" %>
<%@page import="com.bluezone.bil.util.StringUtils" %>
<%
	List<GameCustComp> gameRecordList = (List<GameCustComp>)request.getAttribute("gameRecordList");
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
		
		<div class="row-fluid">
	        <div class="span2">
			</div><!-- // span2 -->
			<div class="span10">
			<%if(gameRecordList != null){ %>
			<table class="table table-striped">
              <thead>
                <tr>
                  <th>경기일자</th>
                  <th>경기명</th>
                  <th>이닝수</th>
                  <th>수지</th>
                  <th>승/패</th>
                  <th>득점</th>
                  <th>AVG</th>
                  <th>High Run</th>
                  <th>대전상대</th>
                  <th>상대수지</th>
                </tr>
              </thead>
              <tbody>
              <%int cnt=0;%>
              <%for(GameCustComp gameCustComp :gameRecordList){ %>
                <tr>
                  <td><%=StringUtils.getDateYYYYMMDD(gameCustComp.getGameDt(), "/")%></td>
                  <td><%=gameCustComp.getGameNm()%></td>
                  <td><%=gameCustComp.getInningCnt()%></td>
                  <td><%=gameCustComp.getScore()%></td>
                  <td><%=(StringUtils.getInt(gameCustComp.getWinCnt()) > 0 ? "승":(StringUtils.getInt(gameCustComp.getLoseCnt()) > 0 ? "패":"무"))%></td>
                  <td><%=StringUtils.getInt(gameCustComp.getEarnScore())%></td>
                  <td><%=StringUtils.getFloat(gameCustComp.getAvg())%></td>
                  <td><%=StringUtils.getInt(gameCustComp.getHighRun())%></td>
                  <td><%=gameCustComp.getNickName()%></td>
                  <td><%=gameCustComp.getCustScore()%></td>
                </tr>
                <%}%>
              </tbody>
            </table>
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