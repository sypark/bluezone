<!DOCTYPE HTML>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script src="/static/js/main/no_main.js"></script>
<script>
NoMain.ajaxTotalMemberScoreList();
NoMain.runPieChart();
</script>
</head>

  <body>
	<div class="container">
		<!-- Body content-->
		<jsp:include page="/WEB-INF/view/common/top_navi_blue.jsp"></jsp:include>
		
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
				<p class="green" style="font-weight:bold;"><i class="icon-signal bigger-130"></i> <span class="user-info">Bluezone's Summary Score Board</span></p>
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