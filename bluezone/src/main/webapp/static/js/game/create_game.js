var Game={
	ajaxCreateGame:function(){
		if(jQuery("#matchNo").val() == ""){
			alert("대회를 선택해주세요");
			return;
		}
		if(jQuery("#game_nm").val() == ""){
			alert("게임명을 입력해주세요");
			jQuery("#game_nm").focus();
			return false;
		}
		if(jQuery("#custNo2").val() == ""){
			alert("대전상대를 선택해주세요");
			return false;
		}
		
		var url = "/game/ajaxCreateGame.do";
		var params = new function(){
			this.matchNo = jQuery("#matchNo").val();
			this.gameNm = jQuery("#game_nm").val();
			this.inningCnt = jQuery("#sel_inning_cnt option:selected").val();
			this.memCnt = 2;
			this.custNo1 = jQuery("#custNo1").val();
			this.custNo2 = jQuery("#custNo2").val();
		};
		
		jQuery.ajax({      
	        type:"POST",
	        url:url,
	        data:params,
	        async:true,
	        timeout:3000,
	        beforeSend:function(data){
	        	jQuery("#modal_bottom").html("<span style='margin-right:240px;'><img src='/static/img/ajax-loader.gif'>");
	        },
	        success:function(data){
	        	Game.ajaxCreateGameRslt(data);
	        },   
	        error:function(e){  
	            alert(e.responseText);  
	        }
	    });
	},
	ajaxCreateGameRslt:function(data){
		if(data != undefined && data != null){
			if(data != "0"){
				location.href=location.pathname+"?matchNo="+jQuery("#matchNo").val()+"&gameNo="+data;
			}else{
				alert("생성실패.다시 생성해 주세요");
			}
		}
	},
	newGameClick:function(idx){
		jQuery("button[name=right_btn]").each(function(index){
			if(idx == index){
				jQuery("#right_btn_"+index).attr("class", "btn btn-mini btn-warning");
				jQuery("#custNo2").val(jQuery(this).attr("custNo"));
			}else{
				jQuery("#right_btn_"+index).attr("class", "btn btn-mini btn-success");
			}
		});
	},
	ajaxSearchMatchData:function(format){
		
		var url = "/match/ajaxSearchMatchList.do";
		var params = "format="+format;
		
		jQuery.ajax({      
	        type:"GET",
	        url:url,
	        data:params,
	        async:true,
	        timeout:3000,
	        success:function(data){
	        	Game.ajaxMatchDataRslt(data);
	        },   
	        error:function(e){  
	            alert(e.responseText);  
	        }  
	    });
	},
	ajaxMatchDataRslt:function(data){
		var matchHtml = "";
		matchHtml += "<div class=\"bs-docs-example\"><div class=\"dropdown clearfix\">";
		matchHtml += "<ul class=\"dropdown-menu\" role=\"menu\" aria-labelledby=\"dropdownMenu\" style=\"display: block; position: static; margin-bottom: 5px; width: 280px;\">";
		if(data != undefined && data != ""){
			/**
			var matchHtml = "<select multiple='multiple' id='sel_0' onChange='Game.ajaxSearchGameData(this.value)'>";
			for(var i=0;i<data.length;i++){
				matchHtml += "<option value='"+data[i].matchNo+"'>"+data[i].matchNm+"</option>";
			}
			matchHtml += "</select>";
			**/
            for(var i=0;i<data.length;i++){
            	matchHtml += " <li><a href=\"javascript:Game.ajaxSearchGameData('"+data[i].matchNo+"')\"><i class=\"icon-th-list\"></i>"+data[i].matchNm+"</a></li>";
            }
            matchHtml += " <li class=\"divider\"></li>";
		}
        matchHtml += "</ul>";
        matchHtml += "</div></div>";
        
        matchHtml += "<div class=\"bs-docs-example\"><div class=\"dropdown clearfix\">";
		matchHtml += "<ul class=\"dropdown-menu\" role=\"menu\" aria-labelledby=\"dropdownMenu\" style=\"display: block; position: static; margin-bottom: 5px; width: 280px;\">";
		matchHtml += "<li><a href=\"javascript:Game.ajaxSearchGameData('0')\"><i class=\"icon-tasks\"></i>상시경기참여</a></li>";
		matchHtml += "<li class=\"divider\"></li>";
		matchHtml += "</ul>";
        matchHtml += "</div></div>";
		jQuery("#span_td_0").html(matchHtml);
		jQuery("#span_td_1").html("");
		jQuery("#span_td_2").html("");
	},
	ajaxSearchGameData:function(matchNo){
		
		if(matchNo == "" || matchNo == "0"){
			Game.ajaxGameDataRslt("");
			return;
		}
		
		// Modal창에 setting
		jQuery("#matchNo").val(matchNo);
		
		var url = "/game/ajaxSearchGameList.do";
		var params = "matchNo="+matchNo;
		
		jQuery.ajax({      
	        type:"GET",
	        url:url,
	        data:params,
	        async:true,
	        timeout:3000,
	        success:function(data){
	        	Game.ajaxGameDataRslt(data);
	        },   
	        error:function(e){  
	            alert(e.responseText);  
	        }  
	    });
	},
	ajaxGameDataRslt:function(data){
		var gameHtml = "";
		gameHtml += "<div class=\"bs-docs-example\"><div class=\"dropdown clearfix\">";
		gameHtml += "<ul class=\"dropdown-menu\" role=\"menu\" aria-labelledby=\"dropdownMenu\" style=\"display: block; position: static; margin-bottom: 5px; width: 280px;\">";
		gameHtml += "<li style='margin:3px 0px 10px -5px;'><a href=\"#newGameModal\" role=\"button\" data-toggle=\"modal\"><button class=\"btn btn-inverse\" type=\"button\" style=\"width:250px;\"><i class=\"icon-plus icon-white\"></i>NEW게임만들기</button></a></li>";
		if(data != undefined && data != ""){
			for(var i=0;i<data.length;i++){
				var classNm = "";
				if(i%2 == 0)
					classNm = "btn btn-info";
				else if(i%2 == 1)
					classNm = "btn";
				
				if(data[i].gameNo == jQuery("#gameNo").val())
					classNm = "btn btn-danger";
				
				gameHtml += "<li style='margin:3px 0px 10px 15px;'><button class='"+classNm+"' type=\"button\" onClick=\"javascript:Game.ajaxSearchGameRecordData('"+data[i].gameNo+"')\" style=\"width:250px;\">"+data[i].gameNm+"</button></li>";
			}
		}
		gameHtml += "</ul>";
		gameHtml += "</div></div>";
		jQuery("#span_td_1").html(gameHtml);
		jQuery("#span_td_2").html("");
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
	        success:function(data){
	        	Game.ajaxGameRecordDataRslt(data);
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
				gameRecord += "<div class=\"bs-docs-example\"><div class=\"dropdown clearfix\">";
				gameRecord += "<ul class=\"dropdown-menu\" role=\"menu\" aria-labelledby=\"dropdownMenu\" style=\"display: block; position: static; margin-bottom: 5px; width: 280px; background:"+(i%2==0 ? "lemonchiffon":"lightblue")+";\">";
				gameRecord += "<table style='width:270px;'>";
				gameRecord += "<colgroup>";
				gameRecord += "<col width='60px' />";
				gameRecord += "<col width='10px' />";
				gameRecord += "<col width='*' />";
				gameRecord += "</colgroup>";
				gameRecord += "<tr><td style='text-align:right;'>닉네임</td><td>&nbsp;</td><td><button class='btn btn-mini btn-"+(i%2==0 ? "warning":"info")+"' type='button'>" +data[i].nickName+ "</button>";
				if(jQuery("#custNo1").val() == data[i].custNo){
					gameRecord += "<span style='margin:auto 10px'><button class='btn btn-mini' type='button' onClick='location.href=\"/inning/gameRecordInningForm.do?gameNo="+data[i].gameNo+"\"'><i class='icon-hand-right'></i>참여하기</button></span>";
				}
				gameRecord += "</td></tr>";
				gameRecord += "<tr class='warning'><td style='text-align:right;'>수     지 </td><td>&nbsp;</td><td><button class='btn btn-mini btn-"+(i%2==0 ? "warning":"info")+"' type='button'>" +GameUtil.getInt(data[i].custScore)+ "</button></td></tr>";
				gameRecord += "<tr><td style='text-align:right;'>평수지</td><td>&nbsp;</td><td><button class='btn btn-mini btn-"+(i%2==0 ? "warning":"info")+"' type='button'>" +GameUtil.getInt(data[i].custScoreAvg)+ "</button></td></tr>";
				gameRecord += "<tr class='warning'><td style='text-align:right;'>평타수</td><td>&nbsp;</td><td><button class='btn btn-mini btn-"+(i%2==0 ? "warning":"info")+"' type='button'>" +GameUtil.getInt(data[i].custAvg)+ "</button></td></tr>";
				gameRecord += "<tr><td style='text-align:right;'>하이런</td><td>&nbsp;</td><td><button class='btn btn-mini btn-"+(i%2==0 ? "warning":"info")+"' type='button'>" +GameUtil.getInt(data[i].custHighRun)+ "</button></td></tr>";
				gameRecord += "<tr class='warning'><td style='text-align:right;'>승     수</td><td>&nbsp;</td><td><button class='btn btn-mini btn-"+(i%2==0 ? "warning":"info")+"' type='button'>" +GameUtil.getInt(data[i].custWinCnt)+ "</button>승&nbsp;";
				gameRecord += "<button class='btn btn-mini btn-"+(i%2==0 ? "warning":"info")+"' type='button'>" +GameUtil.getInt(data[i].custLoseCnt)+ "</button>패&nbsp;";
				gameRecord += "<button class='btn btn-mini btn-"+(i%2==0 ? "warning":"info")+"' type='button'>" +GameUtil.getInt(data[i].custDrawCnt)+ "</button>무</td></tr>";
				gameRecord += "</table>";
				gameRecord += "</ul>";
				gameRecord += "</div></div>";
			}
			jQuery("#span_td_2").html(gameRecord);
		}else{
			jQuery("#span_td_2").empty();
			jQuery("#span_td_2").html("");
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
	if(jQuery("#matchNo").val() != ""){
		Game.ajaxSearchGameData(jQuery("#matchNo").val());
		if(jQuery("#gameNo").val() != ""){
			Game.ajaxSearchGameRecordData(jQuery("#gameNo").val());
		}
	}
	jQuery("#btn_create_game").click(function(){
		Game.ajaxCreateGame();
	});
});
