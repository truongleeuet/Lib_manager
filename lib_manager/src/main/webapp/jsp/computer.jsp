<%@page import="manager.resource.ResourceManager"%>
<%@page import="manager.resource.Resource"%>
<%@page import="java.util.*"%>
<%@  include file="Function.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ResourceManager resourcemanager = new ResourceManager();
	List<Resource> listcomputer = resourcemanager.listKindBook("Computers");
	
	int currentPage = 1;
 	if (request.getParameter("page") != null) {
 		try {
 			currentPage = Integer
 					.parseInt(request.getParameter("page"));
 		} catch (Exception e) {
 			currentPage = 1;
 		}
 	}
 	String phantrang = getPage("computer.jsp",currentPage, 9, 3, listcomputer);
%>
<link rel="stylesheet" type="text/css" href="css/style.css">
<div class="body" style="background: #000">
<%-- 	<jsp:useBean id=""></jsp:useBean> --%>
	<c:set></c:set>
	<div>
		<%=phantrang%>
	</div>
</div>