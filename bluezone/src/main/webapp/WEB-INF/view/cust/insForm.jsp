<!DOCTYPE HTML>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="/static/css/bootstrap.min.css" rel="stylesheet" media="screen">
<script src="/static/js/jquery-1.10.2.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/cust/cust_insform.js"></script>
</head>

  <body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
			<jsp:include page="/WEB-INF/view/common/top_navi.jsp"></jsp:include>
			</div>
			<!-- row-fluid -->
			<div class="row-fluid">
				<div class="span2">
				<!--Sidebar content-->
					<i class="icon-tasks"></i> 회원가입
				<!-- //Sidebar content-->
				</div>
				<div class="span10">
				<!--Body content-->
					<ul class="nav nav-tabs">
					  <li class="active"> <a href="#">회원가입></a></li>
					</ul>
					<form class="form-horizontal" name="regForm">
					<input type="hidden" id="nickname_dup_chk" value="N" />
					<input type="hidden" id="email_dup_chk" value="N" />
					<input type="hidden" id="passwd_dup_chk" value="N" />
					<!-- <input type="hidden" id="score" value="10" /> -->
						<div class="control-group">
						    <label class="control-label" for="custNm">성명</label>
						    <div class="controls">
						      <input type="text" name="custNm" id="custNm" placeholder="성명" maxlength="20" />
						      <span class="text-info">&nbsp;(한글 10자, 영문 20자이내)</span>
						    </div>
					 	</div>
					  	<div class="control-group">
						    <label class="control-label" for="nickName">닉네임</label>
						    <div class="controls">
						      <input type="text" name="nickName" id="nickName" placeholder="닉네임" maxlength="25" />
						      <!-- <button class="btn btn-success" type="button">닉네임 중복체크</button> -->
						      <span id="nickname_txt" class="text-success"></span>
						      <span class="text-info">&nbsp;(한글 15자, 영문 30자이내)</span>
						    </div>
					 	</div>
					 	<div class="control-group">
						    <label class="control-label" for="email">Email</label>
						    <div class="controls">
						      <input type="text" name="email" id="email" placeholder="Email" maxlength="80" />
						      <!-- <button class="btn btn-primary" type="button">이메일 중복체크</button> -->
						      <span id="email_txt" class="text-warning">&nbsp;(Log-In시 ID로 사용)</span>
						    </div>
					  	</div>
					  	<div class="control-group">
						    <label class="control-label" for="passwd">Password</label>
						    <div class="controls">
						      <input type="password" name="passwd" id="passwd" placeholder="Password" maxlength="50"/>
						    </div>
					  	</div>
					  	<div class="control-group">
						    <label class="control-label" for="passwd_confirm">Password확인</label>
						    <div class="controls">
						      <input type="password" name="passwd_confirm" id="passwd_confirm" placeholder="Password확인" maxlength="50"/>
						      <span id="passwd_txt" class="text-error"></span>
						    </div>
					  	</div>
					  	<div class="control-group">
						    <label class="control-label" for="score">수지점수</label>
						    <div class="controls"><span id="score_txt"></span></div>
					  	</div>
						<div class="control-group">
							<div class="controls">
								<a href="javascript:Cust.custRegister()"><button type="button" class="btn btn-large btn-primary">Register</button></a>
							</div>
						</div>
					</form>
				<!-- //Body content-->
				</div>
			</div>
			<!-- //row-fluid -->
		</div>
	</div>
  </body>
</html>
