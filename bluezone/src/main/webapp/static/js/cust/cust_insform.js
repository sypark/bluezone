jQuery(document).ready(function(){
	// 고객의 수지점수 입력란 표시.
	Cust.showCustScoreInput();
	jQuery("#custNm").focus();
	
	jQuery("#nickName").blur(function(){
		Cust.nickNameDupChk();
	});
	jQuery("#nickName").click(function(){
		Cust.composeNickName("", "N");
	});
	jQuery("#email").blur(function(){
		Cust.emailDupChk();
	});
	jQuery("#email").click(function(){
		Cust.composeEmail(" (Log-In시 ID로 사용)", "N");
	});
	jQuery("#passwd_confirm").blur(function(){
		Cust.passwdDupChk();
	});
	jQuery("#passwd_confirm").click(function(){
		Cust.composePasswd("", "N");
	});
	
//	jQuery("#score_sel").change(function() {
//        jQuery("#score").val(jQuery(this).val());
//	});
});
var Cust={
	custRegister:function(){
		if(jQuery("#custNm").val() == ""){
			alert("성명을 입력해 주세요.");
			jQuery("#custNm").focus();
			return;
		}else if(jQuery("#nickName").val() == ""){
			alert("닉네임을 입력해 주세요.");
			jQuery("#nickName").focus();
			return;
		}else if(jQuery("#email").val() == ""){
			alert("이메일을 입력해 주세요.");
			jQuery("#email").focus();
			return;
		}else if(jQuery("#passwd").val() == ""){
			alert("비밀번호를 입력해 주세요.");
			jQuery("#passwd").focus();
			return;
		}else if(jQuery("#passwd_confirm").val() == ""){
			alert("비밀번호 확인을 입력해 주세요.");
			jQuery("#passwd_confirm").focus();
			return;
		}else if(jQuery("#nickname_dup_chk").val() != "Y"){
			alert("닉네임이 중복됩니다.");
			jQuery("#nickName").focus();
			return;
		}else if(jQuery("#email_dup_chk").val() != "Y"){
			alert("이메일이 중복됩니다.");
			jQuery("#email").focus();
			return;
		}else if(jQuery("#passwd_dup_chk").val() != "Y"){
			alert("비밀번호가 일치하지 않습니다.");
			jQuery("#passwd").focus();
			return;
		}else{
			Cust.ajaxCustInsert();
		}
	},
	ajaxCustInsert:function(){
		var url = "/cust/ajaxInsert.do";
		var params = jQuery("form").serialize();
		
		jQuery.ajax({      
	        type:"POST",
	        url:url,
	        data:params,
	        async:true,
	        timeout:3000,
	        success:function(data){
	        	Cust.ajaxCustInsertRslt(data);
	        },   
	        error:function(e){  
	            alert(e.responseText);  
	        }  
	    });
	},
	ajaxCustInsertRslt:function(data){
		if(data != undefined && data != ""){
			if(data > 0){
				location.href="/cust/confirmRegister.do?custNo="+data;
			}else{
				alert("회원가입시 오류가 발생하였습니다.\n관리자에게 문의바랍니다.");
			}
		}
	},
	nickNameDupChk:function(){
		if(jQuery("#nickName").val() != ''){
			var url = "/cust/ajaxDupChkNickName.do";
			var params = "nickName="+jQuery("#nickName").val();
			
			jQuery.ajax({      
		        type:"POST",
		        url:url,
		        data:params,
		        async:true,
		        timeout:3000,
		        success:function(data){
		        	Cust.ajaxNickNameDupRslt(data);
		        },   
		        error:function(e){  
		            alert(e.responseText);  
		        }  
		    });
		}
	},
	ajaxNickNameDupRslt:function(data){
		if(data != undefined && data != ""){
			if(data == "1"){
				Cust.composeNickName(" [사용가능합니다.]", "Y");
			}else{
				Cust.composeNickName(" [닉네임이 존재합니다.]", "N");
			}
		}
	},
	emailDupChk:function(){
		if(jQuery("#nickName").val() != '' && Cust.availEmailChk() == true){
			var url = "/cust/ajaxDupChkEmail.do";
			var params = "email="+jQuery("#email").val();
			
			$.ajax({      
		        type:"POST",
		        url:url,
		        data:params,
		        async:true,
		        timeout:3000,
		        success:function(data){
		        	Cust.ajaxEmailDupRslt(data);
		        },   
		        error:function(e){  
		            alert(e.responseText);  
		        }  
		    });
		}
	},
	availEmailChk:function(){
		var email = jQuery("#email").val();
		var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;   
		  
		if(regex.test(email) === false) {
			Cust.composeEmail(" [잘못된 이메일 형식입니다.]", "N");
		    return false;  
		}else{
			return true;
		}  
	},
	ajaxEmailDupRslt:function(data){
		if(data != undefined && data != ""){
			if(data == "1"){
				Cust.composeEmail(" [사용가능합니다.]", "Y");
			}else{
				Cust.composeEmail(" [이메일이 존재합니다.]", "N");
			}
		}
	},
	composeNickName:function(msg, chkVal){
		jQuery("#nickname_txt").text(msg);
		jQuery("#nickname_dup_chk").val(chkVal);
	},
	composeEmail:function(msg, chkVal){
		jQuery("#email_txt").text(msg);
		jQuery("#email_dup_chk").val(chkVal);
	},
	composePasswd:function(msg, chkVal){
		jQuery("#passwd_txt").text(msg);
		jQuery("#passwd_dup_chk").val(chkVal);
	},
	passwdDupChk:function(){
		var passwd1 = jQuery("#passwd").val();
		var passwd2 = jQuery("#passwd_confirm").val();
		if(passwd1 != "" && passwd2 != ""){
			if(passwd1 == passwd2){
				Cust.composePasswd(" [비밀번호가 일치합니다.]", "Y");
			}else{
				Cust.composePasswd(" [비밀번호가 일치하지 않습니다.]", "N");
			}
		}
	},
	showCustScoreInput:function(){
		var scoreHtml="<select id='score' name='score'>";
		for(var i=10; i< 41; i++){
			scoreHtml+= "<option value='"+i+"'>"+i+"</option>";
		}
		scoreHtml+= "</select>";
		jQuery("#score_txt").html(scoreHtml);
	}
};