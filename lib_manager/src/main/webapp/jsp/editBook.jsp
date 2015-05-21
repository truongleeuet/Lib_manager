<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"
	language="java" import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="manager.resource.Resource"%>
<%@ page import="support.WebcamQRCodeExample"%>
<%@ page import="support.JSONSimpleReadingFromFileExample"%>
<%@ page import="com.github.sarxos.webcam.*"%>
<%@ page import="com.google.zxing.*"%>
<%@ page
	import="com.google.zxing.client.j2se.BufferedImageLuminanceSource"%>
<%@ page import="com.google.zxing.common.HybridBinarizer"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<title>Book info - Lib Manager Sys</title>
<%
	String logedIn = (String) session.getAttribute("login.done");
	String roles = (String) session.getAttribute("patron.roles");
	//logedIn = "nttuyen";
	//Nếu không fải là nhân viên thư viện thì không được truy cập trang này
	if (logedIn == null || !"PATRON_LIB_MANAGER".equals(roles)) {
		response.sendRedirect("login.jsp");
	}
	String action = null;
	Resource book = (Resource) request.getAttribute("book_edit");
	//Resource book1 = (Resource) session.getAttribute("bookinfo");

	//session.setAttribute("bookinfo", book1);

	if (book == null) {
		action = "ADD_BOOK";
		book = new Resource();
	} else {
		action = "UPDATE_BOOK";
	}

	WebcamQRCodeExample webcam = new WebcamQRCodeExample();

	Resource book1 = null;
	try {
		book1 = new Resource();
		JSONSimpleReadingFromFileExample json = new JSONSimpleReadingFromFileExample();
		book1 = json.getInfo(webcam.getResult());
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
%>


<link rel="stylesheet" type="text/css" href="css/style.css" />

</head>

<body>

	<!-- 	<table> -->
	<!-- 		<tr valign="top"> -->

	<!-- 			<td> -->
	<!-- 				<div> -->
	<!-- 					Header -->
	<%-- 					<jsp:include page="header.jsp" /> --%>
	<!-- 					End Header -->
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
	<table>
		<tr valign="top">
			<td width="45%">
				<div>
					<p class="style1">Thông tin cuốn sách</p>

				</div>
				<form name="formEditBook" action="controler" method="get">
					<table width="100%" border="0" align="center">
						<tr>
							<td rowspan="9"><img src="<%=book1.getImages()%>"
								width="200" height="270" alt="" />
							</td>
							<td><p>
									<strong>Mã ISBN : </strong>
								</p></td>
							<td width="45%"><input name="book.isbn" type="text"
								id="book.isbn" size="35" value="<%=book1.getIsbn()%>" /></td>
						</tr>
						<tr>
							<td><p>
									<strong>Tên sách : </strong>
								</p></td>
							<td><input name="book.name" type="text" id="book.name"
								size="35" value="<%=book1.getName()%>" /></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><p>
									<strong>Thuộc lĩnh vực : </strong>
								</p></td>
							<td><input name="book.domain" type="text" id="book.domain"
								size="35" value="<%=book1.getCategories()%>" /></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><p>
									<strong>Tác giả : </strong>
								</p></td>
							<td><input name="book.authors" type="text" id="book.authors"
								size="35" value="<%=book1.getAuthors()%>" /></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><p>
									<strong>Nhà xuất bản : </strong>
								</p></td>
							<td><input name="book.publisher" type="text"
								id="book.publisher" size="35" value=<%=book1.getPublisher()%> /></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><p>
									<strong>Số trang : </strong>
								</p></td>
							<td><input name="book.pages" type="text" id="book.pages"
								size="35" value=<%=book1.getPages()%> /></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><p>
									<strong>Năm xuất bản : </strong>
								</p></td>
							<td><input name="book.publishYear" type="text"
								id="book.publishYear" size="35"
								value="<%=book1.getPublished()%>" /></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><p>
									<strong>Số lượng trong thư viện : </strong>
								</p></td>
							<td><input name="book.amount" type="text" id="book.amount"
								size="35" value="<%=book1.getAmount()%>" /></td>
							<td>&nbsp;</td>
						</tr>
<!-- 						<tr> -->
<!-- 							<td><p> -->
<!-- 									<strong>Hình ảnh về cuốn sách : </strong> -->
<!-- 								</p></td> -->
<!-- 							<td><input name="book.images" type="text" id="book.images" -->
<%-- 								size="35" value="<%=book1.getImages()%>" /></td> --%>
<!-- 							<td>&nbsp;</td> -->
<!-- 						</tr> -->
						<tr>
							<td valign="top"><p>
									<strong>Miêu tả về cuốn sách : </strong>
								</p></td>
							<td><textarea name="book.description" id="book.description"
									cols="35" rows="5"><%=book1.getDescription()%></textarea></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><div align="center">
									<input name="action" type="hidden" value="<%=action%>" /> <input
										name="book.submit" type="submit" id="book.submit" value="Save" />
									<input name="book.reset" type="reset" id="book.reset" />
								</div></td>
							<td>&nbsp;</td>
						</tr>
					</table>
				</form>
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
