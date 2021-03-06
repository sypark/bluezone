var Login={
	login:function(){
		if(Login.validLoginForm() == true){
			Login.ajaxLogin();
		}else{
			return;
		}
	},
	validLoginForm:function(){
		if(jQuery("#top_email").val() == ""){
			alert("이메일 주소를 입력해 주세요");
			jQuery("#top_email").focus();
			return false;
		}else if(Login.availEmailChk() == false){
			return false;
		}else if(jQuery("#top_passwd").val() == ""){
			alert("비밀번호를 입력해 주세요");
			jQuery("#top_passwd").focus();
			return false;
		}else{
			return true;
		}
	},
	availEmailChk:function(){
		var email = jQuery("#top_email").val();
		var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;   
		  
		if(regex.test(email) === false) {
			var h = " <span class='btn btn-danger' style='margin:0 0 +10px 0;'>삐익!</span>";
			jQuery("#login_email_txt").html(h);
		    return false; 
		}else{
			return true;
		}  
	},
	ajaxLogin:function(){
		var email = jQuery("#top_email").val();
		var passwd = jQuery("#top_passwd").val();
		
		var url = "/cust/ajaxLoginProcess.do";
		var params = "email="+email+"&passwd="+passwd;
		
		jQuery.ajax({      
	        type:"POST",
	        url:url,
	        data:params,
	        async:true,
	        timeout:3000,
	        success:function(data){
	        	Login.ajaxLoginRslt(data);
	        },   
	        error:function(e){  
	            alert(e.responseText);  
	        }  
	    });
	},
	ajaxLoginRslt:function(data){
		if(data != undefined && data != ""){
			if(data == "1"){
				location.href="/main.do";
			}else{
				alert("회원정보가 없습니다.");
			}
		}
	},
	ajaxCustInfo:function(){
		var url = "/cust/ajaxCustInfo.do";
		jQuery.ajax({      
	        type:"GET",
	        url:url,
	        async:true,
	        timeout:3000,
	        success:function(data){
	        	if(data != undefined && data != null){
	        		jQuery("#top_nick_name").text(data.nickName);
	        		if(data.custSex == "F"){
	        			jQuery("#navbar").css("background-color","#f34541");
	        		}
	        	}
	        },   
	        error:function(e){  
	            alert(e.responseText);  
	        }  
	    });
	}
};
jQuery(document).ready(function(){
	Login.ajaxCustInfo();
	jQuery("#top_email").click(function(){
		jQuery("#login_email_txt").text("");
	});
	jQuery("#top_email").blur(function(){
		Login.availEmailChk();
	});
	jQuery("#click_game_record").click(function(){
		location.href="/cust/gameRecordList.do";
	});
	jQuery("#click_create_game").click(function(){
		location.href="/game/createGame.do";
	});
});