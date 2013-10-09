var InningRecord={
	inningCnt:0,
	isComplete:false,
	sumEarnScore:function(num, inningNum){
		var earnScore=0;
		jQuery("input[name=inning_"+num+"]").each(function(index){
			if(index < inningNum){
				if(jQuery(this).val() != undefined && jQuery(this).val() != null && jQuery(this).val() != ""){
					earnScore += parseInt(jQuery(this).val());
				}
			}
		});
		return earnScore;
	},
	sumTotalInning:function(num){
		var sum=InningRecord.sumEarnScore(num, InningRecord.inningCnt);
		if(jQuery("#score"+num).val() < sum){
			sum = jQuery("#score"+num).val();
		}
		return sum;
	},
	countInning:function(num){
		var sum=0;
		var cnt=0;
		for(var i=1 ; i<=InningRecord.inningCnt ; i++){
			value = jQuery("#inning_"+num+"_"+i).val();
			
			if(value != undefined && value != null && value != ""){
				sum += parseInt(value);
			}
			if(sum >= parseInt(jQuery("#score"+num).val())){
				cnt=i;
				
				//초과한 만큼 현재 이닝 차감.
				jQuery("#inning_"+num+"_"+i).val(value-(sum-parseInt(jQuery("#score"+num).val())));
				// 나머지 이닝 초기화.
				for(var j=i+1 ; j<=InningRecord.inningCnt ; j++){
					jQuery("#inning_"+num+"_"+j).val("");
				}
				break;
			}
		}
		return (cnt == 0 ? InningRecord.inningCnt:cnt);
	},
	getHighRun:function(num){
		var highRun = 0;
		for(var i=1 ; i<=InningRecord.inningCnt ; i++){
			value = jQuery("#inning_"+num+"_"+i).val();
			if(value != undefined && value != null && value != ""){
				if(highRun < parseInt(value)){
					highRun = parseInt(value);
				}
			}
		}
		return highRun;
	},
	getTotalAvg:function(num){
		var avg = InningRecord.sumTotalInning(num)/InningRecord.countInning(num);
		
		return avg.toFixed(2);		
	},
	elementAttrSet:function(attr, val, numArr){
		for(var i=0;i<numArr.length;i++){
			jQuery("input[name=inning_"+numArr[i]+"]").each(function(index){
				if(index <= InningRecord.inningCnt){
					jQuery("#inning_"+numArr[i]+"_"+(index+1)).attr(attr, val);
				}
			});
		}
	},
	ajaxCreateGameInning:function(num, inningNum){
		var inningScore = jQuery("#inning_"+num+"_"+inningNum).val();
		if(isNaN(inningScore) == true || inningScore == undefined || inningScore == ""){
			inningScore = 0;
		}
		var url = "/inning/ajaxCreateGameInning.do";
		var params= new function(){
			this.gameRecNo = jQuery("#gameRecNo"+num).val();
			this.inningNum = inningNum;
			this.earnScore = inningScore;
		};
		
		jQuery.ajax({      
	        type:"POST",
	        url:url,
	        data:params,
	        async:true,
	        timeout:3000,
	        success:function(data){
	        	if(data != "1"){
	        		alert("데이터 저장시 오류 발생.\n다시 입력해주세요.");
	        		jQuery("#inning_"+num+"_"+inningNum).focus();
	        	}
	        },   
	        error:function(e){  
	            alert(e.responseText);  
	        },
	        complete:function(){
	        	var numArr = new Array();
	        	// 상대편 점수 refresh
	        	numArr[0] = (num == "0" ? "1":"0");
	        	InningRecord.showGameInningData(numArr);
	        }
	    });
	},
	showGameInningData:function(numArr){
		for(var i=0 ; i < numArr.length ; i++){
			InningRecord.ajaxGetGameInningData(numArr[i]);
		}
	},
	ajaxGetGameInningData:function(num){
		
		var url = "/inning/ajaxGetGameInningData.do";
		var params= new function(){
			this.gameRecNo = jQuery("#gameRecNo"+num).val();
		};
		
		jQuery.ajax({      
	        type:"POST",
	        url:url,
	        data:params,
	        async:true,
	        timeout:3000,
	        success:function(data){
	        	InningRecord.ajaxGetGameInningDataRslt(data, num);
	        },   
	        error:function(e){  
	            alert(e.responseText);  
	        },
	        complete:function(){
	        	InningRecord.genAllScore();
	        }
	    });
	},
	ajaxGetGameInningDataRslt:function(data, num){
		if(data != undefined && data != null && data != ""){
			for(var i=0 ; i < data.length ; i++){
				jQuery("#inning_"+num+"_"+data[i].inningNum).val(data[i].earnScore);
			}
		}
	},
	genAllScore:function(){
		for(var i=0;i<2;i++){
			jQuery("#total_score_"+i).val(InningRecord.sumTotalInning(i));
			jQuery("#total_high_run_"+i).val(InningRecord.getHighRun(i));
			jQuery("#total_inning_"+i).val(InningRecord.countInning(i));
			jQuery("#total_avg_"+i).val(InningRecord.getTotalAvg(i));
		}
	},
	initiate:function(){
		var numArr = new Array();
		numArr[0] = "0";
		numArr[1] = "1";
		InningRecord.showGameInningData(numArr);
	},
	ajaxSendInningData:function(){
		var url = "/inning/ajaxSendInningData.do";
		var params = new function(){
			this.gameRecNo = jQuery("#gameRecNo0").val();
			this.gameResult = jQuery("#gameResult0").val();
		};
		
		jQuery.ajax({      
	        type:"POST",
	        url:url,
	        data:params,
	        async:true,
	        timeout:3000,
	        beforeSend:function(data){
	        	jQuery("#sendDataModal").modal("show");
	        },
	        success:function(data){
	        	if(data != undefined && data != null){
	        		if(data == "1"){
	        			location.href="/main.do";
	        		}else{
	        			alert("데이터 입력이 실패하였습니다.\n다시 시도하여 주십시오.");
	        			jQuery("#sendDataModal").modal("hide");
	        			return;
	        		}
	        	}
	        },   
	        error:function(e){  
	            alert(e.responseText);  
	        }
	    });
	},
	ajaxDeleteGame:function(){

		var url = "/game/ajaxDeleteGame.do";
		var params= new function(){
			this.gameNo = jQuery("#gameNo").val();
		};
		
		jQuery.ajax({      
	        type:"GET",
	        url:url,
	        data:params,
	        async:true,
	        timeout:3000,
	        success:function(data){
	        	if(data == "1"){
	        		location.href="/main.do";
	        	}else{
	        		alert("데이터 저장시 오류 발생.\n다시 삭제해주세요.");
	        	}
	        },   
	        error:function(e){  
	            alert(e.responseText);  
	        },
	        complete:function(){
	        }
	    });
	}
};

jQuery(document).ready(function(){
	InningRecord.inningCnt = parseInt(jQuery("#inningCnt").val());
	for(var i=0;i<2;i++){
		var cnt=1;
		jQuery("input[name=inning_"+i+"]").each(function(){
			if(cnt > InningRecord.inningCnt){
				jQuery("#inning_"+i+"_"+cnt).attr("readonly", true);
			}
			cnt++;
		});
	}
	jQuery("input[name=inning_0]").blur(function(){
		if(isNaN(jQuery(this).val()) == true){
			alert("숫자만 입력가능합니다.");
			jQuery(this).val("");
			return;
		}
		
		InningRecord.genAllScore();
		
		// DB 기록
		var elementId = this.id;
		var inningNum = elementId.substring(elementId.lastIndexOf("_")+1);
		InningRecord.ajaxCreateGameInning("0", inningNum);
		
		if(jQuery("#score0").val() == jQuery("#total_score_0").val()){
			alert(jQuery("#score0").val() + "점을 득점하셨습니다.");
		}
		
	});
	jQuery("input[name=inning_1]").blur(function(){
		InningRecord.genAllScore();
	});
	jQuery("#btn_complete").click(function(){
		var totalInningSel = false;
		for(var i=0;i<2;i++){
			jQuery("#total_score_"+i).val(InningRecord.sumTotalInning(i));
			jQuery("#total_high_run_"+i).val(InningRecord.getHighRun(i));
			//jQuery("#total_inning_"+i).val(InningRecord.countInning(i));
			jQuery("#total_avg_"+i).val(InningRecord.getTotalAvg(i));
			
			if(totalInningSel == false && InningRecord.sumTotalInning(i) == parseInt(jQuery("#score"+i).val())){
				jQuery("#total_inning_0").val(InningRecord.countInning(i));
				jQuery("#total_inning_1").val(InningRecord.countInning(i));
				totalInningSel = true;
			}
		}
		
		var disabled = false;
		if(InningRecord.isComplete == false){
			InningRecord.isComplete = true;
			disabled = true;
			jQuery("#font_complete").text("다시 입력");
		}else{
			InningRecord.isComplete = false;
			disabled = false;
			jQuery("#font_complete").text("Complete");
		}
		
		for(var i=0;i<2;i++){
			jQuery("input[name=inning_"+i+"]").each(function(index){
				if(index <= InningRecord.inningCnt){
					jQuery("#inning_"+i+"_"+index).attr("readonly", disabled);
				}
			});
		}
		
		if(InningRecord.isComplete == true){
			if(parseInt(jQuery("#score0").val()) == parseInt(jQuery("#total_score_0").val())){
				jQuery("#cust_result_0").html("<button class='btn btn-large btn-danger' type='button'><h3>Win!!</h3></button>");
				jQuery("#gameResult0").val("win");
				jQuery("#cust_result_1").html("");
				jQuery("#gameResult1").val("lose");
			}else if(parseInt(jQuery("#score1").val()) == parseInt(jQuery("#total_score_1").val())){
				jQuery("#cust_result_0").html("");
				jQuery("#gameResult0").val("lose");
				jQuery("#cust_result_1").html("<button class='btn btn-large btn-danger' type='button'><h4>Win!!</h4></button>");
				jQuery("#gameResult1").val("win");
			}else{
				//alert("총 득점이 참가자분들의 점수와 불일치합니다.");
				jQuery("#cust_result_0").html("<button class='btn' type='button'><h4>무승부</h4></button>");
				jQuery("#gameResult0").val("draw");
				jQuery("#cust_result_1").html("<button class='btn' type='button'><h4>무승부</h4></button>");
				jQuery("#gameResult1").val("draw");
			}
			jQuery("#gameResultModal").modal("show");
		}
	});
	jQuery("#btn_send_data").click(function(){
		if(InningRecord.isComplete == false){
			alert("Complete 버튼을 눌러서 경기를 종료해 주세요.");
			return;
		}
		if(parseInt(jQuery("#score0").val()) != jQuery("#total_score_0").val() && parseInt(jQuery("#score1").val()) != jQuery("#total_score_1").val()){
			if(confirm("총 득점이 참가자분들의 점수와 불일치합니다.\n그래도 전송하시겠습니까?")){
				InningRecord.ajaxSendInningData();
			}
		}else{
			InningRecord.ajaxSendInningData();
		}
	});
	jQuery("#btn_delete_game").click(function(){
		if(confirm("게임을 삭제하시겠습니까?")){
			InningRecord.ajaxDeleteGame();
		}
	});
	// 게임참여자일 경우 본인의 게임만 editable
	// 그외에는 모두 readonly
	if(jQuery("#cookieCustNo").val() == jQuery("#custNo0").val()){
		var numArr = new Array();
		numArr[0] = "1";
		InningRecord.elementAttrSet("readonly", true, numArr);
	}else{
		var numArr = new Array();
		numArr[0] = "0";
		numArr[1] = "1";
		InningRecord.elementAttrSet("readonly", true, numArr);
	}
	// 처음 로딩시 데이터 setting
	InningRecord.initiate();
	
});