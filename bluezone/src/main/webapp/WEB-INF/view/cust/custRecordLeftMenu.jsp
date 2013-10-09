<!DOCTYPE html>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>jQuery/Bootstrap List Tree Plugin Demo</title>
 	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.0.4/css/bootstrap-combined.min.css" type="text/css">
	<link rel="stylesheet" href="/static/css/listTree.css" type="text/css">
	<script src="/static/js/jquery-1.10.2.min.js"></script>
	<script src="/static/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/static/js/listTree.js"></script>
</head>
<body>
 
<div id="content">
    <div class="tree well">
	    <ul>
	        <li>
	            <span><i class="icon-folder-open"></i> Parent</span> <a href="">Goes somewhere</a>
	            <ul>
	                <li>
	                	<span><i class="icon-minus-sign"></i> Child</span> <a href="">Goes somewhere</a>
	                    <ul>
	                        <li>
		                        <span><i class="icon-leaf"></i> Grand Child</span> <a href="">Goes somewhere</a>
	                        </li>
	                    </ul>
	                </li>
	                <li>
	                	<span><i class="icon-minus-sign"></i> Child</span> <a href="">Goes somewhere</a>
	                    <ul>
	                        <li>
		                        <span><i class="icon-leaf"></i> Grand Child</span> <a href="">Goes somewhere</a>
	                        </li>
	                        <li>
	                        	<span><i class="icon-minus-sign"></i> Grand Child</span> <a href="">Goes somewhere</a>
	                            <ul>
	                                <li>
		                                <span><i class="icon-minus-sign"></i> Great Grand Child</span> <a href="">Goes somewhere</a>
			                            <ul>
			                                <li>
				                                <span><i class="icon-leaf"></i> Great great Grand Child</span> <a href="">Goes somewhere</a>
			                                </li>
			                                <li>
				                                <span><i class="icon-leaf"></i> Great great Grand Child</span> <a href="">Goes somewhere</a>
			                                </li>
			                             </ul>
	                                </li>
	                                <li>
		                                <span><i class="icon-leaf"></i> Great Grand Child</span> <a href="">Goes somewhere</a>
	                                </li>
	                                <li>
		                                <span><i class="icon-leaf"></i> Great Grand Child</span> <a href="">Goes somewhere</a>
	                                </li>
	                            </ul>
	                        </li>
	                        <li>
		                        <span><i class="icon-leaf"></i> Grand Child</span> <a href="">Goes somewhere</a>
	                        </li>
	                    </ul>
	                </li>
	            </ul>
	        </li>
	        <li>
	            <span><i class="icon-folder-open"></i> Parent2</span> <a href="">Goes somewhere</a>
	            <ul>
	                <li>
	                	<span><i class="icon-leaf"></i> Child</span> <a href="">Goes somewhere</a>
			        </li>
			    </ul>
	        </li>
	    </ul>
	</div>
	
	<div class="tree">
	    <ul>
	        <li>
	            <span><i class="icon-calendar"></i> 2013, Week 2</span>
	            <ul>
	                <li>
	                	<span class="badge badge-success"><i class="icon-minus-sign"></i> Monday, January 7: 8.00 hours</span>
	                    <ul>
	                        <li>
		                        <a href=""><span><i class="icon-time"></i> 8.00</span> &ndash; Changed CSS to accomodate...</a>
	                        </li>
	                    </ul>
	                </li>
	                <li>
	                	<span class="badge badge-success"><i class="icon-minus-sign"></i> Tuesday, January 8: 8.00 hours</span>
	                    <ul>
	                        <li>
		                        <span><i class="icon-time"></i> 6.00</span> &ndash; <a href="">Altered code...</a>
	                        </li>
	                        <li>
		                        <span><i class="icon-time"></i> 2.00</span> &ndash; <a href="">Simplified our approach to...</a>
	                        </li>
	                    </ul>
	                </li>
	                <li>
	                	<span class="badge badge-warning"><i class="icon-minus-sign"></i> Wednesday, January 9: 6.00 hours</span>
	                    <ul>
	                        <li>
		                        <a href=""><span><i class="icon-time"></i> 3.00</span> &ndash; Fixed bug caused by...</a>
	                        </li>
	                        <li>
		                        <a href=""><span><i class="icon-time"></i> 3.00</span> &ndash; Comitting latest code to Git...</a>
	                        </li>
	                    </ul>
	                </li>
	                <li>
	                	<span class="badge badge-important"><i class="icon-minus-sign"></i> Wednesday, January 9: 4.00 hours</span>
	                    <ul>
	                        <li>
		                        <a href=""><span><i class="icon-time"></i> 2.00</span> &ndash; Create component that...</a>
	                        </li>
	                    </ul>
	                </li>
	            </ul>
	        </li>
	        <li>
	            <span><i class="icon-calendar"></i> 2013, Week 3</span>
	            <ul>
	                <li>
	                	<span class="badge badge-success"><i class="icon-minus-sign"></i> Monday, January 14: 8.00 hours</span>
	                    <ul>
	                        <li>
		                        <span><i class="icon-time"></i> 7.75</span> &ndash; <a href="">Writing documentation...</a>
	                        </li>
	                        <li>
		                        <span><i class="icon-time"></i> 0.25</span> &ndash; <a href="">Reverting code back to...</a>
	                        </li>
	                    </ul>
	                </li>
			    </ul>
	        </li>
	    </ul>
	</div>
</div>
 
</body>
</html>