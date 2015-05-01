<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
		<link ref="stylesheet" href="css/bootstrap.css">
			<link ref="stylesheet" href="css/bootstrap.min.css">
				<link rel="stylesheet" href="css/bootstrap-theme.min.css">

					<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
						<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
							<link rel="stylesheet" href="bootstrap/css/bootstrap.css.map">
								<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css">
									<link rel="stylesheet"
										href="bootstrap/css/bootstrap-theme.css.map">
										<link rel="stylesheet"
											href="bootstrap/css/bootstrap-theme.min.css">
											<script>
												<script type="text/javascript">
												$(document)
														.ready(
																function() {
																	$(
																			'ul.nav > li ')
																			.click(
																					function(
																							e) {
																						// 			alert('clicked');
																						//e.preventDefault();
																						$(
																								'ul.nav > li ')
																								.removeClass(
																										'active');
																						$(
																								this)
																								.addClass(
																										'active');
																					});
																});
											</script>
<title>Login - Lib manager System</title>
<%
	String logedIn = (String) session.getAttribute("login.done");
	String roles = (String) session.getAttribute("patron.roles");
	//logedIn = "nttuyen";
	if (logedIn != null) {
		session.removeAttribute("login.done");
		session.removeAttribute("patron.roles");
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
					<jsp:include page="header.jsp" />
				</div>
				<div>
					<jsp:include page="carousel.jsp" flush="true" />
				</div>
				<div class="wrapmiddel">

					<div class="sidebar">
						<jsp:include page="sidebar.jsp" />
					</div>
					<div align="center">
						<p align="center">..:: Home &gt; Đặt sách::..</p>
					</div>

					<table width="710px">
						<tr>
							<td>
								<form name="formLogin" method="post" action="controler">
									<table align="center">
										<tr>
											<td width="23%">&nbsp;</td>
											<td width="45%"><p class="style1"><span>
													<%=messageErr%>
													</span>
												</p></td>
											<td width="32%">&nbsp;</td>
										</tr>
										<tr>
											<td><p>Tên đăng nhập :</p></td>
											<td><input name="login.userName" type="text"
												placeholder="Input account here" id="login.userName"
												value="" size="35"></td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td><p>Mật khẩu :</p></td>
											<td><input name="login.password" type="password"
												placeholder="Input password here" id="login.password"
												value="" size="35"></td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><div align="center">
													<input name="action" type="hidden" value="LOGIN"> <input
														name="login.submit" type="submit" id="login.submit"
														value="Đăng nhập">
												</div></td>
											<td><p>
													<a href="#">Quên mật khẩu</a></td>
										</tr>
									</table>
								</form>
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
