<script type="text/javascript" src="jquery/jquery-1.11.2.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(document).ready(function() {
		$('#cssmenu li.active').children('ul').show();
		$('#cssmenu li.has-sub>a').on('click', function() {
			$(this).removeAttr('href');
			var element = $(this).parent('li');
			if (element.hasClass('active')) {
				element.removeClass('active');
				element.find('li').removeClass('active');
				element.find('ul').slideUp();
			} else {
				element.addClass('active');
				element.children('ul').slideDown();
				element.siblings('li').children('ul').slideUp();
				element.siblings('li').removeClass('active');
				element.siblings('li').find('li').removeClass('active');
				element.siblings('li').find('ul').slideUp();
			}
		});

	});
</script>

<%
	// 	String logedIn = (String) session.getAttribute("login_done");
// 	String roles = (String) session.getAttribute("patron_roles");
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
						<c:if test="${sessionScope.login_done ne null }">
							<li class='last'><a href='request.jsp'><span>Đặt
										Sách</span></a></li>
						</c:if>
					</ul></li>
				<c:if test="${sessionScope.patron_roles eq 'PATRON_LIB_MANAGER' }">

					<li class='has-sub'><a href='#'><span>Action</span></a>
						<ul>
							<li><a href='checkOut.jsp' target="iframe_book"><span>Cho
										mượn tài nguyên</span></a></li>
							<li class='last'><a href='checkIn.jsp' target="iframe_book"><span>Trả
										tài nguyên</span></a></li>
						</ul></li>
					<li class='has-sub'><a href='#'><span>Nhật kí mượn
								trả</span></a>
						<ul>
							<li><a href='diaryuser.jsp' target="iframe_book"><span>Người
										dùng</span></a></li>
							<li class='last'><a href='diarybook.jsp'
								target="iframe_book"><span>Book</span></a></li>
						</ul></li>
					<li class='has-sub'><a href='#'><span>Manager</span></a>
						<ul>
							<li><a href='editBook.jsp' target="iframe_book"><span>Thêm
										Sách</span></a></li>
							<li><a href='deleteResource.jsp' target="iframe_book"><span>Xóa
										Sách</span></a></li>
							<li><a href='newPatron.jsp' target="iframe_book"><span>Thêm
										Bạn Đọc</span></a></li>
							<li><a href='editPatron.jsp' target="iframe_book"><span>Cập
										Nhật Bạn Đọc</span></a></li>
							<li class='last'><a href='deletePatron.jsp'
								target="iframe_book"><span>Xóa Bạn Đọc</span></a></li>
						</ul></li>

				</c:if>
				<c:if test="${(sessionScope.patron_roles eq 'PATRON_STUDENT') or (sessionScope.patron_roles eq 'PATRON_FACULTY' )}">
			
				<li class='has-sub'><a href='#'><span>Tài Nguyên</span></a>
					<ul>
						<li><a href='borrowed.jsp'><span>Tài Nguyên Đã
									Mượn</span></a></li>
						<li class='last'><a href='requested.jsp'><span>Tài
									Nguyên Yêu Cầu</span></a></li>
					</ul></li>
			
				</c:if>
			</ul>
		</div>
	</div>
</div>


