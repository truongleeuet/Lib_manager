<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="manager.resource.Resource"%>
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
						<!--  <script>
	$('.nav li a').click(function(e) {
		alert('clicked');
		var $this = $(this);
		if (!$this.hasClass('active')) {
			$this.addClass('active');
		}
		//e.preventDefault();
	});
</script>-->
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
						<title>Book info - Lib Manager Sys</title> <%
 	String logedIn = (String) session.getAttribute("login.done");
 	String roles = (String) session.getAttribute("patron.roles");
 	//logedIn = "nttuyen";
 	Resource book = (Resource) request.getAttribute("book_edit");
 	if (book == null) {
 		book = new Resource();
 	}
 %>
						<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>

<body>


	<div>
		<tableb width="710px">
		<tr valign="top">
			<td width="45%">
				<div>
					<p class="style1">Thông tin cuốn sách</p>
				</div>

				<table>
					<tr>
						<td rowspan="8"><img src="<%=book.getImages()%>" width="200"
							height="270" alt="" /></td>
						<td width="39%"><p>
								<strong>Mã sách : </strong>
							</p></td>
						<td width="59%"><p><%=book.getIsbn()%></p></td>
						<td width="2%">&nbsp;</td>
					</tr>
					<tr>
						<td><p>
								<strong>Tên sách : </strong>
							</p></td>
						<td><p><%=book.getName()%></p></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><p>
								<strong>Tên sách : </strong>
							</p></td>
						<td><p>${requestScope.book_edit.name }</p></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><p>
								<strong>Thuộc lĩnh vực : </strong>
							</p></td>
						<td><p><%=book.getCategories()%></p></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><p>
								<strong>Tác giả : </strong>
							</p></td>
						<td><p><%=book.getAuthors()%></p></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><p>
								<strong>Nhà xuất bản : </strong>
							</p></td>
						<td><p><%=book.getPublisher()%></p></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><p>
								<strong>Năm xuất bản : </strong>
							</p></td>
						<td><p><%=book.getPublished()%></p></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><p>
								<strong>Số lượng trong thư viện : </strong>
							</p></td>
						<td><p><%=book.getAmount()%></p></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td valign="top"><p>
								<strong>Miêu tả về cuốn sách : </strong>
							</p></td>

						<td><textarea name="book.description" id="book.description"
								cols="35" rows="5"><%=book.getDescription()%></textarea></td>
						<td>&nbsp;</td>

						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><div align="center"></div></td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
		</table>
	</div>


</body>
</html>
