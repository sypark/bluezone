<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="com.bluezone.bil.util.StringUtils" %>
<%@page import="com.bluezone.bil.domain.game.GameCustComp" %>
<%@page import="com.bluezone.bil.util.StringUtils" %>
<%
	List<GameCustComp> gameRecordList = (List<GameCustComp>)request.getAttribute("gameRecordList");
%>
<!-- Head -->
<jsp:include page="/WEB-INF/view/common/top_navi_blue.jsp">
	<jsp:param name="title" value="게임기록" />
</jsp:include>
		
		<div class="row-fluid">
	        <div class="span2">
	        <jsp:include page="/cust/leftmenu.do"/>
			</div><!-- // span2 -->
			<div class="span10">
			<%if(gameRecordList != null){ %>
			<table class="table table-striped">
              <thead>
                <tr>
                  <th class="cdata">경기일자</th>
                  <th class="cdata">경기명</th>
                  <th class="cdata">이닝수</th>
                  <th class="cdata">수지</th>
                  <th class="cdata">승/패</th>
                  <th class="cdata">득점</th>
                  <th class="cdata">AVG</th>
                  <th class="cdata">High Run</th>
                  <th class="cdata">대전상대</th>
                  <th class="cdata">상대수지</th>
                </tr>
              </thead>
              <tbody>
              <%int cnt=0;%>
              <%for(GameCustComp gameCustComp :gameRecordList){ %>
                <tr>
                  <td class="cdata"><a href="/cust/gameRecordInningList.do?gameNo=<%=gameCustComp.getGameNo()%>&gameRecNo=<%=gameCustComp.getGameRecNo()%>"><%=StringUtils.getDateYYYYMMDD(gameCustComp.getGameDt(), "/")%></a></td>
                  <td class="cdata"><%=gameCustComp.getGameNm()%></td>
                  <td class="cdata"><%=gameCustComp.getInningCnt()%></td>
                  <td class="cdata"><%=gameCustComp.getScore()%></td>
                  <td class="cdata"><%=(StringUtils.getInt(gameCustComp.getWinCnt()) > 0 ? "승":(StringUtils.getInt(gameCustComp.getLoseCnt()) > 0 ? "패":"무"))%></td>
                  <td class="cdata"><%=StringUtils.getInt(gameCustComp.getEarnScore())%></td>
                  <td class="cdata"><%=StringUtils.getFloat(gameCustComp.getAvg())%></td>
                  <td class="cdata"><%=StringUtils.getInt(gameCustComp.getHighRun())%></td>
                  <td class="cdata"><%=gameCustComp.getNickName()%></td>
                  <td class="cdata"><%=gameCustComp.getCustScore()%></td>
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