<%@page import="manager.resource.ResourceManager"%>
<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<%@  include file="listbook.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- <script type="text/javascript" src="jquery/jquery-1.11.2.min.js"></script> -->
<!-- 	<script type="text/javascript" src="https://code.jquery.com/jquery-1.4.2.min.js"></script> -->
<!-- <script src="jquery/autocompleter.js"></script> -->


<!-- <link rel="stylesheet" -->
<!-- 	href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"> -->
<script type="text/javascript" src="jquery/jquery-1.11.2.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.11.2/jquery-ui.min.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script>
	$(document).ready(function() {
		$(function() {
			$(".book_isbn,#tags").autocomplete({

				source : function(request, response) {
					$.ajax({
						url : "/lib_manager/jsp/controler",
						type : "GET",
						data : {
							term : request.term
						},
						dataType : "json",
						success : function(data) {
							response(data);
						}
					});
				}
			});
		});
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
	//ResourceManager resourcemanager = new ResourceManager();
	// 	WebcamQRCodeExample webcam = new WebcamQRCodeExample();
	// 	String result = webcam.getResult();
%>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/autocomplete.css" />
</head>

<body>

	<table>
		<tr valign="top">

			<td>
				<div>
					<!-- 										Header -->
					<jsp:include page="header.jsp" />
					<!-- 										 End Header -->
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

					<div>
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
													id="checkOut.userID" class="user_id"></td>
											</tr>
											<tr>
												<td width="45"><p>Mã của cuốn sách mượn :</p></td>
												<td><input name="checkOut.Isbn" type="text"
													id="checkOut.Isbn" class="book_isbn"></td>
											</tr>
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
									<div class="ui-widget">
										<label for="tags">Tags: </label> <input id="tags">
									</div>
									<div class="search-container">
										<div class="ui-widget">
											<input  id="search" />
										</div>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>

				<div>
					<jsp:include page="footer.jsp" flush="true" />
				</div>
			</td>
		</tr>
	</table>

</body>
</html>
