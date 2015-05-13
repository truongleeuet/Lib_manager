<%@page import="manager.resource.ResourceManager"%>
<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<%@  include file="listbook.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- <script type="text/javascript" src="jquery/jquery-1.11.2.min.js"></script> -->
<!-- 	<script type="text/javascript" src="https://code.jquery.com/jquery-1.4.2.min.js"></script> -->
<!-- <script src="jquery/autocompleter.js"></script> -->


<!-- <link rel="stylesheet" -->
<!-- 	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"> -->
<script type="text/javascript" src="jquery/jquery-1.11.2.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.11.2/jquery-ui.min.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script>
	$(document).ready(function() {
		$(function() {
			$("#search").autocomplete({

				source : function(request, response) {
					$.ajax({
						url : "/lib_manager/jsp/controler",
						type : "GET",
						data : {
							term : request.term
						},
						dataType : "json",
						success : function(data) {
							response(data);
						}
					});
				}
			});
		});
	});
</script>

`
<title>check out - lib manager sys</title>
<%
	String logedIn = (String) session.getAttribute("login.done");
	String roles = (String) session.getAttribute("patron.roles");

	//Nếu chưa đăng nhập hoặc không fải là nhân viên thư viện thì không được truy cập trang này
	if (logedIn == null || !"PATRON_LIB_MANAGER".equals(roles)) {
		response.sendRedirect("login.jsp");
	}

	String messageErr = (String) request.getAttribute("messageErr");
	if (messageErr == null) {
		messageErr = "";
	}
	//ResourceManager resourcemanager = new ResourceManager();
	// 	WebcamQRCodeExample webcam = new WebcamQRCodeExample();
	// 	String result = webcam.getResult();
%>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/stylesugess.css" />
</head>

<body>

									<div class="search-container">
										<div class="ui-widget">
											<input type="text" id="search" name="search"  />
										</div>
			

</body>
</html>
