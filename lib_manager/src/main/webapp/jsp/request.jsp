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



						<link rel="stylesheet" type="text/css" href="style.css">
							<style type="text/css">
<!--
.style1 {
	font-size: 14px;
	font-weight: bold;
	color: #999999;
}

.style2 {
	color: #FF0000
}
-->
</style>

							<style type="text/css">
@import url(jscalendar/calendar-win2k-1.css);
</style>

							<link rel="stylesheet" type="text/css" media="all"
								href="jscalendar/skins/aqua/theme.css" title="Aqua" />
							<link rel="alternate stylesheet" type="text/css" media="all"
								href="jscalendar/calendar-blue.css" title="winter" />
							<link rel="alternate stylesheet" type="text/css" media="all"
								href="jscalendar/calendar-blue2.css" title="blue" />
							<link rel="alternate stylesheet" type="text/css" media="all"
								href="jscalendar/calendar-brown.css" title="summer" />
							<link rel="alternate stylesheet" type="text/css" media="all"
								href="jscalendar/calendar-green.css" title="green" />
							<link rel="alternate stylesheet" type="text/css" media="all"
								href="jscalendar/calendar-win2k-1.css" title="win2k-1" />
							<link rel="alternate stylesheet" type="text/css" media="all"
								href="jscalendar/calendar-win2k-2.css" title="win2k-2" />
							<link rel="alternate stylesheet" type="text/css" media="all"
								href="jscalendar/calendar-win2k-cold-1.css" title="win2k-cold-1" />

							<link rel="alternate stylesheet" type="text/css" media="all"
								href="jscalendar/calendar-win2k-cold-2.css" title="win2k-cold-2" />
							<link rel="alternate stylesheet" type="text/css" media="all"
								href="jscalendar/calendar-system.css" title="system" />


							<script type="text/javascript" src="jscalendar/calendar.js"></script>
							<script type="text/javascript"
								src="jscalendar/lang/calendar-en.js"></script>
							<script type="text/javascript" src="jscalendar/calendar-setup.js"></script>
</head>

<body leftmargin=0 topmargin=0 marginheight="0" marginwidth="0"
	bgcolor="#ffffff">

	<table border="0" cellspacing="0" cellpadding="0" width="100%"
		height="100%">
		<tr valign="top">
			<td width="50%" background="img/bg.gif"><img
				src="img/px1.gif" width="1" height="1" alt="" border="0"></td>
			<td valign="bottom" background="img/bg_left.gif"><img
				src="img/bg_left.gif" alt="" width="17" height="16" border="0"></td>
			<td>
				<!-- Header --> <jsp:include page="header.jsp" /> <!--  End Header -->
				<div>
					<jsp:include page="carousel.jsp" flush="true" />
				</div>
				<table border="0" cellpadding="0" cellspacing="0" width="980"
					height="107">
					<tr valign="top">
						<td bgcolor="#D0E0ED">
							<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td bgcolor="#076BA7">
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td><img src="img/text_1.gif" width="183"
													height="67"></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<div align="center"></div>
							<div align="center"></div>

							<div align="left">
								<div id='cssmenu'>
									<ul>
										<li class='active'><a href='#'><span>Home</span></a></li>
										<li class='has-sub'><a href='#'><span>Bạn Đọc</span></a>
											<ul>
												<li><a href='index.jsp'><span>Tìm Kiếm</span></a></li>
												<%
													if (logedIn != null) {
												%>
												<li class='last'><a href='request.jsp'><span>Đặt
															Sách</span></a></li>
												<%
													}
												%>

											</ul></li>
										<%
											if ("PATRON_LIB_MANAGER".equals(roles)) {
										%>
										<li class='has-sub'><a href='#'><span>Action</span></a>
											<ul>
												<li><a href='checkOut.jsp'><span>Cho mượn
															tài nguyên</span></a></li>
												<li class='last'><a href='checkIn.jsp'><span>Trả
															tài nguyên</span></a></li>
											</ul></li>
										<li class='last'><a href='#'><span>Manager</span></a>
											<ul>
												<li><a href='isbn.jsp'><span>Thêm Sách</span></a></li>
												<li><a href='deleteResource.jsp'><span>Xóa
															Sách</span></a></li>
												<li><a href='#'><span>Thêm Bạn Đọc</span></a></li>
												<li><a href='#'><span>Cập Nhật Bạn Đọc</span></a></li>
												<li class='last'><a href='#'><span>Xóa Bạn
															Đọc</span></a></li>
											</ul></li>
										<%
											}
										%>
										<%
											if ("PATRON_STUDENT".equals(roles)) {
										%>
										<li class='last'><a href='#'><span>Tài Nguyên</span></a>
											<ul>
												<li><a href='#'><span>Tài Nguyên Đã Mượn</span></a></li>
												<li class='last'><a href='#'><span>Tài
															Nguyên Yêu Cầu</span></a></li>
											</ul></li>
										<%
											}
										%>
									</ul>
								</div>
							</div>
						</td>

						<td rowspan="2">
							

							<div align="center">
								<table width="100%" border="0">
									<tr>
										<td width="6%" height="30">&nbsp;</td>
										<td width="66%">
											<p align="center">..:: Home &gt; Đặt sách::..</p>
										</td>
										<td width="28%">
											<p align="right">
												<a href="login.jsp"> <%=logedIn%>
												</a> |<a href="login.jsp"> Logout </a>
											</p>
										</td>
									</tr>
								</table>
							</div>

							<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr valign="top">
									<td width="45%">
										<div>
											<p class="style1">Thông tin đặt sách :</p>
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
													<td><input name="request.date" type="text"
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
										</form> <script type="text/javascript">
											Calendar.setup({
												inputField : "request.date", // ID of the input field
												ifFormat : "%d/%m/%Y", // the date format
												button : "request.date" // ID of the button
											});
										</script>



										<p>&nbsp;</p>
										<p>&nbsp;</p>
										<p class="right"></p>
									</td>
								</tr>
							</table>

							
						</td>
						<td rowspan="2">&nbsp;</td>
					</tr>
					
				</table>
				<div>
					<%@include file="footer.jsp"%>
				</div>
			</td>
			<td valign="bottom" background="img/bg_right.gif"><img
				src="img/bg_right.gif" alt="" width="17" height="16" border="0"></td>
			<td width="50%" background="img/bg.gif"><img
				src="img/px1.gif" width="1" height="1" alt="" border="0"></td>
		</tr>
	</table>
</body>
</html>
