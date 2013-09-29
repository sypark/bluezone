<!DOCTYPE HTML>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bluezone.bil.util.StringUtils" %>
<%@page import="com.bluezone.bil.domain.cust.CstCustMst" %>
<%@page import="com.bluezone.bil.domain.cust.CstCustRecordMst" %>
<%
	CstCustRecordMst cstCustRecordMst = (CstCustRecordMst)request.getAttribute("cstCustRecordMst");
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
</head>

  <body>
	<div class="container">
		<!-- Body content-->
		<jsp:include page="/WEB-INF/view/common/top_navi.jsp"></jsp:include>
		
		<div class="row-fluid">
        <div class="span12">
        	<table class="table table-hover">
        	<tr>
        		<th colspan="3">경기를 선택해 주세요</th>
        	</tr>
			</table>
			<div class="row-fluid">
				<div class="span4"><span id="span_td_0"></span></div>
				<div class="span4"><span id="span_td_1"></span></div>
				<div class="span4">
					<span id="span_td_2">
						
					</span>
				</div>
			</div>
        </div>
      </div>
		<!-- //Body content-->
	</div>
	</center>

<script>

var Game={
	ajaxSearchMatchData:function(format){
		
		var url = "/match/ajaxSearchMatchList.do";
		var params = "format="+format;
		
		jQuery.ajax({      
	        type:"GET",
	        url:url,
	        data:params,
	        async:true,
	        timeout:3000,
	        success:function(args){
	        	Game.ajaxMatchDataRslt(args);
	        },   
	        error:function(e){  
	            alert(e.responseText);  
	        }  
	    });
	},
	ajaxMatchDataRslt:function(data){
		if(data != undefined && data != ""){
			/**
			var matchHtml = "<select multiple='multiple' id='sel_0' onChange='Game.ajaxSearchGameData(this.value)'>";
			for(var i=0;i<data.length;i++){
				matchHtml += "<option value='"+data[i].matchNo+"'>"+data[i].matchNm+"</option>";
			}
			matchHtml += "</select>";
			**/
			var matchHtml = "<div class=\"well\" style=\"max-width: 340px; width:200px; padding: 8px 0;\">";
			matchHtml += "<ul class=\"nav nav-list\">";
            for(var i=0;i<data.length;i++){
            	matchHtml += " <li><a href=\"javascript:Game.ajaxSearchGameData('"+data[i].matchNo+"')\">"+data[i].matchNm+"</a></li>";
            }
            matchHtml += " <li class=\"divider\"></li>";
            matchHtml += " <li><a href=\"javascript:Game.ajaxSearchGameData('')\">상시경기참여</a></li>";
            matchHtml += "</ul>";
            matchHtml += "</div>";
            
			jQuery("#span_td_0").html(matchHtml);
		}
	},
	ajaxSearchGameData:function(matchNo){
		
		if(matchNo == ""){
			Game.ajaxGameDataRslt("");
			return;
		}
		
		var url = "/game/ajaxSearchGameList.do";
		var params = "matchNo="+matchNo;
		
		jQuery.ajax({      
	        type:"GET",
	        url:url,
	        data:params,
	        async:true,
	        timeout:3000,
	        success:function(args){
	        	Game.ajaxGameDataRslt(args);
	        },   
	        error:function(e){  
	            alert(e.responseText);  
	        }  
	    });
	},
	ajaxGameDataRslt:function(data){
		if(data != undefined && data != ""){
			var gameHtml = "";
			for(var i=0;i<data.length;i++){
				var classNm = "";
				if(i%2 == 0)
					classNm = "btn btn-info";
				else if(i%2 == 1)
					classNm = "btn";
				gameHtml += "<p><button class='"+classNm+"' type=\"button\" onClick=\"javascript:Game.ajaxSearchGameRecordData('"+data[i].gameNo+"')\" style=\"width:200px;\">"+data[i].gameNm+"</button></p>";
			}
			gameHtml += "<p><button class=\"btn btn-inverse\" type=\"button\" style=\"width:200px;\"><i class=\"icon-plus icon-white\"></i>NEW게임만들기</button></p>";
			jQuery("#span_td_1").html(gameHtml);
		}
	},
	ajaxSearchGameRecordData:function(gameNo){
		var url = "/game/ajaxSearchGameRecordList.do";
		var params = "gameNo="+gameNo;
		
		jQuery.ajax({      
	        type:"GET",
	        url:url,
	        data:params,
	        async:true,
	        timeout:3000,
	        success:function(args){
	        	Game.ajaxGameRecordDataRslt(args);
	        },   
	        error:function(e){  
	            alert(e.responseText);  
	        }
	    });
	},
	ajaxGameRecordDataRslt:function(data){
		if(data != undefined && data != ""){
			var gameRecord = "";
			for(var i=0;i<data.length;i++){
				gameRecord += "<div class=\"bs-docs-example\">";
				gameRecord += "<div class=\"dropdown clearfix\">";
				gameRecord += "<ul class=\"dropdown-menu\" role=\"menu\" aria-labelledby=\"dropdownMenu\" style=\"display: block; position: static; margin-bottom: 5px; *width: 180px;\">";
				gameRecord += "<li>&nbsp;" +data[i].nickName+ "</li>";
				gameRecord += "<li>&nbsp;" +GameUtil.getInt(data[i].custScore)+ "</li>";
				gameRecord += "<li>&nbsp;" +GameUtil.getInt(data[i].custScoreAvg)+ "</li>";
				gameRecord += "<li>&nbsp;" +GameUtil.getInt(data[i].custAvg)+ "</li>";
				gameRecord += "<li>&nbsp;" +GameUtil.getInt(data[i].custHighRun)+ "</li>";
				gameRecord += "<li>&nbsp;" +GameUtil.getInt(data[i].custWinCnt)+ "</li>";
				gameRecord += "<li>&nbsp;" +GameUtil.getInt(data[i].custLoseCnt)+ "</li>";
				gameRecord += "<li>&nbsp;" +GameUtil.getInt(data[i].custDrawCnt)+ "</li>";
				gameRecord += "</ul>";
				gameRecord += "</div>";
				gameRecord += "</div>";
			}
			jQuery("#span_td_2").html(gameRecord);
		}
	}
};
var GameUtil={
	getStr:function(str){
		if(str == null)
			return "";
		else
			return str;
	},
	getInt:function(str){
		if(str == null)
			return 0;
		else
			return str;
	}
};
jQuery(document).ready(function(){
	Game.ajaxSearchMatchData("yyyyMMdd");
});
</script>	
	
  </body>
</html>