<%@page import="manager.resource.Resource"%>
<%@page import="java.util.ArrayList"%>
<%@page import="manager.resource.ResourceManager"%>
<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<%@page import="java.util.List"%>
<%@page import="manager.*"%>

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
	String logedIn = (String) session.getAttribute("login.done");
	String roles = (String) session.getAttribute("patron.roles");
	//logedIn = "nttuyen";
	//Nếu chưa đăng nhập hoặc không fải là nhân viên thư viện thì không được truy cập trang này
// 	if (!"PATRON_FACULTY".equals(roles) || !"PATRON_STUDENT".equals(roles)) {
// 		response.sendRedirect("login.jsp");
// 	}
	ResourceRequestManager requestmanager = new ResourceRequestManagetImpl();
	List<ResourceRequest> listrequest = requestmanager.getAllByPatron(logedIn);
	if (listrequest == null) {
		listrequest = new ArrayList<ResourceRequest>();
	}
	String messageErr = (String) request.getAttribute("messageErr");
	if (messageErr == null) {
		messageErr = "";
	}
	ResourceManager resourcemanager = new ResourceManager();
	Resource resource = new Resource();
%>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/style1.css" />
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
										<p><%=listrequest.size()%></p>
									</div>
									<table id="diaryuser">
										<tr>
											<th>Mã người dùng</th>
											<th>Mã Sách</th>
											<th>Tên Sách</th>
											<th>Ngày mượn</th>
										</tr>
										<%
											if (listrequest != null) {
												for (int i = 0; i < listrequest.size(); i++) {
										%>
										<tr>
											<td><%=listrequest.get(i).getPatronID()%></td>
											<td><%=listrequest.get(i).getResourceID()%></td>
											<td><%=resourcemanager.get(listrequest.get(i).getResourceID()).getName()%></td>
											<td><%=listrequest.get(i).getBorrowDate()%></td>
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
