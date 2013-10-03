<!DOCTYPE HTML>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="com.bluezone.bil.util.StringUtils" %>
<%@page import="com.bluezone.bil.domain.cust.CstCustMst" %>
<%@page import="com.bluezone.bil.domain.cust.CstCustRecordMst" %>
<%@page import="com.bluezone.bil.util.cookie.CookieMgr" %>
<%@page import="com.bluezone.bil.util.StringUtils" %>
<%
	CstCustRecordMst cstCustRecordMst = (CstCustRecordMst)request.getAttribute("cstCustRecordMst");
	List<CstCustMst> cstCustMstList = (List<CstCustMst>)request.getAttribute("cstCustMstList");
	int custNo = CookieMgr.getCustNo(request);
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
<script src="/static/js/game/create_game.js"></script>
</head>

<body>
	<div class="container">
		<!-- Body content-->
		<jsp:include page="/WEB-INF/view/common/top_navi.jsp"></jsp:include>
		
		<div class="row-fluid">
        <div class="span12">
        	<div style="margin-left:10px;margin-bottom:10px;font-weight:bold;color:goldenrod;">경기를 선택해 주세요</div>
			<div class="row-fluid">
				<div class="span4"><span id="span_td_0"></span></div>
				<div class="span4"><span id="span_td_1"></span></div>
				<div class="span4"><span id="span_td_2"></span></div>
			</div>
        	</div>
		</div>
		
		<!-- Modal -->
		<form name="form_create_game" id="form_create_game">
		<input type="hidden" name="matchNo" id="matchNo" value="<%=StringUtils.getString(request.getParameter("matchNo"))%>" />
		<input type="hidden" name="gameNo" id="gameNo" value="<%=StringUtils.getString(request.getParameter("gameNo"))%>" />
		<input type="hidden" name="custNo1" id="custNo1" value="<%=custNo%>" />
		<input type="hidden" name="custNo2" id="custNo2" value="" />
		<div id="newGameModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
		    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		    	<h3 id="myModalLabel">New게임 생성</h3>
		  	</div>
		  	<div class="modal-body">
		  		<table class="table" style="width:530px;">
		  		<colgroup>
				<col width="90px" />
				<col width="40px" />
				<col width="*" />
				</colgroup>
		  		<tr>
		  			<td style="text-align:center;">게임명</td>
		  			<td>&nbsp;</td>
		  			<td>
		  				<input type="text" id="game_nm" name="game_nm" placeholder="게임명을 입력해주세요">
		  			</td>
		  		</tr>
		  		<tr>
		  			<td style="text-align:center;">이닝수</td>
		  			<td>&nbsp;</td>
		  			<td>
		  				<select name="sel_inning_cnt" id="sel_inning_cnt" style="width:200px;">
		  				<option value="40">40이닝</option>
		  				<option value="35">35이닝</option>
		  				<option value="30">30이닝</option>
		  				</select>
		  			</td>
		  		</tr>
		  		<tr>
		  			<td style="text-align:center;"><i class="icon-pencil"></i>본인</td>
		  			<td>&nbsp;</td>
		  			<td><i class="icon-pencil"></i>대전상대</td>
		  		</tr>
		  		<tr>
		  			<td style="text-align:center;">
		  			<%if(cstCustMstList != null){%>
		  			<%int cnt = 0; %>
		  			<%for(CstCustMst cstCustMst : cstCustMstList){%>
		  				<%if(custNo == cstCustMst.getCustNo()){%>
		  			<button class="btn btn-mini btn-info" type="button" id="left_btn_<%=cnt++%>"><%=cstCustMst.getNickName()%></button>
		  				<%}%>
		  			<%}	// end for%>
		  			<%}	// end if%>
		  			</td>
		  			<td><i class="icon-chevron-down"></i></td>
		  			<td>
		  			<%if(cstCustMstList != null){%>
		  			<%int cnt = 0; %>
		  			<%for(CstCustMst cstCustMst : cstCustMstList){%>
		  				<%if(custNo != cstCustMst.getCustNo()){%>
		  			<button class="btn btn-mini" type="button" name="right_btn" id="right_btn_<%=cnt%>" custNo="<%=cstCustMst.getCustNo()%>" onClick="Game.newGameClick(<%=cnt%>)"><%=cstCustMst.getNickName()%></button>
		  				<%cnt++;%>
		  				<%}%>
		  			<%}	// end for%>
		  			<%}	// end if%>
		  			</td>
		  		</tr>
		  		</table>
		  	</div>
		  	<div class="modal-footer" id="modal_bottom">
		    	<button class="btn btn-primary" id="btn_create_game">생성</button>
		    	<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
		  	</div>
		</div>
		</form>
		<!-- //Modal -->
      	<br>
		<!-- //Body content-->
	</div>
	</center>

  </body>
</html>