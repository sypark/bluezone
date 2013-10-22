<!DOCTYPE HTML>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Head -->
<jsp:include page="/WEB-INF/view/common/top_navi_blue.jsp">
	<jsp:param name="title" value="메인" />
</jsp:include>
<script src="/static/js/google.jsapi.js"></script>
<script src="/static/js/main/no_main.js"></script>
<script>
NoMain.ajaxTotalMemberScoreList();
NoMain.runPieChart();
</script>

	<div class="container">
		<div class="row-fluid">
			<div class="span6">
				<div class="panel panel-primary">
        			<div class="panel-heading">
          				<h3 class="panel-title">Panel title</h3>
       				</div>
        			<div class="panel-body">
          				Panel content
        			</div>
      			</div>
          		<h2>Blue Zone is</h2>
          		<p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa.</p>
          		<p><a class="btn" href="#">View details &raquo;</a></p>
        	</div>
        	<div class="span6">
				<div style="margin:16px 0 0 5px;">
					<span class="badge badge-warning" style="display:block;margin-bottom:15px;"><i class="icon-signal icon-white bigger-130" style="margin-top:3px;"></i> <span class="user-info" style="padding-bottom:5px;">Bluezone's Summary Score Board</span></span>
	        		<div id="pie_chart_div" style="margin:0 0 0 0px;"></div>
        		</div>
        	</div>
      	</div>
		<!-- //Body content-->
	</div>
	<!-- Footer -->
	<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
	<!-- // Footer -->
</body>
</html>