<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><jsp:include page="/WEB-INF/view/ui/common/header.jsp" />
<!-- // Header -->
<body>
<!-- Navi -->
<jsp:include page="/WEB-INF/view/ui/common/navi.jsp" >
	<jsp:param name="nav_name" value="Button" />
</jsp:include>
<!-- // Navi -->
<!--=== Content Part ===-->
<div class="container">
	<div class="row">
		<!--Begin Sidebar Menu-->
        <div class="col-md-3">
        	<!-- Left -->
			<jsp:include page="/WEB-INF/view/ui/common/left.jsp" >
				<jsp:param name="left_name" value="Button" />
			</jsp:include>
			<!-- // Left -->
		</div>
		<div class="col-md-9">
			<!--Basic Button-->
			<div class="alert alert-info fade in">
                <button type="button" class="close" data-dismiss="alert">×</button>
                <strong>Heads up!</strong> Here is default Bootstrap buttons.
            </div>
			<div class="panel panel-green margin-bottom-40">
				<table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Button</th>
                            <th>class=""</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><button class="btn btn-default" type="button">Default</button></td>
                            <td><code>btn btn-default</code></td>
                            <td>Standard gray button with gradient</td>
                        </tr>
                        <tr>
                            <td><button class="btn btn-primary" type="button">Primary</button></td>
                            <td><code>btn btn-primary</code></td>
                            <td>Provides extra visual weight and identifies the primary action in a set of buttons</td>
                        </tr>
                        <tr>
                            <td><button class="btn btn-info" type="button">Info</button></td>
                            <td><code>btn btn-info</code></td>
                            <td>Used as an alternative to the default styles</td>
                        </tr>
                        <tr>
                            <td><button class="btn btn-success" type="button">Success</button></td>
                            <td><code>btn btn-success</code></td>
                            <td>Indicates a successful or positive action</td>
                        </tr>
                        <tr>
                            <td><button class="btn btn-warning" type="button">Warning</button></td>
                            <td><code>btn btn-warning</code></td>
                            <td>Indicates caution should be taken with this action</td>
                        </tr>
                        <tr>
                            <td><button class="btn btn-danger" type="button">Danger</button></td>
                            <td><code>btn btn-danger</code></td>
                            <td>Indicates a dangerous or potentially negative action</td>
                        </tr>
                        <tr>
                            <td><button class="btn btn-link" type="button">Link</button></td>
                            <td><code>btn btn-link</code></td>
                            <td>Deemphasize a button by making it look like a link while maintaining button behavior</td>
                        </tr>
                        <tr>
                            <td><a href="#" class="btn btn-large btn-primary disabled">Primary link</a></td>
                            <td><code>A Link disabled</code></td>
                            <td>A link Disabled state</td>
                        </tr>
                        <tr>
                            <td><button type="button" class="btn btn-large btn-primary disabled" disabled="disabled">Primary button</button></td>
                            <td><code>btn-primary disabled</code></td>
                            <td>Button Disabled state</td>
                        </tr>
                    </tbody>
                </table>
			</div>
			<!-- bs-example -->
			<div class="bs-example"><button type="button" class="btn btn-primary btn-sm" id="btn_bootstrap_button_show">펼쳐보기</button></div>
			<div class="highlight" id="div_bootstrap_button" style="display:none;"><pre><code class="html"><table class="table table-bordered table-striped">
<tbody>
<tr>
    <td><button class="btn btn-default" type="button">Default</button></td>
    <td><code>&lt;button class=&quot;btn btn-default&quot; type=&quot;button&quot;&gt;Default&lt;/button&gt;</code></td>
</tr>
<tr>
    <td><button class="btn btn-primary" type="button">Primary</button></td>
    <td><code>&lt;button class=&quot;btn btn-primary&quot; type=&quot;button&quot;&gt;Primary&lt;/button&gt;</code></td>
</tr>
<tr>
    <td><button class="btn btn-info" type="button">Info</button></td>
    <td><code>&lt;button class=&quot;btn btn-info&quot; type=&quot;button&quot;&gt;Info&lt;/button&gt;</code></td>
</tr>
<tr>
    <td><button class="btn btn-success" type="button">Success</button></td>
    <td><code>&lt;button class=&quot;btn btn-success&quot; type=&quot;button&quot;&gt;Success&lt;/button&gt;</code></td>
</tr>
<tr>
    <td><button class="btn btn-warning" type="button">Warning</button></td>
    <td><code>&lt;button class=&quot;btn btn-warning&quot; type=&quot;button&quot;&gt;Warning&lt;/button&gt;</code></td>
</tr>
<tr>
    <td><button class="btn btn-danger" type="button">Danger</button></td>
    <td><code>&lt;button class=&quot;btn btn-danger&quot; type=&quot;button&quot;&gt;Danger&lt;/button&gt;</code></td>
</tr>
<tr>
    <td><button class="btn btn-link" type="button">Link</button></td>
    <td><code>&lt;button class=&quot;btn btn-link&quot; type=&quot;button&quot;&gt;Link&lt;/button&gt;</code></td>
</tr>
<tr>
    <td><a href="#" class="btn btn-large btn-primary disabled">Primary link</a></td>
    <td><code>&lt;button class=&quot;btn btn-large btn-primary disabled&quot; type=&quot;button&quot;&gt;Primary link&lt;/button&gt;</code></td>
</tr>
<tr>
    <td><button type="button" class="btn btn-large btn-primary disabled" disabled="disabled">Primary button</button></td>
    <td><code>&lt;button class=&quot;btn btn-large btn-primary disabled&quot; type=&quot;button&quot;&gt;Primary button&lt;/button&gt;</code></td>
</tr>
</tbody>
</table></code></pre>
			</div>
			<!--End bs-example-->
			<!--Basic Button-->
			
			<!-- Button Sizes -->
            <div class="headline"><h2>Button Sizes</h2></div>
            <div class="row margin-bottom-30">
                <div class="col-md-6">
                    <p>Fancy larger or smaller buttons? Add <code>.btn-lg</code>, <code>.btn-sm</code>, or <code>.btn-xs</code> for additional sizes.</p>
                    <p>
                        <button class="btn-u btn-u-large" type="button">Large button</button>
                        <button class="btn-u btn-u-blue btn-u-large" type="button">Large button</button>
                    </p>
                    <p>
                        <button class="btn-u btn-u-red" type="button">Default button</button>
                        <button class="btn-u btn-u-orange" type="button">Default button</button>
                    </p>
                    <p>
                        <button class="btn-u btn-u-small btn-u-sea" type="button">Small button</button>
                        <button class="btn-u btn-u-small btn-u-green" type="button">Small button</button>
                    </p>
                    <p>
                        <button class="btn btn-mini btn-primary" type="button">Mini button</button>
                        <button class="btn btn-mini" type="button">Mini button</button>
                    </p>
				<!-- bs-example -->
			<div class="bs-example"><button type="button" class="btn btn-primary btn-sm" id="btn_button_size_show">펼쳐보기</button></div>
			<div class="highlight" id="div_button_size" style="display:none;"><pre><code class="html"><table class="table table-bordered table-striped">
<tbody>
<tr>
    <td><button class="btn-u btn-u-large" type="button">Large button</button></td>
    <td><code>&lt;button class=&quot;btn-u btn-u-large&quot; type=&quot;button&quot;&gt;Large button&lt;/button&gt;</code></td>
</tr>
<tr>
    <td><button class="btn-u btn-u-blue btn-u-large" type="button">Large button</button></td>
    <td><code>&lt;button class=&quot;btn-u btn-u-blue btn-u-large&quot; type=&quot;button&quot;&gt;Large button&lt;/button&gt;</code></td>
</tr>
<tr>
    <td><button class="btn-u btn-u-red" type="button">Default button</button></td>
    <td><code>&lt;button class=&quot;btn-u btn-u-red&quot; type=&quot;button&quot;&gt;Default button&lt;/button&gt;</code></td>
</tr>
<tr>
    <td><button class="btn-u btn-u-orange" type="button">Default button</button></td>
    <td><code>&lt;button class=&quot;btn-u btn-u-orange&quot; type=&quot;button&quot;&gt;Default button&lt;/button&gt;</code></td>
</tr>
<tr>
    <td><button class="btn-u btn-u-small btn-u-sea" type="button">Small button</button></td>
    <td><code>&lt;button class=&quot;btn-u btn-u-small btn-u-sea&quot; type=&quot;button&quot;&gt;Small button&lt;/button&gt;</code></td>
</tr>
<tr>
    <td><button class="btn-u btn-u-small btn-u-green" type="button">Small button</button></td>
    <td><code>&lt;button class=&quot;btn-u btn-u-small btn-u-green&quot; type=&quot;button&quot;&gt;Small button&lt;/button&gt;</code></td>
</tr>
<tr>
    <td><button class="btn btn-mini btn-primary" type="button">Mini button</button></td>
    <td><code>&lt;button class=&quot;btn btn-mini btn-primary&quot; type=&quot;button&quot;&gt;Mini button&lt;/button&gt;</code></td>
</tr>
<tr>
    <td><button class="btn btn-mini" type="button">Mini button</button></td>
    <td><code>&lt;button class=&quot;btn btn-mini&quot; type=&quot;button&quot;&gt;Mini button&lt;/button&gt;</code></td>
</tr>
</tbody>
</table></code></pre>
			</div>
			<!--End bs-example-->
                </div>
                
                <div class="col-md-6">
                    <p>Create block level buttons—those that span the full width of a parent— by adding <code>.btn-block</code>.</p>
                    <button class="btn-u btn-u-blue btn-u-large btn-block" type="button">Block level button</button>
                    <button class="btn-u btn-u-green btn-u-large btn-block" type="button">Block level button</button>
                    <button class="btn-u btn-u-yellow btn-block" type="button">Block level button</button>
                    <button class="btn-u btn-u-default btn-block" type="button">Block level button</button>
                    <p class="margin-bottom-20"></p>
                <!-- bs-example -->
			<div class="bs-example"><button type="button" class="btn btn-primary btn-sm" id="btn_button_block_show">펼쳐보기</button></div>
			<div class="highlight" id="div_button_block" style="display:none;"><pre><code class="html"><table class="table table-bordered table-striped">
<tbody>
<tr>
    <td><button class="btn-u btn-u-blue btn-u-large btn-block" type="button">Block level button</button></td>
    <td><code>&lt;button class=&quot;btn-u btn-u-blue btn-u-large btn-block&quot; type=&quot;button&quot;&gt;Block level button&lt;/button&gt;</code></td>
</tr>
<tr>
    <td><button class="btn-u btn-u-green btn-u-large btn-block" type="button">Block level button</button></td>
    <td><code>&lt;button class=&quot;btn-u btn-u-green btn-u-large btn-block&quot; type=&quot;button&quot;&gt;Block level button&lt;/button&gt;</code></td>
</tr>
<tr>
    <td><button class="btn-u btn-u-yellow btn-block" type="button">Block level button</button></td>
    <td><code>&lt;button class=&quot;btn-u btn-u-yellow btn-block&quot; type=&quot;button&quot;&gt;Block level button&lt;/button&gt;</code></td>
</tr>
<tr>
    <td><button class="btn-u btn-u-default btn-block" type="button">Block level button</button></td>
    <td><code>&lt;button class=&quot;btn-u btn-u-default btn-block&quot; type=&quot;button&quot;&gt;Block level button&lt;/button&gt;</code></td>
</tr>
</tbody>
</table></code></pre>
			</div>
			<!--End bs-example-->
                </div>
            </div><!--/row-->
		</div>
	</div>

</div>
<!-- Footer -->
<jsp:include page="/WEB-INF/view/ui/common/footer.jsp" />
<!-- // Footer -->
<script type="text/javascript">
    jQuery(document).ready(function() {
        $("#btn_bootstrap_button_show").click(function(){
			if($("#div_bootstrap_button").css("display") == "none"){
				$("#div_bootstrap_button").show();
			}else{
				$("#div_bootstrap_button").hide();
			}
			
		});
        $("#btn_button_size_show").click(function(){
			if($("#div_button_size").css("display") == "none"){
				$("#div_button_size").show();
			}else{
				$("#div_button_size").hide();
			}
			
		});
        $("#btn_button_block_show").click(function(){
			if($("#div_button_block").css("display") == "none"){
				$("#div_button_block").show();
			}else{
				$("#div_button_block").hide();
			}
			
		});
    });
</script>
</body>
</html>
