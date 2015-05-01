<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
		<link rel="stylesheet" href="bootstrap/css/bootstrap.css.map">
			<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css">
				<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css.map">
					<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
						<script src="bootstrap/js/bootstrap.js"></script>
						<script src="bootstrap/js/bootstrap.min.js"></script>
						<script src="bootstrap/js/npm.js"></script>
						<script src="jquery/jquery-2.1.3.js"></script>
						<script src="jquery/jquery-2.1.3.min.js"></script>
						<script type="text/javascript">
							$(document).ready(function() {
								$('ul.nav > li ').click(function(e) {
									// 			alert('clicked');
									//e.preventDefault();
									$('ul.nav > li ').removeClass('active');
									$(this).addClass('active');
								});
							});
						</script>
						<title>request - lib manager sys</title> <%
 	String logedIn = (String) session.getAttribute("login.done");
 	String roles = (String) session.getAttribute("patron.roles");
 	//logedIn = "nttuyen";
 	if (logedIn == null) {
 		response.sendRedirect("login.jsp");
 	}

 	String messageErr = (String) request.getAttribute("messageErr");
 	if (messageErr == null) {
 		messageErr = "";
 	}
 %>



						<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>

	<table>
		<tr valign="top">
			<td>
				<div>
					<!-- Header -->
					<jsp:include page="header.jsp" />
					<!--  End Header -->
				</div>
				<div>
					<jsp:include page="carousel.jsp" flush="true" />
				</div>
				<div class="wrapmiddel">
					<div class="sidebar">
						<jsp:include page="sidebar.jsp" flush="true" />
					</div>


					<div align="center">
						<p align="center">..:: Home &gt; Đặt sách::..</p>
					</div>
					<table>
						<tr valign="top">
							<td width="45%">
								<div>
									<p>Thông tin đặt sách :</p>
								</div>

								<form name="formRequest" method="post" action="controler">
									<table width="95%" border="0" align="center">
										<tr>
											<td width="37%">&nbsp;</td>
											<td width="63%"><p class="style2"><%=messageErr%></p></td>
										</tr>
										<tr>
											<td><p>Tên đăng nhập của người đặt :</p></td>
											<td><input name="request.userName" type="text"
												id="request.userName" size="35" value="<%=logedIn%>"></td>
										</tr>
										<tr>
											<td><p>Mã của cuốn sách đặt :</p></td>
											<td><input name="request.Isbn" type="text"
												id="request.Isbn" size="35"></td>
										</tr>
										<tr>
											<td><p>Ngày mượn :</p></td>
											<td><input name="request.date" type="date"
												id="request.date" size="35"></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><div align="center">
													<input name="action" type="hidden" value="REQUEST" /> <input
														name="request.submit" type="submit" id="request.submit">
														<input name="request.reset" type="reset"
														id="request.reset">
												</div></td>
										</tr>
									</table>
								</form> 
								<p>&nbsp;</p>
								<p>&nbsp;</p>
								<p class="right"></p>
							</td>
						</tr>
					</table>
				</div>
				<div>
					<%@include file="footer.jsp"%>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>
