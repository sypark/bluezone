<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bluezone.bil.util.cookie.CookieMgr" %>
<link href="/static/css/bluezone.css" rel="stylesheet" media="screen">
<script src="/static/js/cust/cust_login.js"></script>
	<div class="logobar logobar-fixed-top bs-docs-nav" role="banner">
		<div class="conjtainer">
			<!-- Menu button for smallar screens -->
	     	<div class="logobar-header">
			<!-- Site name for smallar screens -->
			<a href="index.html" class="logobar-brand">Blue Club</a>
	     	<span class="logobar-image" id="logobar-image">Naver Carom 3Cushion Billiard Club</span>
			</div>
		</div>
	</div>
	<div class="navbar navbar-default" id="navbar">
		<div class="navbar-container" id="navbar-container">
			<div class="navbar-header pull-left" style="margin:12px 0 0 0;">
				<a href="/main.do" class="navbar-brand"><i class="icon-home icon-white"></i> Home</a>
			</div>
			<div class="navbar-header pull-right" role="navigation">
				<ul class="nav ace-nav">
					<%if(CookieMgr.isLogin(request)){%>
					<li class="green">
						<a class="navbar-brand" href="#">
							<i class="icon-tasks icon-white"></i><span class="badge badge-grey" id="click_game_record">경기기록</span>
						</a>
					</li>
					<li class="purple">
						<a class="navbar-brand" href="#">
							<i class="icon-pencil icon-white"></i><span class="badge badge-important" id="click_create_game">기록입력</span>
						</a>
					</li>
					<li>
					<div class="dropdown" style="margin-left:30px;">
						<a class="dropdown-toggle white" id="dLabel" role="button" data-toggle="dropdown" data-target="#" href="#">
						<img class="nav-user-photo" src="/static/img/user.jpg" alt="Jason's Photo" />
						<small><span id="top_nick_name"></span></small>
						<i class="icon-chevron-down icon-white"></i>
						</a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
							<li>
								<a href="#"><i class="icon-user"></i> Profile</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="/logout.do"><i class="icon-off"></i> Log out</a>
							</li>
						</ul>
					</div>
					<%}else{%>
					<li><a href="#myModal" role="button" data-toggle="modal" class="login white"><i class="icon-lock icon-white"></i>&nbsp;Log In</a></li>
					<li style="margin:0 -15px 0 -15px;"><a class="login white">|</a></li>
					<li><a href="/cust/insForm.do" class="login white"><i class="icon-plus icon-white"></i>&nbsp;Register</a></li>
					<%}%>
					</li>
				</ul><!-- /.ace-nav -->
			</div><!-- /.navbar-header -->
		</div><!-- /.container -->
	</div>
		
	<!-- Modal -->
	<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width:450px;">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	    <span class="login-wrapper"><h3 id="myModalLabel">Login</h3></span>
	  </div>
	  <div class="modal-body">
	  	<table>
		  <tbody>
		    <tr>
		      <td><input type="text" id="top_email" name="top_email" placeholder="Email" style="width:400px;" /> <span id="login_email_txt"></span></td>
		    </tr>
		    <tr>
		      <td><input type="password" id="top_passwd" name="top_passwd" placeholder="Password" style="width:400px;" /></td>
		    </tr>
		  </tbody>
		</table>
	  </div>
	  <div class="modal-footer">
	    <a href="javascript:Login.login()"><button type="button" class="btn btn-primary" data-loading-text="Loading...">Log In</button></a>
	    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
	  </div>
	</div>
	<!-- // Modal -->