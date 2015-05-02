

<%
	String logedIn = (String) session.getAttribute("login.done");
	String roles = (String) session.getAttribute("patron.roles");
%>
<link rel="stylesheet" type="text/css" href="css/sidebar.css" />
<link rel="stylesheet" type="text/css" href="css/style1.css" />



<div class="wrapsidebar">
	<div>
		<img src="img/text_1.gif">
	</div>

	<div align="left">
		<div id='cssmenu'>
			<ul>
				<li class='active'><a href='#'><span>Home</span></a></li>
				<li class='has-sub'><a href='#'><span>Bạn Đọc</span></a>
					<ul>
						<li><a href='index.jsp'><span>Tìm Kiếm</span></a></li>
						<%
							if (logedIn != null) {
						%>
						<li class='last'><a href='request.jsp'><span>Đặt
									Sách</span></a></li>
						<%
							}
						%>

					</ul></li>
				<%
					if ("PATRON_LIB_MANAGER".equals(roles)) {
				%>
				<li class='has-sub'><a href='#'><span>Action</span></a>
					<ul>
						<li><a href='checkOut.jsp'><span>Cho mượn tài
									nguyên</span></a></li>
						<li class='last'><a href='checkIn.jsp'><span>Trả
									tài nguyên</span></a></li>
					</ul>
				</li>
				<li class='has-sub'><a href='#'><span>Nhật kí mượn trả</span></a>
					<ul>
						<li><a href='diaryuser.jsp'><span>Người dùng</span></a></li>
						<li class='last'><a href='diarybook.jsp'><span>Book</span></a></li>
					</ul>
				</li>
				<li class='last'><a href='#'><span>Manager</span></a>
					<ul>
						<li><a href='editBook.jsp'><span>Thêm Sách</span></a></li>
						<li><a href='deleteResource.jsp'><span>Xóa Sách</span></a></li>
						<li><a href='editPatron.jsp'><span>Thêm Bạn Đọc</span></a></li>
						<li><a href='editPatron.jsp'><span>Cập Nhật Bạn
									Đọc</span></a></li>
						<li class='last'><a href='deletePatron.jsp'><span>Xóa
									Bạn Đọc</span></a></li>
					</ul></li>
				<%
					}
				%>
				<%
					if ("PATRON_STUDENT".equals(roles)) {
				%>
				<li class='last'><a href='#'><span>Tài Nguyên</span></a>
					<ul>
						<li><a href='#'><span>Tài Nguyên Đã Mượn</span></a></li>
						<li class='last'><a href='#'><span>Tài Nguyên Yêu
									Cầu</span></a></li>
					</ul></li>
				<%
					}
				%>
			</ul>
		</div>
	</div>
</div>


