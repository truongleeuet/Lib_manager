<%@page import="java.util.ArrayList"%>
<%@page import="manager.resource.Resource"%>
<%@page import="manager.resource.ResourceManager"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="manager.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

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
<title>check out - lib manager sys</title>
<%
	String logedIn = (String) session.getAttribute("login_done");
	String roles = (String) session.getAttribute("patron_roles");
	//logedIn = "nttuyen";
	//Nếu chưa đăng nhập hoặc không fải là nhân viên thư viện thì không được truy cập trang này
	// 	if (logedIn == null || !"PATRON_STUDENT".equals(roles)) {
	// 		response.sendRedirect("login.jsp");
	// 	}
	ResourceBorrowManagerImpl requestmanager = new ResourceBorrowManagerImpl();
	List<ResourceBorrow> listborrowed = requestmanager.getAllByPatron(logedIn);
	if (listborrowed.isEmpty()) {
		listborrowed = new ArrayList<ResourceBorrow>();
	}
	String messageErr = (String) request.getAttribute("messageErr");
	if (messageErr == null) {
		messageErr = "";
	}
	ResourceManager resourcemanager = new ResourceManager();

	DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
	Date currentDate = new Date();
	String currentDateString = dateFormat.format(currentDate);

%>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>

<body>
<%-- 	<sql:setDataSource var="worlddata" driver="com.mysql.jdbc.Driver" --%>
<%-- 				url="jdbc:mysql://127.0.0.1:3306/lib_manager"  --%>
<%-- 				user="root" --%>
<%-- 				password="" /> --%>
<%-- 	<sql:query dataSource="${worlddata}" --%>
<%-- 			     sql="select * from borrow where user_id =<${ }" var="cityData" /> --%>
<%-- 	<sql:update ></sql:update> --%>

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
						<p align="center">..:: Home &gt;Tài nguyên yêu cầu::..</p>
					</div>
					<div>
						<table>
							<tr valign="top">
								<td width="45%">
									<div>
										<p class="style1">Thông tin :</p>
									</div>
									<div>
										<p><%=listborrowed.size()%></p>
									</div>
									<table id="diaryuser">
										<tr>
											<th>Mã người dùng</th>
											<th>Mã Sách</th>
											<th>Tên Sách</th>
											<th>Ngày mượn</th>
											<th>Ngày phải trả</th>
											<th>Số ngày quá hạn</th>
											<th>Tiền phạt</th>
										</tr>
										<%
											if (!listborrowed.isEmpty()) {
												for (int i = 0; i < listborrowed.size(); i++) {
													Date renderDate = listborrowed.get(i).getRenderDate();
													int numberDate = currentDate.compareTo(renderDate);
													if (numberDate <= 0) {
														numberDate = 0;
													}

													long timengayquahan = currentDate.getTime()- renderDate.getTime();
													long money, ngayquahan;
													if (timengayquahan > 0) {
														ngayquahan = TimeUnit.DAYS.convert(timengayquahan,
																TimeUnit.MILLISECONDS);

														money = ngayquahan * 500;

													} else {
														ngayquahan = 0;
														money = 0;
													}
										%>
										<tr>
											<td><%=listborrowed.get(i).getPatronID()%></td>
											<td><%=listborrowed.get(i).getResourceID()%></td>
											<td><%=resourcemanager.get(listborrowed.get(i).getResourceID()).getName()%></td>
											<td><%=listborrowed.get(i).getBorrowDate()%></td>
											<td><%=listborrowed.get(i).getRenderDate()%></td>
											<td><%=String.valueOf(ngayquahan)%></td>
											<td><%=String.valueOf(money)%>VNĐ</td>
										</tr>
										<%
											}
											}
										%>
									</table>
									<p>&nbsp;</p>
									<p>&nbsp;</p>
									<p>&nbsp;</p>
									<p class="right"></p>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div>
					<%@include file="footer.jsp"%>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>
