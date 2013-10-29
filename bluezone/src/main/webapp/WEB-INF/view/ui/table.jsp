<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><jsp:include page="/WEB-INF/view/ui/common/header.jsp" />
<!-- // Header -->
<body>
<!-- Navi -->
<jsp:include page="/WEB-INF/view/ui/common/navi.jsp" >
	<jsp:param name="nav_name" value="Table" />
</jsp:include>
<!-- // Navi -->
<!--=== Content Part ===-->
<div class="container">
	<div class="row">
		<!--Begin Sidebar Menu-->
        <div class="col-md-3">
        	<!-- Left -->
			<jsp:include page="/WEB-INF/view/ui/common/left.jsp" >
				<jsp:param name="left_name" value="Table" />
			</jsp:include>
			<!-- // Left -->
		</div>
		<div class="col-md-9">
			<!--Basic Table-->
			<div class="panel panel-green margin-bottom-40">
					<div class="panel-heading">
						<h3 class="panel-title"><i class="icon-tasks"></i> Basic Table</h3>
					</div>
					<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>First Name</th>
							<th class="hidden-sm">Last Name</th>
							<th>Username</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>Mark</td>
							<td class="hidden-sm">Otto</td>
							<td>@mdo</td>
							<td><span class="label label-warning">Expiring</span></td>							
						</tr>
						<tr>
							<td>2</td>
							<td>Jacob</td>
							<td class="hidden-sm">Thornton</td>
							<td>@fat</td>
							<td><span class="label label-success">Success</span></td>							
						</tr>
						<tr>
							<td>3</td>
							<td>Larry</td>
							<td class="hidden-sm">the Bird</td>
							<td>@twitter</td>
							<td><span class="label label-danger">Error!</span></td>							
						</tr>
						<tr>
							<td>4</td>
							<td>htmlstream</td>
							<td class="hidden-sm">Web Design</td>
							<td>@htmlstream</td>
							<td><span class="label label-info">Pending..</span></td>							
						</tr>
					</tbody>
				</table>
			</div>
			<!-- bs-example -->
			<div class="bs-example"><button type="button" class="btn btn-primary btn-sm" id="btn_table_show">펼쳐보기</button></div>
			<div class="highlight" id="div_table" style="display:none;"><pre><code class="html">&lt;table class=&quot;table&quot;&gt;
&lt;thead&gt;
&lt;tr&gt;
	&lt;th&gt;#&lt;/th&gt;
	&lt;th&gt;First Name&lt;/th&gt;
	&lt;th class=&quot;hidden-sm&quot;&gt;Last Name&lt;/th&gt;
	&lt;th&gt;Username&lt;/th&gt;
	&lt;th&gt;Status&lt;/th&gt;
&lt;/tr&gt;
&lt;/thead&gt;
&lt;tbody&gt;
&lt;tr&gt;
	&lt;td&gt;1&lt;/td&gt;
	&lt;td&gt;Mark&lt;/td&gt;
	&lt;td class=&quot;hidden-sm&quot;&gt;Otto&lt;/td&gt;
	&lt;td&gt;@mdo&lt;/td&gt;
	&lt;td&gt;&lt;span class=&quot;label label-warning&quot;&gt;Expiring&lt;/span&gt;&lt;/td&gt;							
&lt;/tr&gt;
&lt;tr&gt;
	&lt;td&gt;2&lt;/td&gt;
	&lt;td&gt;Jacob&lt;/td&gt;
	&lt;td class=&quot;hidden-sm&quot;&gt;Thornton&lt;/td&gt;
	&lt;td&gt;@fat&lt;/td&gt;
	&lt;td&gt;&lt;span class=&quot;label label-success&quot;&gt;Success&lt;/span&gt;&lt;/td&gt;							
&lt;/tr&gt;
&lt;tr&gt;
	&lt;td&gt;3&lt;/td&gt;
	&lt;td&gt;Larry&lt;/td&gt;
	&lt;td class=&quot;hidden-sm&quot;&gt;the Bird&lt;/td&gt;
	&lt;td&gt;@twitter&lt;/td&gt;
	&lt;td&gt;&lt;span class=&quot;label label-danger&quot;&gt;Error!&lt;/span&gt;&lt;/td&gt;							
&lt;/tr&gt;
&lt;tr&gt;
	&lt;td&gt;4&lt;/td&gt;
	&lt;td&gt;htmlstream&lt;/td&gt;
	&lt;td class=&quot;hidden-sm&quot;&gt;Web Design&lt;/td&gt;
	&lt;td&gt;@htmlstream&lt;/td&gt;
	&lt;td&gt;&lt;span class=&quot;label label-info&quot;&gt;Pending..&lt;/span&gt;&lt;/td&gt;							
&lt;/tr&gt;
&lt;/tbody&gt;
&lt;/table&gt;</code></pre>
			</div>
				<!--End bs-example-->
			<!--Basic Table-->
			<!--Basic Table Option (Spacing)-->
			<div class="panel panel-red margin-bottom-40">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="icon-user"></i> Basic Table Option (with space)</h3>
				</div>
				<div class="panel-body">
					<table class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>First Name</th>
								<th class="hidden-sm">Last Name</th>
								<th>Username</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>Mark</td>
								<td class="hidden-sm">Otto</td>
								<td>@mdo</td>
								<td><button class="btn btn-danger btn-xs"><i class="icon-trash"></i> Delete</button></td>
							</tr>
							<tr>
								<td>2</td>
								<td>Jacob</td>
								<td class="hidden-sm">Thornton</td>
								<td>@fat</td>
								<td><button class="btn btn-warning btn-xs"><i class="icon-pencil"></i> Edit</button></td>
							</tr>
							<tr>
								<td>3</td>
								<td>Larry</td>
								<td class="hidden-sm">the Bird</td>
								<td>@twitter</td>
								<td><button class="btn btn-info btn-xs"><i class="icon-share"></i> Share</button></td>
							</tr>
							<tr>
								<td>4</td>
								<td>htmlstream</td>
								<td class="hidden-sm">Web Design</td>
								<td>@htmlstream</td>
								<td><button class="btn btn-success btn-xs"><i class="icon-ok"></i> Submit</button></td>
							</tr>
						</tbody>
					</table>
				</div>						
			</div>
			<!-- bs-example -->
			<div class="bs-example"><button type="button" class="btn btn-primary btn-sm" id="btn_table_option_show">펼쳐보기</button></div>
			<div class="highlight" id="div_table_option" style="display:none;"><pre><code class="html">&lt;table class=&quot;table&quot;&gt;
&lt;thead&gt;
&lt;tr&gt;
	&lt;th&gt;#&lt;/th&gt;
	&lt;th&gt;First Name&lt;/th&gt;
	&lt;th class=&quot;hidden-sm&quot;&gt;Last Name&lt;/th&gt;
	&lt;th&gt;Username&lt;/th&gt;
	&lt;th&gt;Status&lt;/th&gt;
&lt;/tr&gt;
&lt;/thead&gt;
&lt;tbody&gt;
&lt;tr&gt;
	&lt;td&gt;1&lt;/td&gt;
	&lt;td&gt;Mark&lt;/td&gt;
	&lt;td class=&quot;hidden-sm&quot;&gt;Otto&lt;/td&gt;
	&lt;td&gt;@mdo&lt;/td&gt;
	&lt;td&gt;&lt;button class=&quot;btn btn-danger btn-xs&quot;&gt;&lt;i class=&quot;icon-trash&quot;&gt;&lt;/i&gt; Delete&lt;/button&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
	&lt;td&gt;2&lt;/td&gt;
	&lt;td&gt;Jacob&lt;/td&gt;
	&lt;td class=&quot;hidden-sm&quot;&gt;Thornton&lt;/td&gt;
	&lt;td&gt;@fat&lt;/td&gt;
	&lt;td&gt;&lt;button class=&quot;btn btn-warning btn-xs&quot;&gt;&lt;i class=&quot;icon-pencil&quot;&gt;&lt;/i&gt; Edit&lt;/button&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
	&lt;td&gt;3&lt;/td&gt;
	&lt;td&gt;Larry&lt;/td&gt;
	&lt;td class=&quot;hidden-sm&quot;&gt;the Bird&lt;/td&gt;
	&lt;td&gt;@twitter&lt;/td&gt;
	&lt;td&gt;&lt;button class=&quot;btn btn-info btn-xs&quot;&gt;&lt;i class=&quot;icon-share&quot;&gt;&lt;/i&gt; Share&lt;/button&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
	&lt;td&gt;4&lt;/td&gt;
	&lt;td&gt;htmlstream&lt;/td&gt;
	&lt;td class=&quot;hidden-sm&quot;&gt;Web Design&lt;/td&gt;
	&lt;td&gt;@htmlstream&lt;/td&gt;
	&lt;td&gt;&lt;button class=&quot;btn btn-success btn-xs&quot;&gt;&lt;i class=&quot;icon-ok&quot;&gt;&lt;/i&gt; Submit&lt;/button&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/tbody&gt;
&lt;/table&gt;</code></pre>
			</div>
				<!--End bs-example-->
        	<!--End Basic Table-->

			<!--Striped and Hover Rows-->
        	<div class="row">
	        	<!--Striped Rows-->
        		<div class="col-md-6">
					<div class="panel panel-sea margin-bottom-40">
						<div class="panel-heading">
							<h3 class="panel-title"><i class="icon-edit"></i> Striped Rows</h3>
						</div>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>#</th>
									<th>Username</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>Mark</td>
									<td><button class="btn btn-danger btn-xs"><i class="icon-trash"></i> Delete</button></td>
								</tr>
								<tr>
									<td>2</td>
									<td>Jacob</td>
									<td><button class="btn btn-warning btn-xs"><i class="icon-pencil"></i> Edit</button></td>
								</tr>
								<tr>
									<td>3</td>
									<td>Larry</td>
									<td><button class="btn btn-info btn-xs"><i class="icon-share"></i> Share</button></td>
								</tr>
								<tr>
									<td>4</td>
									<td>htmlstream</td>
									<td><button class="btn btn-success btn-xs"><i class="icon-ok"></i> Submit</button></td>
								</tr>
							</tbody>
						</table>
					</div>
				<!-- bs-example -->
				<div class="bs-example"><button type="button" class="btn btn-primary btn-sm" id="btn_table_strip_show">펼쳐보기</button></div>
				<div class="highlight" id="div_table_strip" style="display:none;"><pre><code class="html">&lt;table class=&quot;table table-striped&quot;&gt;
&lt;thead&gt;
&lt;tr&gt;
	&lt;th&gt;#&lt;/th&gt;
	&lt;th&gt;Username&lt;/th&gt;
	&lt;th&gt;Status&lt;/th&gt;
&lt;/tr&gt;
&lt;/thead&gt;
&lt;tbody&gt;
&lt;tr&gt;
	&lt;td&gt;1&lt;/td&gt;
	&lt;td&gt;Mark&lt;/td&gt;
	&lt;td&gt;&lt;button class=&quot;btn btn-danger btn-xs&quot;&gt;&lt;i class=&quot;icon-trash&quot;&gt;&lt;/i&gt; Delete&lt;/button&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
	&lt;td&gt;2&lt;/td&gt;
	&lt;td&gt;Jacob&lt;/td&gt;
	&lt;td&gt;&lt;button class=&quot;btn btn-warning btn-xs&quot;&gt;&lt;i class=&quot;icon-pencil&quot;&gt;&lt;/i&gt; Edit&lt;/button&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
	&lt;td&gt;3&lt;/td&gt;
	&lt;td&gt;Larry&lt;/td&gt;
	&lt;td&gt;&lt;button class=&quot;btn btn-info btn-xs&quot;&gt;&lt;i class=&quot;icon-share&quot;&gt;&lt;/i&gt; Share&lt;/button&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
	&lt;td&gt;4&lt;/td&gt;
	&lt;td&gt;htmlstream&lt;/td&gt;
	&lt;td&gt;&lt;button class=&quot;btn btn-success btn-xs&quot;&gt;&lt;i class=&quot;icon-ok&quot;&gt;&lt;/i&gt; Submit&lt;/button&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/tbody&gt;
&lt;/table&gt;</code></pre>
				</div>
				<!--End bs-example-->
        		</div>
	        	<!--End Striped Rows-->

	        	<!--Hover Rows-->
        		<div class="col-md-6">
					<div class="panel panel-yellow margin-bottom-40">
						<div class="panel-heading">
							<h3 class="panel-title"><i class="icon-gear"></i> Hover rows</h3>
						</div>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>#</th>
									<th>Username</th>
									<th>Link</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>Mark</td>
									<td><a class="btn btn-danger btn-xs">Pending</a></td>
								</tr>
								<tr>
									<td>2</td>
									<td>Jacob</td>
									<td><a class="btn btn-warning btn-xs">Demo Link</a></td>
								</tr>
								<tr>
									<td>3</td>
									<td>Larry</td>
									<td><a class="btn btn-info btn-xs">Share Info</a></td>
								</tr>
								<tr>
									<td>4</td>
									<td>htmlstream</td>
									<td><a class="btn btn-success btn-xs">Testing Box</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				<!-- bs-example -->
				<div class="bs-example"><button type="button" class="btn btn-primary btn-sm" id="btn_table_hover_show">펼쳐보기</button></div>
				<div class="highlight" id="div_table_hover" style="display:none;"><pre><code class="html">&lt;table class=&quot;table table-hover&quot;&gt;
&lt;thead&gt;
&lt;tr&gt;
	&lt;th&gt;#&lt;/th&gt;
	&lt;th&gt;Username&lt;/th&gt;
	&lt;th&gt;Link&lt;/th&gt;
&lt;/tr&gt;
&lt;/thead&gt;
&lt;tbody&gt;
&lt;tr&gt;
	&lt;td&gt;1&lt;/td&gt;
	&lt;td&gt;Mark&lt;/td&gt;
	&lt;td&gt;&lt;a class=&quot;btn btn-danger btn-xs&quot;&gt;Pending&lt;/a&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
	&lt;td&gt;2&lt;/td&gt;
	&lt;td&gt;Jacob&lt;/td&gt;
	&lt;td&gt;&lt;a class=&quot;btn btn-warning btn-xs&quot;&gt;Demo Link&lt;/a&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
	&lt;td&gt;3&lt;/td&gt;
	&lt;td&gt;Larry&lt;/td&gt;
	&lt;td&gt;&lt;a class=&quot;btn btn-info btn-xs&quot;&gt;Share Info&lt;/a&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
	&lt;td&gt;4&lt;/td&gt;
	&lt;td&gt;htmlstream&lt;/td&gt;
	&lt;td&gt;&lt;a class=&quot;btn btn-success btn-xs&quot;&gt;Testing Box&lt;/a&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/tbody&gt;
&lt;/table&gt;</code></pre>
				</div>
				<!--End bs-example-->
        		</div>
	        	<!--End Hover Rows-->
        	</div>
        	<!--End Striped and Hover Rows-->
			</div>
		</div>
	</div>

</div>
<!-- Footer -->
<jsp:include page="/WEB-INF/view/ui/common/footer.jsp" />
<!-- // Footer -->
<script type="text/javascript">
    jQuery(document).ready(function() {
        $("#btn_table_show").click(function(){
			if($("#div_table").css("display") == "none"){
				$("#div_table").show();
			}else{
				$("#div_table").hide();
			}
			
		});
		$("#btn_table_option_show").click(function(){
			if($("#div_table_option").css("display") == "none"){
				$("#div_table_option").show();
			}else{
				$("#div_table_option").hide();
			}
			
		});
		$("#btn_table_strip_show").click(function(){
			if($("#div_table_strip").css("display") == "none"){
				$("#div_table_strip").show();
			}else{
				$("#div_table_strip").hide();
			}
			
		});
		$("#btn_table_hover_show").click(function(){
			if($("#div_table_hover").css("display") == "none"){
				$("#div_table_hover").show();
			}else{
				$("#div_table_hover").hide();
			}
			
		});
    });
</script>
</body>
</html>
