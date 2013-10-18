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
<style type="text/css">
.accordion-group~li{
	color:red;
}
</style>
	<div class="tree well" style="margin-top:10px;padding:2px 0px;">
		<div class="accordion-group">
            <div class="accordion-heading">
            <a class="accordion-toggle" title="Bootstrap-ready starter layouts with HTML, CSS and Javascript" data-toggle="collapse" data-parent="#acc" href="#regular">정기대회</a>
            </div>
            <div id="regular" class="accordion-body collapse ">
                <div class="accordion-inner">
                    <ul class="nav" style="padding-left:14px;">
                    <%if(matchMstList != null){ %>
					<%for(MatchMst matchMst : matchMstList){ %>
						<%if(CommonConstant.MATCH_TYPE_REGULAR.equals(matchMst.getMatchType())){ %>
						<li><a href="/cust/gameRecordList.do?matchNo=<%=matchMst.getMatchNo()%>" class="layout"><i class="icon-play"></i> <%=String.format("%s월%s주", matchMst.getYyyymm().substring(4,6), matchMst.getWeek())%></a></li>
						<%} %>
					<%} %>
					<%} %>
                    </ul>
                </div>
            </div>
        </div>
		<div class="accordion-group">
            <div class="accordion-heading">
            <a class="accordion-toggle" title="Bootstrap-ready starter layouts with HTML, CSS and Javascript" data-toggle="collapse" data-parent="#acc" href="#templates">상시대회</a>
            </div>
            <div id="templates" class="accordion-body collapse ">
                <div class="accordion-inner">
                    <ul class="nav" style="padding-left:14px;">
                    <%if(custGameList != null){ %>
					<%for(GameMst gameMst : custGameList){ %>
						<li><a href="/cust/gameRecordList.do?gameNo=<%=gameMst.getGameNo()%>" class="layout"><i class="icon-play"></i> <%=StringUtils.getDateMMDD(gameMst.getGameDt(),"/")%></a></li>
					<%} %>
					<%} %>
                    </ul>
                </div>
            </div>
        </div>
	</div>
