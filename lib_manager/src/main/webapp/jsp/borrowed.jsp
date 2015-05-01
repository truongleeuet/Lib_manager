<%@page import="java.util.ArrayList"%>
<%@page import="manager.resource.ResourceManager"%>
<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<%@page import="java.util.List"%>
<%@page import="manager.*"%>

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
						<title>check out - lib manager sys</title> <%
 	String logedIn = (String) session.getAttribute("login.done");
 	String roles = (String) session.getAttribute("patron.roles");
 	//logedIn = "nttuyen";
 	//Nếu chưa đăng nhập hoặc không fải là nhân viên thư viện thì không được truy cập trang này
 	if (logedIn == null || !"PATRON_STUDENT".equals(roles)) {
 		response.sendRedirect("login.jsp");
 	}

 	List<ResourceBorrow> list = (List<ResourceBorrow>) session
 			.getAttribute("listborrowed");
	if(list == null){
		list = new ArrayList<ResourceBorrow>();
	}
 	String messageErr = (String) request.getAttribute("messageErr");
 	if (messageErr == null) {
 		messageErr = "";
 	}
 %>


						<link rel="stylesheet" type="text/css" href="style.css" />
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
</head>

<body leftmargin=0 topmargin=0 marginheight="0" marginwidth="0"
	bgcolor="#ffffff">

	<table border="0" cellspacing="0" cellpadding="0" width="100%"
		height="100%">
		<tr valign="top">
			<td width="50%" background="images/bg.gif"><img
				src="images/px1.gif" width="1" height="1" alt="" border="0"></td>
			<td valign="bottom" background="images/bg_left.gif"><img
				src="images/bg_left.gif" alt="" width="17" height="16" border="0"></td>
			<td>
				<table border="0" cellpadding="0" cellspacing="0" width="780"
					height="107">
					<tr valign="bottom">
						<td><img src="images/logo.gif" width="183" height="107"
							alt="" border="0"></td>
						<td width="673" background="images/fon_top.gif">
							<table border="0" cellpadding="0" cellspacing="0" background="">
								<ul class="nav nav-pills">

									<li class="active"><a href="#"><span
											class="glyphicon glyphicon-home"></span> HOME</a></li>
									<li><a href="Book.jsp"><span class="glyphicon glyphicon-book"></span>
											BOOK</a></li>
									<li><a href="#"><span class="glyphicon glyphicon-cd"></span>
											CD</a></li>
									<li><a href="#"><span><img width="10px"
												height="20px" src="images/requesticon.jpg"></span> REQUEST</a></li>
									<li><a href="#"><span><img width="10px"
												height="20px" src="images/contact_us_icon.png"></span>
											CONTACT</a></li>
									<li><a href="#"><span><img width="10px"
												height="20px" src="images/support.png"></span> SUPPORT</a></li>
								</ul>
							</table>
						</td>
					</tr>
				</table>
				<table border="0" cellpadding="0" cellspacing="0" width="780"
					height="107">
					<tr valign="top">
						<td bgcolor="#D0E0ED">
							<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td bgcolor="#076BA7">
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td><img src="images/text_1.gif" width="183"
													height="67"></td>
											</tr>
										</table>
									</td>
								</tr>
								<form action="" method="post"></form>
							</table>
							<div align="center"></div>
							<div align="center"></div>

							<div align="left">
								<p></p>
								<p class="left">
									<img src="images/e01.gif" width="14" height="16" alt=""
										border="0" align="absmiddle">&nbsp;&nbsp;BẠN ĐỌC 
								</p>
								<p class="left">
									<img src="images/dot_o.gif" width="5" height="5" alt=""
										border="0">&nbsp;&nbsp;<a href="index.jsp">Tìm kiếm
									</a>
								</p>
								<p class="left">
									<img src="images/dot_o.gif" width="5" height="5" alt=""
										border="0">&nbsp;&nbsp;<a href="request.jsp">Đặt
											sách </a>
								</p>
								<p class="left">&nbsp;</p>
							</div>

							<hr>


								<div align="left">
									<p class="left">
										<img src="images/e01.gif" width="14" height="16" alt=""
											border="0" align="absmiddle">&nbsp;TÀI NGUYÊN 
									</p>
									<p class="left">
										<img src="images/dot_o.gif" width="5" height="5" alt=""
											border="0">&nbsp;&nbsp;<a href="borrowed.jsp">Tài
												nguyên đã mượn </a>
									</p>
									<p class="left">
										<img src="images/dot_o.gif" width="5" height="5" alt=""
											border="0">&nbsp;&nbsp;<a href="requested.jsp">Tài nguyên đã
												yêu cầu</a>
									</p>
								</div>
							<br><br>
						</td>

						<td rowspan="2">
							<div align="center">
								<img src="images/top01.gif" width="597" height="24" alt=""
									border="0">
							</div>

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
												</a>|<a href="login.jsp">Logout</a>
											</p>
										</td>
									</tr>
								</table>
							</div>

							<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr valign="top">
									<td width="45%">
										<div>
											<p class="style1">Thông tin :</p>
										</div>
										<div>
											<p class="style1"><%=list.size() %></p>
										</div>

										<%for(int i=0 ;i<list.size();i++) {%>
										<table width="95%" border="0" align="center">
											<tr>
												<td width="37%">&nbsp;</td>
												<td width="63%"><p class="style2"><%=messageErr%></p></td>
											</tr>
											<tr>
												<td><p>
														<strong>Tên người mượn : </strong>
													</p></td>
												<td><p><%=list.get(i).getPatronID()%></p></td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td><p><strong>Mã của cuốn sách mượn :</strong></p></td>
												<td><p><%=list.get(i).getResourceID()%></p></td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td><p>
														<strong>Ngày mượn : </strong>
													</p></td>
												<td><p><%=list.get(i).getBorrowDate()%></p></td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td><p>
														<strong>Ngày trả : </strong>
													</p></td>
												<td><p><%=list.get(i).getRenderDate()%></p></td>
												<td>&nbsp;</td>
											</tr>
										</table>
										<%} %>

										<p>&nbsp;</p>
										<p>&nbsp;</p>
										<p>&nbsp;</p>
										<p class="right"></p>
									</td>
								</tr>
							</table>

							<div align="center">
								<img src="images/hr01.gif" width="556" height="11" alt=""
									border="0">
							</div>
						</td>
						<td rowspan="2">&nbsp;</td>
					</tr>
					<tr valign="bottom" bgcolor="#D0E0ED">
						<td><img src="images/bot_left.gif" width="183" height="21"
							alt="" border="0"></td>
					</tr>
				</table>
				<table border="0" cellpadding="0" cellspacing="0" width="780"
					height="64" background="images/fon_bot.gif">
					<tr valign="top">
						<td>
							<table border="0" cellpadding="0" cellspacing="0" width="780"
								background="">
								<tr>
									<td width="300"><p class="menu02">Copyright
											&copy;2015truonglee</p></td>
									<td>
										<p class="menu02">
											<a href="">Home</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <a
												href="">About Us</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <a
												href="">Support</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <a
												href="">Services</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <a
												href="">Contacts</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <a
												href="">Help</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <a
												href="">FAQ</a>
										</p>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
			<td valign="bottom" background="images/bg_right.gif"><img
				src="images/bg_right.gif" alt="" width="17" height="16" border="0"></td>
			<td width="50%" background="images/bg.gif"><img
				src="images/px1.gif" width="1" height="1" alt="" border="0"></td>
		</tr>
	</table>

</body>
</html>
