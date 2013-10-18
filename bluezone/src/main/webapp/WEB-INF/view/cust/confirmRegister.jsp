<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bluezone.bil.service.cust.CustUtil" %>
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
<!-- Head -->
<jsp:include page="/WEB-INF/view/common/top_navi_blue.jsp">
	<jsp:param name="title" value="회원가입" />
</jsp:include>
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
				    <label class="control-label" for="email">성별</label>
				    <div class="controls">
				      <p class="btn btn-large disabled"><%=CustUtil.getCustSex(cstCustMst.getCustSex())%></p>
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