<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="com.bluezone.bil.util.StringUtils" %>
<%@page import="com.bluezone.bil.domain.game.MatchMst" %>
<%@page import="com.bluezone.bil.domain.game.GameMst" %>
<%@page import="com.bluezone.bil.util.StringUtils" %>
<%@page import="com.bluezone.bil.constant.CommonConstant" %>
<%
	List<MatchMst> matchMstList = (List<MatchMst>)request.getAttribute("custMatchList");
	List<GameMst> custGameList = (List<GameMst>)request.getAttribute("custGameList");
%>
<link rel="stylesheet" href="/static/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/static/css/listTree.css" type="text/css">
<script src="/static/js/jquery-1.10.2.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/listTree.js"></script>
 
	<div class="tree well" style="padding:2px 0px;">
	<ul>
		<li>
			<span><a href="/cust/recordList.do"><i class="icon-folder-open badge-warning"></i> 전체보기</a></span>
		</li>
		<li>
			<span><i class="icon-folder-open"></i> 정기대회</span>
			<ul>
			<%if(matchMstList != null){ %>
			<%for(MatchMst matchMst : matchMstList){ %>
				<%if(CommonConstant.MATCH_TYPE_REGULAR.equals(matchMst.getMatchType())){ %>
				<li>
					<span class="badge badge-warning"><i class="icon-minus-sign"></i> <a href="/cust/recordList.do?matchNo=<%=matchMst.getMatchNo()%>"><%=String.format("%s월%s주", matchMst.getYyyymm().substring(4,6), matchMst.getWeek())%></a></span>
				</li>
				<%} %>
			<%} %>
			<%} %>
			</ul>
		</li>
		<li>
			<span><i class="icon-folder-open"></i> 상시대회</span>
			<ul>
			<%if(custGameList != null){ %>
			<%for(GameMst gameMst : custGameList){ %>
				<li>
					<span><i class="icon-minus-sign"></i> <a href="/cust/recordList.do?gameNo=<%=gameMst.getGameNo()%>"><%=StringUtils.getDateMMDD(gameMst.getGameDt(),"/")%></a></span>
				</li>
			<%} %>
			<%} %>
            </ul>
		</li>
	</ul>
</div>
