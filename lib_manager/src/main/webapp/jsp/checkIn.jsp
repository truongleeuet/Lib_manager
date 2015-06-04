<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript" src="jquery/jquery-1.4.2.min.js"></script>
<script src="jquery/jquery.autocomplete.js"></script>

<script>
	jQuery(function() {
		$(".inputtext").autocomplete("listbook.jsp");
	});
</script>
<script>
	jQuery(function() {
		$(".userid").autocomplete("listpatron.jsp");
	});
</script>
<title>check in - lib manager sys</title>
<!--Đoạn mã đọc session để kiểm tra xem đã đăng nhập chưa,
	Nếu rồi thì đó là sinh viên, giảng viên hay nhân viên thư viện -->
<%
	//String logedIn = (String) session.getAttribute("login.done");
// 	String roles = (String) session.getAttribute("patron_roles");

	//roles = "PATRON_LIB_MANAGER";
	//Nếu chưa đăng nhập hoặc không fải là nhân viên thư viện thì không được truy cập trang này

// 	if (logedIn == null || !"PATRON_LIB_MANAGER".equals(roles)) {
// 		response.sendRedirect("login.jsp");
// 	}

// 	String messageErr = (String) request.getAttribute("messageErr");
// 	if (messageErr == null) {
// 		messageErr = "";
// 	}
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
	<!-- 						<p align="center">..:: Home &gt; Đặt sách::..</p> -->
	<!-- 					</div> -->

	<c:if test="${sessionScope.login_done eq null}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<table width="710px">
		<tr valign="top">
			<td>
				<div>
					<p class="style1">Thông tin Trả tài nguyên:</p>
				</div> <!---Form nhập thông tin để trả sách-->

				<form name="formCheckIn" method="get" action="controler">
					<table width="95%" border="0" align="center">
						<tr>
							<td width="45%">&nbsp;</td>
							<td width="55%"><p class="style2">${requestScope.messageErr}</p></td>
						</tr>
						<tr>
							<td><p>
									<strong>Mã đăng nhập của người mượn : </strong>
								</p></td>
							<td><input name="checkIn.userID" type="text"
								id="checkIn.userName" class="userid"></td>
						</tr>
						<tr>
							<td><p>
									<strong>Mã tài nguyên mượn : </strong>
								</p></td>
							<td><input name="checkIn.Isbn" type="text" id="checkIn.Isbn"
								size="45" class="inputtext"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><div align="center">

									<input name="action" type="hidden" value="CHECK_IN" /> <input
										name="checkIn_type" type="hidden" value="LOAD" /> <input
										name="checkIn.submit" type="submit" id="checkIn.date">
										<input name="checkIn.reset" type="reset" id="checkIn.reset">
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
	<!-- 				</div> -->
	<!-- 				<div> -->
	<%-- 					<jsp:include page="footer.jsp" flush="true" /> --%>
	<!-- 				</div> -->
	<!-- 			</td> -->
	<!-- 		</tr> -->
	<!-- 	</table> -->
</body>
</html>
