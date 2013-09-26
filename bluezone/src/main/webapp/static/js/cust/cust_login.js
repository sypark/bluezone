var Login={
	login:function(){
		if(Login.validLoginForm() == true){
			Login.ajaxLogin();
		}else{
			return;
		}
	},
	validLoginForm:function(){
		if(jQuery("#email").val() == ""){
			alert("이메일 주소를 입력해 주세요");
			jQuery("#email").focus();
			return false;
		}else if(Login.availEmailChk() == false){
			return false;
		}else if(jQuery("#passwd").val() == ""){
			alert("비밀번호를 입력해 주세요");
			jQuery("#passwd").focus();
			return false;
		}else{
			return true;
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
	ajaxLogin:function(){
		var email = jQuery("#email").val();
		var passwd = jQuery("#passwd").val();
		
		var url = "/cust/ajaxLoginProcess.do";
		var params = "email="+email+"&passwd="+passwd;
		
		jQuery.ajax({      
	        type:"POST",
	        url:url,
	        data:params,
	        async:true,
	        timeout:3000,
	        success:function(args){
	        	Login.ajaxLoginRslt(args);
	        },   
	        error:function(e){  
	            alert(e.responseText);  
	        }  
	    });
	},
	ajaxLoginRslt:function(data){
		alert(data);
		if(data != undefined && data != ""){
			if(data == "1"){
				location.href="/main.do";
			}else{
				alert("회원정보가 없습니다.");
			}
		}
	}
};