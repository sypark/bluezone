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
    <title>Bootstrap 101 Template</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Bootstrap -->
	<link href="/static/css/bootstrap.min.css" rel="stylesheet" media="screen">
  </head>

  <body>
    <h1>Hello, world!</h1>
	<script src="/static/js/jquery-1.10.2.min.js"></script>
	<script src="/static/js/bootstrap.min.js"></script>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span2">
			<!--Sidebar content-->
			<i class="icon-tasks"></i> 경기기록
			<!-- //Sidebar content-->
			</div>
			<div class="span10">
			<!--Body content-->
				<p class="row-fluid">
					<button class="btn btn-mini btn-primary" type="button" onClick="Record.getMonthList('201309')">2013년 09월</button>
					<button class="btn btn-mini btn-primary" type="button" onClick="Record.getMonthList('201310')">2013년 10월</button>
				</p>
				<p>
					<span id="record_week" style="display:none"></span>
				</p>
				<p>
					<span id="record_person" style="display:none"></span>
				</p>
				<p><span id="record_info1"></span></p>
				<p><span id="record_info2"></span></p>
				<p><span id="record_info3"></span></p>
			<!-- //Body content-->
			</div>
		</div>
	</div>
  </body>
</html>

<script language="javascript">
jQuery(document).ready(function(){
	Record.getMonthList('201310');
});
var Record={
	getMonthList:function(month){
		if(jQuery("#record_week").css("display") != "none"){
			jQuery("#record_week").hide();
			jQuery("#record_person").hide();
		}else{
			var dispCode="";
			for(var i=0; i < 5; i++){
				dispCode+= "<button class=\"btn btn-mini\" type=\"button\" onClick=\"Record.getPersonList('"+month+"', '"+(i+1)+"')\">"+(i+1)+"주</button>&nbsp";
			}
			jQuery("#record_week").html(dispCode);
			jQuery("#record_week").show();
		}
	},
	getPersonList:function(month, week){
		var dispCode = "<button class=\"btn btn-mini btn-info\" type=\"button\" onClick=\"Record.showRecordData('"+month+"', '"+week+"', 'game_id')\">박찬희 vs 박준희</button>";
		jQuery("#record_person").html(dispCode);
		jQuery("#record_person").show();
	},
	showRecordData:function(month, week, game_id){
		Record.showRecordData1(month, week);
		Record.showRecordData2(game_id);
		Record.showRecordData3();
	},
	showRecordData1:function(month, week){
		var recordData = "<i class=\"icon-tasks\"></i> " + month + "월 " + week + "주 경기기록 <br>"
		jQuery("#record_info1").html(recordData);
	},
	showRecordData2:function(game_id){
		var personData = Record.getAjaxRecordPersonData(game_id);
		jQuery("#record_info2").html(personData);
	},
	getAjaxRecordPersonData:function(game_id){
		var data = "getAjaxRecordPersonData " + game_id + "<br>";
		var dTable = "<table class=\"table table-striped\">";
		dTable += "		<thead>";
		dTable += "			<tr>";
		dTable += "				<th width=\"10%\">대진</th>";
		dTable += "				<th width=\"45%\">박찬희(white)</th>";
		dTable += "				<th width=\"45%\">박준희(yellow)</th>";
		dTable += "			</tr>";
		dTable += "		</thead>";
		dTable += "		<tbody>";
		dTable += "			<tr class=\"info\">";
		dTable += "				<td>수지</td>";
		dTable += "				<td align=center>24점</td>";
		dTable += "				<td align=center>23점</td>";
		dTable += "			</tr>";
		dTable += "			<tr>";
		dTable += "				<td>평균Avg</td>";
		dTable += "				<td align=center>1.57</td>";
		dTable += "				<td align=center>2,43</td>";
		dTable += "			</tr>";
		dTable += "			<tr>";
		dTable += "				<td>득점</td>";
		dTable += "				<td align=center>22점</td>";
		dTable += "				<td align=center>23점</td>";
		dTable += "			</tr>";
		dTable += "			<tr>";
		dTable += "				<td>최대</td>";
		dTable += "				<td align=center>8점</td>";
		dTable += "				<td align=center>12점</td>";
		dTable += "			</tr>";
		dTable += "		</tbody>";
		dTable += "</table>";

		return data + dTable;
	},
	showRecordData3:function(game_id){
		var inningData = Record.getAjaxRecordInningData(game_id);
		jQuery("#record_info3").html(inningData);
	},
	getAjaxRecordInningData:function(game_id){
		var dTable = "<table class=\"table table-bordered\">";
		dTable += "		<thead>";
		dTable += "			<tr>";
		dTable += "				<th width=\"10%\">이닝</th>";
		dTable += "				<th width=\"10%\">점수</th>";
		dTable += "				<th width=\"10%\">이닝</th>";
		dTable += "				<th width=\"10%\">점수</th>";
		dTable += "				<th width=\"1%\"></th>";
		dTable += "				<th width=\"10%\" style=\"back-ground:yellow\">이닝</th>";
		dTable += "				<th width=\"10%\">점수</th>";
		dTable += "				<th width=\"10%\">이닝</th>";
		dTable += "				<th width=\"10%\">점수</th>";
		dTable += "			</tr>";
		dTable += "		</thead>";
		dTable += "		<tbody>";
		dTable += "			<tr class=\"info\">";
		dTable += "				<td>1이닝</td>";
		dTable += "				<td>1점</td>";
		dTable += "				<td>21이닝</td>";
		dTable += "				<td>3점</td>";
		dTable += "				<td class=\"\"></td>";
		dTable += "				<td>1이닝</td>";
		dTable += "				<td>1점</td>";
		dTable += "				<td>21이닝</td>";
		dTable += "				<td>3점</td>";
		dTable += "			</tr>";
		dTable += "		</tbody>";
		dTable += "</table>";
		return dTable;
	}
};

</script>