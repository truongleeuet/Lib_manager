<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
	<script type="text/javascript" src="jquery/jquery-1.4.2.min.js"></script>
	<script src="jquery/jquery.autocomplete.js"></script>
	<script>
		jQuery(function() {
			$(".bookisbn").autocomplete("listbook.jsp");
		});
	</script>

	<title>Your Company Website</title> <%
 	String logedIn = (String) session.getAttribute("login_done");
 	String roles = (String) session.getAttribute("patron_roles");
 	//logedIn = "nttuyen";
 	if (logedIn == null || !"PATRON_LIB_MANAGER".equals(roles)) {
 		response.sendRedirect("login.jsp");
 	}

 	String messageErr = (String) request.getAttribute("messageErr");
 	if (messageErr == null) {
 		messageErr = "";
 	}
 %>


	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/stylesugess.css" />
		</style>
</head>

<body>

	<!-- 	<table border="0" cellspacing="0" cellpadding="0" width="100%" -->
	<!-- 		height="100%"> -->
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
	<!-- 						<p align="center">..:: Home &gt; Xóa sách::..</p> -->
	<!-- 					</div> -->
	<table>
		<tr valign="top">
			<td width="45%">
				<!-- 								<p class="style1">Mã của tài nguyên cần xoá :</p> -->
				<form action="controler" method="get" name="formDeleteResource">
					<table width="95%" border="0">
						<tr>
							<td width="30%">&nbsp;</td>
							<td width="50%"><p class="style2"><%=messageErr%></p></td>
							<td width="20%">&nbsp;</td>
						</tr>
						<tr>
							<td><p>Mã của tài nguyên cần xoá</p></td>
							<td><input name="delete.resourceID" type="text"
								id="delete.resourceID" size="35" class="bookisbn" /></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><div align="center">
									<input name="action" type="hidden" value="DELETE_RESOURCE" />
									<input name="delete.submit" type="submit" id="delete.submit" />
								</div></td>
							<td>&nbsp;</td>
						</tr>
					</table>

				</form>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p class="right">&nbsp;</p>
				<p class="right">&nbsp;</p>
			</td>
		</tr>
	</table>
	<!-- 				</div> -->
	<!-- 				<div> -->
	<%-- 					<%@include file="footer.jsp"%> --%>
	<!-- 				</div> -->
	<!-- 			</td> -->
	<!-- 		</tr> -->
	<!-- 	</table> -->

</body>
</html>
