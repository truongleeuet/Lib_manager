<%@page import="manager.resource.ResourceManager"%>
<%@page import="manager.resource.Resource"%>
<%@page import="java.util.*"%>
<%@  include file="Function.jsp"%>
<%
	ResourceManager resourcemanager = new ResourceManager();
	List<Resource> listcomputer = resourcemanager.listKindBook("Poetry");
	
	int currentPage = 1;
 	if (request.getParameter("page") != null) {
 		try {
 			currentPage = Integer
 					.parseInt(request.getParameter("page"));
 		} catch (Exception e) {
 			currentPage = 1;
 		}
 	}
 	String phantrang = getPage("poetry.jsp",currentPage, 9, 3, listcomputer);
%>
<link rel="stylesheet" type="text/css" href="css/style.css">
<div class="body" style="background: #000">
	<div>
		<%=phantrang%>
	</div>
</div>