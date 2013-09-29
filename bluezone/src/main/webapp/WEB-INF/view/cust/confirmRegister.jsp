<!DOCTYPE HTML>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bluezone.bil.domain.cust.CstCustMst" %>
<%@page import="com.bluezone.bil.domain.cust.CstCustRecordMst" %>
<%
	CstCustMst cstCustMst = null;
	CstCustRecordMst cstCustRecordMst = null;
	if(request.getAttribute("cstCustMst") != null){
		cstCustMst = (CstCustMst)request.getAttribute("cstCustMst");
	}
	if(request.getAttribute("cstCustRecordMst") != null){
		cstCustRecordMst = (CstCustRecordMst)request.getAttribute("cstCustRecordMst");
	}
%>
<html>
<head>
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="/static/css/bootstrap.min.css" rel="stylesheet" media="screen">
<script src="/static/js/jquery-1.10.2.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
</head>

  <body>
	<div class="container-fluid">
	<jsp:include page="/WEB-INF/view/common/top_navi.jsp"></jsp:include>
		<div class="row-fluid">
			<div class="span2">
			<!--Sidebar content-->
				<i class="icon-tasks"></i> 회원가입완료
			<!-- //Sidebar content-->
			</div>
			<div class="span10">
			<!--Body content-->
				<ul class="nav nav-tabs">
				  <li class="active"> <a href="#">회원가입완료</a></li>
				</ul>
				<form class="form-horizontal">
					<div class="control-group">
					    <label class="control-label" for="custNm">성명</label>
					    <div class="controls">
					      <p class="btn btn-large disabled"><%=cstCustMst.getCustNm()%></p>
					    </div>
				 	</div>
				  	<div class="control-group">
					    <label class="control-label" for="nickName">닉네임</label>
					    <div class="controls">
					      <p class="btn btn-large disabled"><%=cstCustMst.getNickName()%></p>
					    </div>
				 	</div>
				 	<div class="control-group">
					    <label class="control-label" for="email">Email</label>
					    <div class="controls">
					      <p class="btn btn-large disabled"><%=cstCustMst.getEmail()%></p>
					    </div>
				  	</div>
				  	<div class="control-group">
					    <label class="control-label" for="score">수지점수</label>
					    <div class="controls">
					    	<p class="btn btn-large disabled"><%=cstCustRecordMst.getScore()%>점</p>
					    </div>
				  	</div>
					<div class="control-group">
						<div class="controls">
							<a href="/main.do"><button type="button" class="btn btn-large btn-primary">Log In</button></a>
						</div>
					</div>
				</form>
			<!-- //Body content-->
			</div>
		</div>
	</div>
  </body>
</html>