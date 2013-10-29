<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--=== Breadcrumbs ===-->
<div class="breadcrumbs margin-bottom-20">
    <div class="container">
        <h1 class="pull-left">SCJ Ui</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="#">Home</a></li>
            <li><a href="">Component</a></li>
            <li class="active"><%=request.getParameter("nav_name")%></li>
        </ul>
    </div>
</div><!--/breadcrumbs-->
<!--=== End Breadcrumbs ===-->