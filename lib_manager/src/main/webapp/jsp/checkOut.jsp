<%@page import="manager.resource.ResourceManager"%>
<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<%@ page import="manager.resource.ResourceManager"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
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
`
<title>check out - lib manager sys</title>
<%
	String logedIn = (String) session.getAttribute("login.done");
	String roles = (String) session.getAttribute("patron.roles");
	
	//Nếu chưa đăng nhập hoặc không fải là nhân viên thư viện thì không được truy cập trang này
	if (logedIn == null || !"PATRON_LIB_MANAGER".equals(roles)) {
		response.sendRedirect("login.jsp");
	}

	String messageErr = (String) request.getAttribute("messageErr");
	if (messageErr == null) {
		messageErr = "";
	}
	ResourceManager resourcemanager = new ResourceManager();
// 	WebcamQRCodeExample webcam = new WebcamQRCodeExample();
// 	String result = webcam.getResult();
%>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/style1.css" />
<link rel="stylesheet" type="text/css" href="css/stylesugess.css" />
</head>

<body>

	<table>
		<tr valign="top">

			<td>
				<div>
<!-- 					Header -->
					<jsp:include page="header.jsp" />
<!-- 					 End Header -->
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

					<table width="710px">
						<tr valign="top">
							<td>
								<div>
									<p>Thông tin đặt sách :</p>
								</div>

								<form name="formCheckOut" method="get" action="controler">
									<table width="95%" border="0" align="center">
										<tr>
											<td width="37%">&nbsp;</td>
											<td width="63%"><p class="style2"><%=messageErr%></p></td>
										</tr>
										<tr>
											<td width="45"><p>Mã đăng nhập của người mượn:</p></td>
											<td><input name="checkOut.userID" type="text"
												id="checkOut.userID" class="userid" ></td>
<%-- 												value="<%=result %>" --%>
										</tr>
										<tr>
											<td width="45"><p>Mã của cuốn sách mượn :</p></td>
											<td><input name="checkOut.Isbn" type="text"
												id="checkOut.Isbn" class="inputtext"></td>
										</tr>
<%-- 										<% Resource resource =  resourcemanager.get();%> --%>
<!-- 										<tr> -->
<!-- 											<td width="45"><p>Tên của cuốn sách mượn :</p></td> -->
<!-- 											<td><input name="checkOut.bookName" type="text" -->
<!-- 												id="checkOut.bookName" ></td> -->
<!-- 										</tr> -->
										<tr>
											<td>&nbsp;</td>
											<td><div align="center">
													<input name="action" type="hidden" value="CHECK_OUT" /> <input
														name="checkOut.submit" type="submit" id="checkOut.submit">
														<input name="checkOut.reset" type="reset"
														id="checkOut.reset">
												</div></td>
										</tr>
									</table>
								</form>
							</td>
						</tr>
					</table>
				</div>
				<div>
					<jsp:include page="footer.jsp" flush="true" />
				</div>
			</td>
		</tr>
	</table>

</body>
</html>
