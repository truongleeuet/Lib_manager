<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="manager.ResourceBorrow"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<title>Your Company Website</title>


<%
	String logedIn = (String) session.getAttribute("login.done");
	String roles = (String) session.getAttribute("patron.roles");
	//logedIn = "nttuyen";

	//Patron patron = (Patron)request.getAttribute("patron_borrow");
	//Resource resource = (Resource)request.getAttribute("resource_borrow");
	ResourceBorrow resourceBorrow = (ResourceBorrow) request
			.getAttribute("resourceBorrow");

	if (resourceBorrow == null || logedIn == null
			|| !"PATRON_LIB_MANAGER".equals(roles)) {
		response.sendRedirect("login.jsp");
		out.println("That la cha hieu dek gi ca");
	}

	//Doan code nay minh cung van chua hieu gi ca
	//Tai sao no fai co cho nay moi chay dung
	if (resourceBorrow == null) {
		resourceBorrow = new ResourceBorrow();
	}

	DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	Date currentDate = new Date();
	String currentDateString = dateFormat.format(currentDate);
	Date renderDate = resourceBorrow.getRenderDate();
	int numberDate = currentDate.compareTo(renderDate);
	if (numberDate <= 0) {
		numberDate = 0;
	}

	long timengayquahan = currentDate.getTime() - renderDate.getTime();
	long money, ngayquahan;
	if (timengayquahan > 0) {
		ngayquahan = TimeUnit.DAYS.convert(timengayquahan,
				TimeUnit.MILLISECONDS);

		money = ngayquahan * 300;

	} else {
		ngayquahan = 0;
		money = 0;
	}
	String borrowDateString = dateFormat.format(resourceBorrow
			.getBorrowDate());
	String renderDateString = dateFormat.format(resourceBorrow
			.getRenderDate());
%>


<link rel="stylesheet" type="text/css" href="style.css">
	<style type="text/css">
<!--
.style1 {
	color: #999999;
	font-size: 14px;
	font-weight: bold;
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
									<li ><a href="#"><span
											class="glyphicon glyphicon-cd"></span> CD</a></li>
									<li ><a href="#"><span><img
												width="10px" height="20px" src="images/requesticon.jpg"></span>
											REQUEST</a></li>
									<li ><a href="#"><span><img
												width="10px" height="20px" src="images/contact_us_icon.png"></span>
											CONTACT</a></li>
									<li ><a href="#"><span><img
												width="10px" height="20px" src="images/support.png"></span>
											SUPPORT</a></li>
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
											border="0" align="absmiddle">&nbsp;ACTION
									</p>
									<p class="left">
										<img src="images/dot_o.gif" width="5" height="5" alt=""
											border="0">&nbsp;&nbsp;<a href="checkOut.jsp">Cho
												mượn tài nguyên </a>
									</p>
									<p class="left">
										<img src="images/dot_o.gif" width="5" height="5" alt=""
											border="0">&nbsp;&nbsp;<a href="checkIn.jsp">Trả
												tài nguyên </a>
									</p>
								</div>

								<hr />

								<div align="left">
									<p class="left">
										<img src="images/e01.gif" width="14" height="16" alt=""
											border="0" align="absmiddle">&nbsp;MANAGER
									</p>
									<p class="left">
										<img src="images/dot_o.gif" width="5" height="5" alt=""
											border="0">&nbsp;&nbsp;<a href="editBook.jsp">Thêm
												sách </a>
									</p>
									<p class="left">
										<img src="images/dot_o.gif" width="5" height="5" alt=""
											border="0">&nbsp;&nbsp;<a href="editCD.jsp">Thêm CD
										</a>
									</p>

									<p class="left">
										<img src="images/dot_o.gif" width="5" height="5" alt=""
											border="0">&nbsp;&nbsp;<a href="deleteResource.jsp">Xoá
												tài liệu </a>
									</p>
									<p></p>
									<p class="left">
										<img src="images/dot_o.gif" width="5" height="5" alt=""
											border="0">&nbsp;&nbsp;<a href="editPatron.jsp">Thêm
												bạn đọc </a>
									</p>
									<p class="left">
										<img src="images/dot_o.gif" width="5" height="5" alt=""
											border="0">&nbsp;&nbsp;<a href="updatePatron.jsp">Cập
												nhật bạn đọc </a>
									</p>
									<p class="left">
										<img src="images/dot_o.gif" width="5" height="5" alt=""
											border="0">&nbsp;&nbsp;<a href="deletePatron.jsp">Xoá
												bạn đọc </a>
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
										<td width="6%">&nbsp;</td>
										<td width="66%">
											<p align="center">..:: Home &gt; Tìm kiếm ::..</p>
										</td>
										<td width="28%">
											<p align="right">
												&nbsp;&nbsp; Guest &nbsp;&nbsp; |<a href="login.jsp">&nbsp;&nbsp;
													Login &nbsp;&nbsp;</a>
											</p>
										</td>
									</tr>
								</table>
							</div>

							<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr valign="top">
									<td width="45%">
										<p>&nbsp;</p>
										<p class="style1">Thông tin cuốn sách trả</p>
										<p>&nbsp;</p>

										<table width="95%" border="0">
											<tr>
												<td width="36%"><p>
														<strong> Tên đăng nhâp : </strong>
													</p></td>
												<td width="64%"><p>
														<%=resourceBorrow.getPatronID()%>
													</p></td>
											</tr>
											<tr>
												<td><p>
														<strong> Mã tài nguyên mượn : </strong>
													</p></td>
												<td><p>
														<%=resourceBorrow.getResourceID()%></p></td>
											</tr>
											<tr>
												<td><p>
														<strong> Ngày mượn : </strong>
													</p></td>
												<td><p>
														<%=borrowDateString%>
													</p></td>
											</tr>
											<tr>
												<td><p>
														<strong> Ngày trả : </strong>
													</p></td>
												<td><p>
														<%=renderDateString%>
													</p></td>
											</tr>
											<tr valign="top">
												<td><p>
														<strong> Số ngáy quá hạn : </strong>
													</p></td>
												<td><p>
														<%=ngayquahan%>
													</p></td>
											</tr>
											<tr>
												<td><p>
														<strong> Tền phạt : </strong>
													</p></td>
												<td><p>
														<%=money%>VNĐ.
													</p></td>
											</tr>


											<tr valign="top">
												<td><p>
														<strong> Ngay Hien Tai : </strong>
													</p></td>
												<td><p>
														<%=currentDateString%>
													</p></td>
											</tr>
											<tr>
												<td><p>&nbsp;</p></td>
												<td><form id="formCheckIn" name="formCheckIn"
														method="get" action="controler">

														<input type="hidden" name="checkIn.userName"
															id="checkIn.userName"
															value="<%=resourceBorrow.getPatronID()%>" /> <input
															type="hidden" name="checkIn.Isbn"
															id="checkIn.Isbn"
															value="<%=resourceBorrow.getResourceID()%>" /> <input
															type="hidden" name="action" value="CHECK_IN" /> <input
															type="hidden" name="checkIn_type" value="DELETE" /> <input
															type="submit" name="checkIn.submit" id="checkIn.submit"
															value="Trả sách" /> <a class="right" href="checkIn.jsp">Back....</a>
													</form></td>
											</tr>
										</table>
<!-- 										<p class="right"> -->
<!-- 											<a href="checkIn.jsp">Back ....</a> -->
<!-- 										</p> -->

										<p>&nbsp;</p>

										<p>&nbsp;</p>
										<p class="right">&nbsp;</p>
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
									<td width="300"><p class="menu02">Copyright &copy;2015
											truonglee</p></td>
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
