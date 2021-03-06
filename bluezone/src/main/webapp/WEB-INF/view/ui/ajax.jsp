<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><jsp:include page="/WEB-INF/view/ui/common/header.jsp" />
<!-- // Header -->
<body>
<!-- Navi -->
<jsp:include page="/WEB-INF/view/ui/common/navi.jsp" >
	<jsp:param name="nav_name" value="Ajax" />
</jsp:include>
<!-- // Navi -->
<!--=== Content Part ===-->
<div class="container">
	<div class="row">
		<!--Begin Sidebar Menu-->
        <div class="col-md-3">
        	<!-- Left -->
			<jsp:include page="/WEB-INF/view/ui/common/left.jsp" >
				<jsp:param name="left_name" value="Ajax" />
			</jsp:include>
			<!-- // Left -->
		</div>
		<div class="col-md-9">
			<!--Basic Ajax-->
			<div class="alert alert-info fade in">
                <button type="button" class="close" data-dismiss="alert">×</button>
                <strong>Ajax!</strong> Here is Default Ajax Execute.
            </div>
            <!-- Ajax Page Data Load(Case1)  -->
			<div class="headline"><h2>Ajax Page Data Load(Case1)</h2></div>
			<div class="margin-bottom-40"><span id="span_ajax_table">[Ajax Data Area1]</span></div>
			<!-- bs-example -->
			<div class="bs-example">
				<button type="button" class="btn btn-info btn-sm" id="btn_ajax_table">Ajax데이터가져오기</button>
				<button type="button" class="btn btn-primary btn-sm" id="btn_ajax_show">Ajax데이터펼쳐보기</button></div>
			<div class="highlight" id="div_ajax_show" style="display:none;"><pre><code class="html">var AjaxClass={
ajaxTablePage:function(){
	var requestUrl = "/ui/tableLayer.do";
	
	$("#span_ajax_table").html("&lt;div&gt;&lt;/div&gt;&lt;div class=&quot;progress progress-striped active&quot;&gt;&lt;div class=&quot;progress-bar&quot;  role=&quot;progressbar&quot; aria-valuenow=&quot;45&quot; aria-valuemin=&quot;0&quot; aria-valuemax=&quot;100&quot; style=&quot;width:100%;&quot;&gt;&lt;span class=&quot;sr-only&quot;&gt;요청 중 입니다.&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;");
	$("#span_ajax_table").load(requestUrl);
}	
};</code></pre>
			</div>
			<!--End bs-example-->
			<!-- // Ajax Page Data Load(Case1)  -->
			<!-- Ajax Page Data Load(Case2)  -->
			<div class="headline"><h2>Ajax Page Data Load(Case2)</h2></div>
			<div class="margin-bottom-40"><span id="span_ajax_table2">[Ajax Data Area2]</span></div>
			<!-- bs-example -->
			<div class="bs-example">
				<button type="button" class="btn btn-info btn-sm" id="btn_ajax_table2">Ajax데이터가져오기</button>
				<button type="button" class="btn btn-primary btn-sm" id="btn_ajax_show2">Ajax데이터펼쳐보기</button></div>
			<div class="highlight" id="div_ajax_show2" style="display:none;"><pre><code class="html">var AjaxClass={
ajaxTablePage:function(){
	var requestUrl = "/ui/tableLayer.do";
	var params = new function(){
		this.param1 = "aa";
		this.param2 = "bb";
	};
	$.ajax({
		type:"GET",
		url:requestUrl,
		data:params,
		timeout:3000,
		async:false,
		beforeSend:function(){	//  Ajax 호출 전 실행
   			alert("beforeSend Process");
   			$("#span_ajax_table").empty();
			$("#span_ajax_table").html("&lt;img src=\"/static/img/ajax-loader_big.gif\"&gt;");
   		},
		success:function(data){		//  Ajax 실행시 데이터 
			if(data != undefined && data != null){
				$("#span_ajax_table").empty();
				$("#span_ajax_table").html(data);
			}else{
				alert("Data Loading Failed");	
			}
			alert("success Process");
		},
		error:function(XHR, textStatus, errorThrown) {		//  Error시  실행
   	    }, 
           complete:function(){		//  Ajax 완료시 실행(finally와 동일)
           	alert("complete Process");
           }
	});
}	
};</code></pre>
			</div>
			<!--End bs-example-->
			<!-- // Ajax Page Data Load(Case2)  -->
			<!-- Ajax Page Data Load(Case3)  -->
			<div class="headline"><h2>Ajax Data Rendering Load(Case3)</h2></div>
			<div class="margin-bottom-40"><span id="span_ajax_table3">[Ajax Data Area3]</span></div>
			<!-- bs-example -->
			<div class="bs-example">
				<button type="button" class="btn btn-info btn-sm" id="btn_ajax_table3">Ajax데이터가져오기</button>
				<button type="button" class="btn btn-primary btn-sm" id="btn_ajax_show3">Ajax데이터펼쳐보기</button></div>
			<div class="highlight" id="div_ajax_show3" style="display:none;"><pre><code class="html">
[Source]
String='[{&quot;col1&quot;:&quot;Ajax11&quot;,&quot;col2&quot;:&quot;Ajax22&quot;,&quot;col3&quot;:&quot;@mdo&quot;,&quot;col4&quot;:&quot;&lt;span class='label label-warning'&gt;Expiring&lt;/span&gt;&quot;},{&quot;col1&quot;:&quot;Ajax33&quot;,&quot;col2&quot;:&quot;Ajax44&quot;,&quot;col3&quot;:&quot;@mdo&quot;,&quot;col4&quot;:&quot;&lt;span class='label label-warning'&gt;Expiring&lt;/span&gt;&quot;}]';

[Ajax]
var AjaxClass={
ajaxTablePage3:function(){
	var requestUrl = &quot;/ui/tableJson.do&quot;;
	
	$.ajax({
		type:&quot;GET&quot;,
		url:requestUrl,
		timeout:3000,
		async:false,
		beforeSend:function(){	//  Ajax 호출 전 실행
   			$(&quot;#span_ajax_table3&quot;).empty();
			$(&quot;#span_ajax_table3&quot;).html(&quot;&lt;img src=\&quot;/static/img/ajax-loader_big.gif\&quot;&gt;&quot;);
   		},
		success:function(data){		//  Ajax 실행시 데이터 
			if(data != undefined && data != null){
				AjaxClass.dataRendering(data);
			}else{
				alert(&quot;Data Loading Failed&quot;);	
			}
		},
		error:function(XHR, textStatus, errorThrown) {		//  Error시  실행
   	    }, 
           complete:function(){		//  Ajax 완료시 실행(finally와 동일)
           }
	});
},
dataRendering:function(data){
	// String to JSON Object
	var ajaxData = jQuery.parseJSON(data);
	var vTable = &quot;&lt;table class=\&quot;table\&quot;&gt;&quot;
	+&quot;	&lt;thead&gt;&quot;
	+&quot;		&lt;tr&gt;&quot;
	+&quot;			&lt;th&gt;#&lt;/th&gt;&quot;
	+&quot;			&lt;th&gt;First Name&lt;/th&gt;&quot;
	+&quot;			&lt;th class=\&quot;hidden-sm\&quot;&gt;Last Name&lt;/th&gt;&quot;
	+&quot;			&lt;th&gt;Status&lt;/th&gt;&quot;
	+&quot;		&lt;/tr&gt;&quot;
	+&quot;	&lt;/thead&gt;&quot;
	+&quot;	&lt;tbody&gt;&quot;;
	for(var i = 0; i &lt; ajaxData.length ; i++){
		vTable += &quot;		&lt;tr&gt;&quot;
		+&quot;			&lt;td&gt;&quot;+ajaxData[i].col1+&quot;&lt;/td&gt;&quot;
		+&quot;			&lt;td&gt;&quot;+ajaxData[i].col2+&quot;&lt;/td&gt;&quot;
		+&quot;			&lt;td class=\&quot;hidden-sm\&quot;&gt;&quot;+ajaxData[i].col3+&quot;&lt;/td&gt;&quot;
		+&quot;			&lt;td&gt;&quot;+ajaxData[i].col4+&quot;&lt;/td&gt;&quot;
		+&quot;		&lt;/tr&gt;&quot;;
	}
	vTable += &quot;	&lt;/tbody&gt;&quot;
	+&quot;&lt;/table&gt;&quot;;
	
	$(&quot;#span_ajax_table3&quot;).html(vTable);
}
};</code></pre>
			</div>
			<!--End bs-example-->
			<!-- // Ajax Page Data Load(Case3)  -->
			<!--Ajax-->
		</div>
	</div>

</div>
<!-- Footer -->
<jsp:include page="/WEB-INF/view/ui/common/footer.jsp" />
<!-- // Footer -->
<script type="text/javascript">
var AjaxClass={
	ajaxTablePage:function(){
		var requestUrl = "/ui/tableLayer.do";
		
		$("#span_ajax_table").html('<div></div><div class="progress progress-striped active"><div class="progress-bar"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width:100%;"><span class="sr-only">요청 중 입니다.</span></div></div>');
		$("#span_ajax_table").load(requestUrl);
	},
	ajaxTablePage2:function(){
		var requestUrl = "/ui/tableLayer.do";
		var params = new function(){
			this.param1 = "aa";
			this.param2 = "bb";
		};
		
		$.ajax({
			type:"GET",
			url:requestUrl,
			data:params,
			timeout:3000,
			async:false,
			beforeSend:function(){	//  Ajax 호출 전 실행
    			alert("beforeSend Process");
    			$("#span_ajax_table2").empty();
				$("#span_ajax_table2").html("<img src=\"/static/img/ajax-loader_big.gif\">");
    		},
			success:function(data){		//  Ajax 실행시 데이터 
				if(data != undefined && data != null){
					$("#span_ajax_table2").empty();
					$("#span_ajax_table2").html(data);
				}else{
					alert("Data Loading Failed");	
				}
				alert("success Process2");
			},
			error:function(XHR, textStatus, errorThrown) {		//  Error시  실행
    	    }, 
            complete:function(){		//  Ajax 완료시 실행(finally와 동일)
            	alert("complete Process2");
            }
		});
	},
	ajaxTablePage3:function(){
		var requestUrl = "/ui/tableJson.do";
		
		$.ajax({
			type:"GET",
			url:requestUrl,
			timeout:3000,
			async:false,
			beforeSend:function(){	//  Ajax 호출 전 실행
    			$("#span_ajax_table3").empty();
				$("#span_ajax_table3").html("<img src=\"/static/img/ajax-loader_big.gif\">");
    		},
			success:function(data){		//  Ajax 실행시 데이터 
				if(data != undefined && data != null){
					AjaxClass.dataRendering(data);
				}else{
					alert("Data Loading Failed");	
				}
			},
			error:function(XHR, textStatus, errorThrown) {		//  Error시  실행
    	    }, 
            complete:function(){		//  Ajax 완료시 실행(finally와 동일)
            }
		});
	},
	dataRendering:function(data){
		// String to JSON Object
		var ajaxData = jQuery.parseJSON(data);
		var vTable = "<table class=\"table\">"
		+"	<thead>"
		+"		<tr>"
		+"			<th>#</th>"
		+"			<th>First Name</th>"
		+"			<th class=\"hidden-sm\">Last Name</th>"
		+"			<th>Status</th>"
		+"		</tr>"
		+"	</thead>"
		+"	<tbody>";
		for(var i = 0; i < ajaxData.length ; i++){
			vTable += "		<tr>"
			+"			<td>"+ajaxData[i].col1+"</td>"
			+"			<td>"+ajaxData[i].col2+"</td>"
			+"			<td class=\"hidden-sm\">"+ajaxData[i].col3+"</td>"
			+"			<td>"+ajaxData[i].col4+"</td>"
			+"		</tr>";
		}
		vTable += "	</tbody>"
		+"</table>";
		
		$("#span_ajax_table3").html(vTable);
	}
};
    jQuery(document).ready(function() {
        $("#btn_ajax_show").click(function(){
			if($("#div_ajax_show").css("display") == "none"){
				$("#div_ajax_show").show();
			}else{
				$("#div_ajax_show").hide();
			}
			
		});
        $("#btn_ajax_table").click(function(){
        	AjaxClass.ajaxTablePage();
		});
        $("#btn_ajax_show2").click(function(){
			if($("#div_ajax_show2").css("display") == "none"){
				$("#div_ajax_show2").show();
			}else{
				$("#div_ajax_show2").hide();
			}
			
		});
        $("#btn_ajax_table2").click(function(){
        	AjaxClass.ajaxTablePage2();
		});
        $("#btn_ajax_show3").click(function(){
			if($("#div_ajax_show3").css("display") == "none"){
				$("#div_ajax_show3").show();
			}else{
				$("#div_ajax_show3").hide();
			}
			
		});
        $("#btn_ajax_table3").click(function(){
        	AjaxClass.ajaxTablePage3();
		});
    });
</script>
</body>
</html>
