<!DOCTYPE HTML>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="com.bluezone.bil.util.StringUtils" %>
<%@page import="com.bluezone.bil.domain.cust.CstCustMst" %>
<%@page import="com.bluezone.bil.domain.cust.CstCustRecordMst" %>
<%@page import="com.bluezone.bil.domain.cust.AnalysisCustRecord" %>
<%
	CstCustMst cstCustMst = (CstCustMst)request.getAttribute("cstCustMst");
	CstCustRecordMst cstCustRecordMst = (CstCustRecordMst)request.getAttribute("cstCustRecordMst");
	AnalysisCustRecord analysisCustRecord = (AnalysisCustRecord)request.getAttribute("analysisCustRecord");
	List<AnalysisCustRecord> againstList = (List<AnalysisCustRecord>)request.getAttribute("analysisAgainstRecordList");
	String earnAvgScore = String.format("%.2f", (analysisCustRecord.getSumEarnScore()/analysisCustRecord.getGameCnt()*1.0f));
%>
<html>
<head>
<title>Main</title>
<meta charset="utf-8" />
<meta name="description" content="Draggabble Widget Boxes &amp; Containers" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="/static/css/bootstrap.min.css" rel="stylesheet" media="screen">
<script src="/static/js/jquery-1.10.2.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/google.jsapi.js"></script>
<script src="/static/js/main/main.js"></script>
<script>
Main.win = <%=StringUtils.getInt(cstCustRecordMst.getWinCnt())%>;
Main.lose = <%=StringUtils.getInt(cstCustRecordMst.getLoseCnt())%>;
Main.draw = <%=StringUtils.getInt(cstCustRecordMst.getDrawCnt())%>;

Main.runPieChart();
// 라인 차트에서 사용할 데이터를 가져온다.
Main.ajaxRecentRecordList();
Main.runLineChart1();
Main.runLineChart2();
</script>
</head>

  <body>
	<div class="container">
		<!-- Body content-->
		<jsp:include page="/WEB-INF/view/common/top_navi_blue.jsp"></jsp:include>
		
		<div class="row">
			<!-- First Row Left -->
	        <div class="span6">
	        	<div style="margin:16px 0 0 5px;">
	        		<p class="green" style="font-weight:bold;"><i class="icon-flag bigger-130 green"></i> <span class="user-info"><small>Welcome,</small> <%=cstCustMst.getNickName()%></span></p>
		        	<div class="infobox infobox-green">
						<div class="infobox-icon">
							점수.
						</div>
						<div class="infobox-data">
							<span class="infobox-data-number"><%=cstCustRecordMst.getScore()%></span>
							<div class="infobox-content">comments + 2 reviews</div>
						</div>
						<div class="stat stat-success">8%</div>
					</div>
		        	<div class="infobox infobox-blue">
						<div class="infobox-icon">
							High Run.
						</div>
	
						<div class="infobox-data">
							<span class="infobox-data-number"><%=analysisCustRecord.getMaxHighRun()%></span>
							<div class="infobox-content">new followers</div>
						</div>
	
						<div class="badge badge-success">
							+32%
							<i class="icon-arrow-up"></i>
						</div>
					</div>
		        	<div class="infobox infobox-red" style="margin:15px 0 0 0;">
						<div class="infobox-icon">
							AVG.
						</div>
	
						<div class="infobox-data">
							<span class="infobox-data-number"><%=String.format("%.2f", analysisCustRecord.getGameAvg())%></span>
							<div class="infobox-content">experiments</div>
						</div>
					</div>
		        	<div class="infobox infobox-blue2" style="margin:15px 0 0 0;">
		        		<div class="infobox-icon">
							평균<p>득점.</p>
						</div>
						<div class="infobox-data">
							<span class="infobox-data-number"><%=earnAvgScore%></span>
							<div class="infobox-content"><span class="bigger-110">~</span>58GB remaining</div>
						</div>
					</div>
				</div>
			</div>
			<!-- //First Row Left -->
			<!-- First Row Right -->
			<div class="span6">
				<div style="margin:16px 0 0 5px;">
					<p class="green" style="font-weight:bold;"><i class="icon-signal bigger-130"></i> <span class="user-info">Your's Total Record(win/lose/draw)</span></p>
		        	<div id="pie_chart_div" style="margin:0 0 0 0px;"></div>
	        	</div>
	        </div>
	        <!-- //First Row Right -->
	        <!-- Second Row Left -->
	        <div class="span6">
	        	<div class="win-lose-list">
	        		<p class="blue" style="font-weight:bold;margin-bottom:20px;"><i class="icon-flag bigger-130"></i> <span class="user-info">Against Total Record List</span></p>
					<div class="widget-box transparent">
						<div class="widget-body">
							<div class="widget-main no-padding">
								<table class="table table-bordered table-striped">
									<thead class="thin-border-bottom">
										<tr>
											<th class="lbl" style="width:36%;">Nickname</th>
											<th class="lbl" style="width:15%;">승</th>
											<th class="lbl" style="width:15%;">무</th>
											<th class="lbl" style="width:15%;">패</th>
										</tr>
									</thead>
									<tbody>
									<%if(againstList != null){ %>
									<%for(AnalysisCustRecord gnalysisCustRecord : againstList){ %>
										<tr>
											<td class="lbl" style="width:36%;"><%=gnalysisCustRecord.getNickName()%></td>
											<td class="lbl" style="width:15%;"><span class="label label-info arrowed-right arrowed-in"><%=gnalysisCustRecord.getSumWinCnt()%>승</span></td>
											<td class="lbl" style="width:15%;"><span class="label label-success arrowed-in arrowed-in-right"><%=gnalysisCustRecord.getSumLoseCnt()%>패</span></td>
											<td class="lbl" style="width:15%;"><span class="label label-danger arrowed"><%=gnalysisCustRecord.getSumDrawCnt()%>무</span></td>
										</tr>
									<%}%>
									<%}%>
									</tbody>
								</table>
							</div><!-- /widget-main -->
						</div><!-- /widget-body -->
					</div>
				</div>
	        </div>
        	<!-- //Second Row Left -->
        	<!-- Second Row Right -->
	        <div class="span6">
	        	<div style="margin:30px 0 0 5px;">
		        	<p class="blue" style="font-weight:bold;"><i class="icon-signal bigger-130"></i> <span class="user-info">Your Recently Record Chart</span></p>
		        	<div id="line_chart_div1" style="margin:0px 0 0 0;"></div>
		        	<div id="line_chart_div2" style="margin:0px 0 0 0;"></div>
	        	</div>
	        </div>
	        <!-- // Second Row Right -->
	        
    	</div>
      	<!-- // row -->
		<!-- //Body content-->
	</div>

	<!-- Footer -->
	<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
	<!-- // Footer -->

  </body>
</html>