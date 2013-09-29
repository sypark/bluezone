<!DOCTYPE HTML>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bluezone.bil.util.StringUtils" %>
<%@page import="com.bluezone.bil.domain.cust.CstCustMst" %>
<%@page import="com.bluezone.bil.domain.cust.CstCustRecordMst" %>
<%
	CstCustRecordMst cstCustRecordMst = (CstCustRecordMst)request.getAttribute("cstCustRecordMst");
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
</head>

  <body>
	<div class="container">
		<!-- Body content-->
		<jsp:include page="/WEB-INF/view/common/top_navi.jsp"></jsp:include>
		
		<div class="row-fluid">
        <div class="span6">
        		
			<div class="col-sm-5">
				<div class="widget-box transparent">
					<div class="widget-header widget-header-flat">
						<h4 class="lighter">
							<i class="icon-star orange"></i>
							Personal Record
						</h4>
					</div>

					<div>
						<div class="no-padding">
							<table class="table table-bordered table-striped">
								<tbody>
									<tr>
										<td><i class="icon-play"></i></td>
										<td>
											 수지
										</td>
										<td>
											<%=cstCustRecordMst.getScore()%>점
										</td>
									</tr>
									<tr>
										<td><i class="icon-play"></i></td>
										<td>
											High Run
										</td>
										<td>
											<%=StringUtils.getInt(cstCustRecordMst.getHighRun())%>점
										</td>
									</tr>
									<tr>
										<td><i class="icon-play"></i></td>
										<td>
											Avg.
										</td>
										<td>
											<%=StringUtils.getFloat(cstCustRecordMst.getAvg())%>
										</td>
									</tr>
									<tr>
										<td><i class="icon-play"></i></td>
										<td>
											전적
										</td>
										<td>
											<p>Total : <%=StringUtils.getInt(cstCustRecordMst.getWinCnt())+StringUtils.getInt(cstCustRecordMst.getLoseCnt())+StringUtils.getInt(cstCustRecordMst.getDrawCnt())%>G</p>
											<p>Win : <%=StringUtils.getInt(cstCustRecordMst.getWinCnt())%>G</p>
											<p>Lost : <%=StringUtils.getInt(cstCustRecordMst.getLoseCnt())%>G</p>
											<p>Draw : <%=StringUtils.getInt(cstCustRecordMst.getDrawCnt())%>G</p>
										</td>
									</tr>
								</tbody>
							</table>
						</div><!-- /widget-main -->
					</div><!-- /widget-body -->
				</div><!-- /widget-box -->
			</div><!-- /col-sm-5 -->
        </div>
        <div class="span6">
          <h2>Heading</h2>
          <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa.</p>
          <p><a class="btn" href="#">View details &raquo;</a></p>
        </div>
      </div>
		<!-- //Body content-->
	</div>
	</center>
	
	
  </body>
</html>