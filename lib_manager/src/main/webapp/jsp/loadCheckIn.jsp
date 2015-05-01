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
						<title>Your Company Website</title> <%
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
													type="hidden" name="checkIn.Isbn" id="checkIn.Isbn"
													value="<%=resourceBorrow.getResourceID()%>" /> <input
													type="hidden" name="action" value="CHECK_IN" /> <input
													type="hidden" name="checkIn_type" value="DELETE" /> <input
													type="submit" name="checkIn.submit" id="checkIn.submit"
													value="Trả sách" /> <a class="right" href="checkIn.jsp">Back....</a>
											</form></td>
									</tr>
								</table> <!-- 										<p class="right"> --> <!-- 											<a href="checkIn.jsp">Back ....</a> -->
								<!-- 										</p> -->

								<p>&nbsp;</p>

								<p>&nbsp;</p>
								<p class="right">&nbsp;</p>
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
