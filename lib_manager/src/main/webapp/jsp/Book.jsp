<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@  include file="Function.jsp"%>
<%@ page import="manager.resource.*"%>
<%-- <%@ taglib uri="http://weblib.kth.taglib" prefix="weblib" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="manager.resource.Resource"%>
<%@page import="java.util.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								$('ul.nav > li ').click(function(e) {
									//alert('clicked');
									//e.preventDefault();
									$('ul.nav > li ').removeClass('active');
									$(this).addClass('active');
								});

								$('.dropdown-menu li a')
										.click(
												function() {
													//							 		  var a = $('#computer');

													$
															.ajax({
																url : "/lib_manager/jsp/controler",
																type : "GET",
																dataType : "json",
																success : function(
																		data) {
																	console
																			.log(data);

																	var tmp = '';
																	for (var i = 0; i < 9; i++) {
																		tmp += '<img class="imagebook" alt="Hinhanh" src="' + data[i].images + '"></img>'
																				+ '<p align="center" > <b>'
																				+ data[i].name
																				+ '</b>'
																				+ '</p>'
																				+ '<p align="center">'
																				+ data[i].amount
																				+ '</p>';

																	}

																	$(
																			'.bookdiv')
																			.html(
																					tmp);

																},
																error : function() {
																	console
																			.log("Error!");
																}
															});
												});
							});
		</script>
		<title>Book info - Lib Manager Sys</title> <%
 	String logedIn = (String) session.getAttribute("login.done");
 	String roles = (String) session.getAttribute("patron.roles");

 	Resource book = (Resource) request.getAttribute("book_edit");
 	if (book == null) {
 		book = new Resource();
 	}
 	ResourceManager resourcemanager = new ResourceManager();
 	List<Resource> list = resourcemanager.gets();
 	//List<Resource> listComputer = (List<Resource>) session.getAttribute("ListCom");

 	//  	int totalRecord = list.size();
 	//  	int totalPages = totalRecord / 9;
 	//  	if ((totalRecord % 9) > 0)
 	//  		totalPages += 1;
 	//  	int pages = 3;

 	int currentPage = 1;
 	if (request.getParameter("page") != null) {
 		try {
 			currentPage = Integer
 					.parseInt(request.getParameter("page"));
 		} catch (Exception e) {
 			currentPage = 1;
 		}
 	}
 	String phantrang = getPage("Book.jsp",currentPage, 9, 3, list);
 %>
		<link rel="stylesheet" type="text/css" href="css/style.css">
			</style>
</head>

<!-- <body> -->

<!-- 	<table> -->
<!-- 		<tr valign="top"> -->
<!-- 			<td> -->
<!-- 				<div> -->
<!-- 					Header -->
<%-- 					<jsp:include page="header.jsp" /> --%>
<!-- 					 End Header -->
<!-- 				</div> -->
<!-- 				<div> -->
<%-- 					<jsp:include page="carousel.jsp" flush="true" /> --%>
<!-- 				</div> -->
<!-- 				<div class="wrapmiddel"> -->
<!-- 					<div class="sidebar"> -->
<%-- 						<jsp:include page="sidebar.jsp" flush="true" /> --%>
<!-- 					</div> -->
<!-- 					<div align="center"> -->
<!-- 						<p align="center">..:: Home &gt;Xem Sách trong thư viện::..</p> -->
<!-- 					</div> -->
					<div class="body" style="background:#000">
						<div>
							<%=phantrang%>
						</div>
					</div>
<!-- 				</div> -->
<!-- 				<div> -->
<%-- 					<jsp:include page="footer.jsp" flush="true" /> --%>
<!-- 				</div> -->
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 	</table> -->

<!-- </body> -->
<!-- </html> -->
