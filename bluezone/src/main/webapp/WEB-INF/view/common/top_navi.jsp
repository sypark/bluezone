<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bluezone.bil.util.cookie.CookieMgr" %>
<script src="/static/js/cust/cust_login.js"></script>
		<a href="/main.do"><img src="/static/img/bluezone_banner.jpg" class="img-polaroid"></a>
	    <p style="margin-top:5px;position: relative;"></p>
		<div class="navbar navbar-inverse" style="position: static;">
			<div class="navbar-inner">
				<div class="container">
					<a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</a>
					<a class="brand" href="#">Title</a>
					<div class="nav-collapse collapse navbar-inverse-collapse">
						<ul class="nav">
							<li class="active"><a href="#">Home</a></li>
							<li><a href="#">Link</a></li>
							<li><a href="#">Link</a></li>
							<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li class="nav-header">Nav header</li>
								<li><a href="#">Separated link</a></li>
								<li><a href="#">One more separated link</a></li>
							</ul>
							</li>
						</ul>
					<form class="navbar-search pull-left" action="">
						<input type="text" class="search-query span2" placeholder="Search">
					</form>
					<ul class="nav pull-right">
					<%if(CookieMgr.isLogin(request)){%>
						<li><a href="/logout.do"><i class="icon-user icon-white"></i>&nbsp;Log Off</a></li>
						<li class="divider-vertical"></li>
					<%}else{%>
						<li><a href="#myModal" role="button" data-toggle="modal"><i class="icon-lock icon-white"></i>&nbsp;Log In</a></li>
						<li class="divider-vertical"></li>
						<li><a href="/cust/insForm.do"><i class="icon-plus icon-white"></i>&nbsp;Register</a></li>
					<%}%>
					</ul>
					</div><!-- /.nav-collapse -->
				</div>
			</div><!-- /navbar-inner -->
		</div><!-- /navbar -->
		
		<!-- Modal -->
		<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-header">
		    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		    <h3 id="myModalLabel">Log In</h3>
		  </div>
		  <div class="modal-body">
		  	<table>
			  <tbody>
			    <tr>
			      <td>Email</td>
			      <td>&nbsp;:&nbsp;</td>
			      <td><input type="text" id="email" placeholder="Email"></td>
			    </tr>
			    <tr>
			      <td>Password</td>
			      <td>&nbsp;:&nbsp;</td>
			      <td><input type="password" id="passwd" placeholder="Password"></td>
			    </tr>
			  </tbody>
			</table>
		  </div>
		  <div class="modal-footer">
		    <a href="javascript:Login.login()"><button class="btn btn-primary">Log In</button></a>
		    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
		  </div>
		</div>
		<!-- // Modal -->