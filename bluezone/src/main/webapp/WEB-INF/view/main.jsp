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

					<div class="widget-body">
						<div class="widget-main no-padding">
							<table class="table table-bordered table-striped">
								<tbody>
									<tr>
										<td><h4><i class="icon-play"></i></h4></td>
										<td>
											<h5>수지</h5>
										</td>
										<td>
											<h5>24점</h5>
										</td>
									</tr>
									<tr>
										<td><h5><i class="icon-play"></i></h5></td>
										<td>
											<h5>High Run</h5>
										</td>
										<td>
											<h5>12점</h5>
										</td>
									</tr>
									<tr>
										<td><h5><i class="icon-play"></i></h5></td>
										<td>
											<h5>Avg.</h5>
										</td>
										<td>
											<h5>1.68</h5>
										</td>
									</tr>
									<tr>
										<td><h5><i class="icon-play"></i></h5></td>
										<td>
											<h5>전적</h5>
										</td>
										<td>
											<h5>24게G/12W/10L/2M</h5>
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