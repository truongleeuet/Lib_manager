<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.List"%>
<%@page import="manager.resource.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="manager.resource.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
		<script type="text/javascript" src="jquery/jquery-1.11.2.min.js"></script>
<!-- 		<script -->
<!-- 			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css.map">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css.map">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
		<script language="JavaScript">
			function calcHeight() {
				var dodai_trang = document.getElementById('Shacker').contentWindow.document.body.scrollHeight;
				document.getElementById('Shacker').height = dodai_trang;
			}
		</script>


		<title>Home - Lib manager Sys</title> <%
 	String logedIn = (String) session.getAttribute("login_done");
 	String roles = (String) session.getAttribute("patron_roles");
 %>
		<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>

<body>
	<!-- style="background-image:url(img/library2.JPG);background-size: contain;" -->
	<table>
		<tr valign="top">
			<td>
				<div>
					<!-- Header -->
					<jsp:include page="header.jsp" />
					<!--  End Header -->
				</div>
<!-- 				<div> -->
<%-- 					<jsp:include page="carousel.jsp" flush="true" /> --%>
<!-- 				</div> -->
				<div class="wrapmiddel">
					<div class="sidebar">
						<jsp:include page="sidebar.jsp" flush="true" />
					</div>
					<div class="body">
						<iframe id="Shacker" src="body.jsp" name="iframe_book"
							onLoad="calcHeight();" scrolling="no" MARGINWIDTH=0
							MARGINHEIGHT=0></iframe>
						<%-- 							<jsp:include page="body.jsp" flush="true"/> --%>
					</div>
				</div>
				<div>
					<jsp:include page="footer.jsp" flush="true" />
				</div>
			</td>
		</tr>
	</table>
</body>
</html>
