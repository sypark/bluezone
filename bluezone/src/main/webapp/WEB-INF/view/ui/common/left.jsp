<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
			<ul class="list-group sidebar-nav-v1">
                <li class="list-group-item <%=("button".equalsIgnoreCase(request.getParameter("left_name")) ? "active":"")%>"><a href="/ui/button.do">Buttons</a></li>
                <li class="list-group-item <%=("table".equalsIgnoreCase(request.getParameter("left_name")) ? "active":"")%>"><a href="/ui/table.do">Tables</a></li>
                <!-- 
                <li class="list-group-item"><a href="feature_grid.html">Grid Layout</a></li>
                <li class="list-group-item">
                    <span class="badge badge-green">New</span>                    
                    <a href="feature_boxes.html">Content Boxes</a>
                </li>
                <li class="list-group-item"><a href="feature_typography.html">Typography</a></li>
                <li class="list-group-item">
                    <span class="badge badge-red">New</span>                    
                    <a href="feature_tagline_boxes.html">Tagline Boxes</a>
                </li>
                <li class="list-group-item">
                    <span class="badge">New</span>                                        
                    <a href="feature_icons.html">Icons</a>
                </li>
                <li class="list-group-item"><a href="feature_thumbails.html">Thumbails</a></li>
                <li class="list-group-item"><a href="feature_components.html">Components</a></li>
                <li class="list-group-item">
                    <span class="badge badge-blue">New</span>                    
                    <a href="feature_accardion_and_tabs.html">Accardion and Tabs</a>
                </li>
                <li class="list-group-item"><a href="feature_navigations.html">Navigations</a></li>
                <li class="list-group-item"><a href="feature_forms.html">Forms</a></li>
                <li class="list-group-item">
                    <span class="badge badge-sea">New</span>                    
                    <a href="feature_testimonials.html">Testimonials</a>
                </li>
                 -->
            </ul>