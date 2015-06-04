<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@page import="manager.ResourceBorrow"%>
<%@page import="manager.ResourceBorrowManagerImpl"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript" src="jquery/jquery-1.4.2.min.js"></script>
<script src="jquery/jquery.autocomplete.js"></script>

<script>
	jQuery(function() {
		$(".bookisbn").autocomplete("listbook.jsp");
	});
</script>
<title>check in - lib manager sys</title>
<!--Đoạn mã đọc session để kiểm tra xem đã đăng nhập chưa,
	Nếu rồi thì đó là sinh viên, giảng viên hay nhân viên thư viện -->
<%
	String logedIn = (String) session.getAttribute("login_done");
	String roles = (String) session.getAttribute("patron_roles");

	//roles = "PATRON_LIB_MANAGER";
	//Nếu chưa đăng nhập hoặc không fải là nhân viên thư viện thì không được truy cập trang này

	if (logedIn == null || !"PATRON_LIB_MANAGER".equals(roles)) {
		response.sendRedirect("login.jsp");
	}
	String messageErr = (String) request.getAttribute("messageErr");
	if (messageErr == null) {
		messageErr = "";
	}
	List<ResourceBorrow> listborrow = (List<ResourceBorrow>) session
			.getAttribute("listborrowbook");
%>

<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/style1.css" />
<link rel="stylesheet" type="text/css" href="css/stylesugess.css" />
</head>

<body>
	<!-- 	<table> -->
	<!-- 		<tr valign="top"> -->
	<!-- 			<td> -->
	<!-- 				<div> -->
	<!-- 										Header -->
	<%-- 					<jsp:include page="header.jsp" /> --%>
	<!-- 										 End Header -->
	<!-- 				</div> -->
	<!-- 				<div> -->
	<%-- 					<jsp:include page="carousel.jsp" flush="true" /> --%>
	<!-- 				</div> -->
	<!-- 				<div class="wrapmiddel"> -->

	<!-- 					<div class="sidebar"> -->
	<%-- 						<jsp:include page="sidebar.jsp" flush="true" /> --%>
	<!-- 					</div> -->


	<!-- 					<div align="center"> -->
	<!-- 						<p align="center">..:: Home &gt; Nhật Kí::..</p> -->
	<!-- 					</div> -->


	<table width="710px">
		<tr valign="top">
			<td>
				<div>
					<!-- 									<p class="style1">Thông tin về:</p> -->
				</div> <!---Form nhập thông tin để trả sách-->

				<form name="formDiary" method="get" action="controler">
					<table width="95%" border="0" align="center">
						<tr>
							<td width="45%">&nbsp;</td>
<%-- 							<td width="55%"><p class="style2"><%=messageErr%></p></td> --%>
							<td width="55%"><p class="style2">${requestScope.messageErr }</p></td>
						</tr>
						<tr>
							<td><p>
									<strong>Mã sách : </strong>
								</p></td>
							<td><input name="diaryBook.bookIsbn" type="text"
								id="diaryBook.bookIsbn" size="35" class="bookisbn"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><div align="center">

									<input name="action" type="hidden" value="DIARY_BOOK" /> <input
										name="checkIn.submit" type="submit" id="checkIn.date">
								</div></td>
						</tr>
					</table>
				</form>


				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p class="right">&nbsp;</p>
			</td>
		</tr>
	</table>
	<table id="diaryuser">
		<tr>
			<th>STT</th>
			<th>Mã Sách</th>
			<th>Mã người dùng</th>
			<th>Ngày mượn</th>
			<th>Ngày phải trả</th>
			<th>Ngày trả</th>
		</tr>
		<c:forEach var="listborrow" items="${sessionScope.listborrowbook}"
			varStatus="iterationCount">
			<tr>
				<td><c:out value="${iterationCount.count }"></c:out> </td>
				<td><c:out value="${listborrow.resourceID }"></c:out>   </td>
				<td><c:out value="${listborrow.patronID }"></c:out> </td>
				<td><c:out value="${listborrow.borrowDate}"></c:out> </td>
				<td><c:out value="${listborrow.renderDate }"></c:out> </td>
				<td><c:out value="${listborrow.payDate }"></c:out></td>
			</tr>
		</c:forEach>
		<%
			if (listborrow != null) {
				for (int i = 0; i < listborrow.size(); i++) {
		%>
		<tr>
			<td><%=listborrow.get(i).getResourceID()%></td>
			<td><%=listborrow.get(i).getPatronID()%></td>
			<td><%=listborrow.get(i).getBorrowDate()%></td>
			<td><%=listborrow.get(i).getRenderDate()%></td>
			<td><%=listborrow.get(i).getPayDate()%></td>
		</tr>
		<%
			}
			}
		%>
	</table>
	<!-- 				</div> -->
	<!-- 				<div> -->
	<%-- 					<jsp:include page="footer.jsp" flush="true" /> --%>
	<!-- 				</div> -->
	<!-- 			</td> -->
	<!-- 		</tr> -->
	<!-- 	</table> -->
</body>
</html>
