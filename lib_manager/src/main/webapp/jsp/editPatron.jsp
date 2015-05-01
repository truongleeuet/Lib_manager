<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="manager.user.Patron"%>
<%@page import="manager.user.Student"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="manager.user.Faculty"%>
<%@page import="manager.user.LibStaffManager"%>
<%@page import="manager.user.LibManager"%>
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
									 			alert('clicked');
									//e.preventDefault();
									$('ul.nav > li ').removeClass('active');
									$(this).addClass('active');
								});
							});
						</script>
<title>edit patron - Lib manager Sys</title>


<%
	String logedIn = (String) session.getAttribute("login.done");
	String roles = (String) session.getAttribute("patron.roles");
	//logedIn = "nttuyen";
	if (logedIn == null || !"PATRON_LIB_MANAGER".equals(roles)) {
		response.sendRedirect("login.jsp");
	}
	String action = null;
	//Lấy ra đối tượng bạn đọc cần update
	Patron patron = (Patron) request.getAttribute("patron_edit");
	//Nếu có đối tượng update
	if (patron != null) {
		action = "UPDATE_PATRON";
	} else {
		//Nếu không có thì coi như tạo mới
		patron = new Student();
		action = "ADD_PATRON";
	}
	//Format ngày sinh của bạn đọc theo đúng định dạng
	DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
	String date = df.format(patron.getBirthday());

	//Tuỳ theo kiểu bạn đọc mà ta tạo đối tượng nào cho đúng
	Student student = new Student();
	Faculty faculty = new Faculty();
	LibManager libManager = new LibManager();
	String type = patron.getType();
	int selection = -1;
	if ("PATRON_STUDENT".equals(type)) {
		selection = 0;
		student = (Student) patron;
	} else if ("PATRON_FACULTY".equals(type)) {
		selection = 1;
		faculty = (Faculty) patron;
	} else if ("PATRON_LIB_MANAGER".equals(type)) {
		selection = 2;
		libManager = (LibManager) patron;
	}
	System.out.println("editPatron : " + patron.getUser_name());
%>

<link rel="stylesheet" type="text/css" href="style.css">

	<link rel="stylesheet" type="text/css" media="all"
		href="jscalendar/skins/aqua/theme.css" title="Aqua" />
	<link rel="alternate stylesheet" type="text/css" media="all"
		href="jscalendar/calendar-blue.css" title="winter" />
	<link rel="alternate stylesheet" type="text/css" media="all"
		href="jscalendar/calendar-blue2.css" title="blue" />
	<link rel="alternate stylesheet" type="text/css" media="all"
		href="jscalendar/calendar-brown.css" title="summer" />
	<link rel="alternate stylesheet" type="text/css" media="all"
		href="jscalendar/calendar-green.css" title="green" />
	<link rel="alternate stylesheet" type="text/css" media="all"
		href="jscalendar/calendar-win2k-1.css" title="win2k-1" />
	<link rel="alternate stylesheet" type="text/css" media="all"
		href="jscalendar/calendar-win2k-2.css" title="win2k-2" />
	<link rel="alternate stylesheet" type="text/css" media="all"
		href="jscalendar/calendar-win2k-cold-1.css" title="win2k-cold-1" />

	<link rel="alternate stylesheet" type="text/css" media="all"
		href="jscalendar/calendar-win2k-cold-2.css" title="win2k-cold-2" />
	<link rel="alternate stylesheet" type="text/css" media="all"
		href="jscalendar/calendar-system.css" title="system" />

	<script type="text/javascript" src="jscalendar/calendar.js"></script>
	<script type="text/javascript" src="jscalendar/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar/calendar-setup.js"></script>


	<script src="prototype.js"></script>
	
	<script type="text/javascript">
		function patron_type() {
			var student = $("patron_student");
			student.style.display = 'none';
			var faculty = $("patron_faculty");
			faculty.style.display = 'none';
			var libManager = $("patron_libManager");
			libManager.style.display = 'none';
	<%if (selection == 0) {%>
		student.style.display = 'block';
	<%} else if (selection == 1) {%>
		faculty.style.display = 'block';
	<%} else if (selection == 2) {%>
		libManager.style.display = 'block';
	<%}%>
		}
		function patron_change(selObj, restore) { //v3.0
			//eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
			if (restore)
				selObj.selectedIndex = 0;

			var student = $("patron_student");
			var faculty = $("patron_faculty");
			var libManager = $("patron_libManager");

			//else selObj.selectedIndex=1;
			if (selObj.selectedIndex == 0) {
				student.style.display = 'block';
				faculty.style.display = 'none';
				libManager.style.display = 'none';

			} else if (selObj.selectedIndex == 1) {
				faculty.style.display = 'block';
				student.style.display = 'none';
				libManager.style.display = 'none';
			} else if (selObj.selectedIndex == 2) {
				student.style.display = 'none';
				faculty.style.display = 'none';
				libManager.style.display = 'block';
			}
		}
	</script>
	<style type="text/css">
<!--
.style1 {
	font-size: 14px;
	color: #999999;
	font-weight: bold;
}
-->
</style>
</head>

<body leftmargin=0 topmargin=0 marginheight="0" marginwidth="0"
	bgcolor="#ffffff" onLoad="patron_type();">

	<table border="0" cellspacing="0" cellpadding="0" width="100%"
		height="100%">
		<tr valign="top">
			<td width="50%" background="images/bg.gif"><img
				src="images/px1.gif" width="1" height="1" alt="" border="0"></td>
			<td valign="bottom" background="images/bg_left.gif"><img
				src="images/bg_left.gif" alt="" width="17" height="16" border="0"></td>
			<td>
				<table border="0" cellpadding="0" cellspacing="0" width="780"
					height="107">
					<tr valign="bottom">
						<td><img src="images/logo.gif" width="183" height="107"
							alt="" border="0"></td>
						<td width="673" background="images/fon_top.gif">
							<table border="0" cellpadding="0" cellspacing="0" background="">
								<ul class="nav nav-pills">

									<li class="active"><a href="#"><span
											class="glyphicon glyphicon-home"></span> HOME</a></li>
									<li><a href="Book.jsp"><span class="glyphicon glyphicon-book"></span>
											BOOK</a></li>
									<li><a href="#"><span class="glyphicon glyphicon-cd"></span>
											CD</a></li>
									<li><a href="#"><span><img width="10px"
												height="20px" src="images/requesticon.jpg"></span> REQUEST</a></li>
									<li><a href="#"><span><img width="10px"
												height="20px" src="images/contact_us_icon.png"></span>
											CONTACT</a></li>
									<li><a href="#"><span><img width="10px"
												height="20px" src="images/support.png"></span> SUPPORT</a></li>
								</ul>
							</table>
						</td>
					</tr>
				</table>
				<table border="0" cellpadding="0" cellspacing="0" width="780"
					height="107">
					<tr valign="top">
						<td bgcolor="#D0E0ED">
							<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td bgcolor="#076BA7">
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td><img src="images/text_1.gif" width="183"
													height="67"></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<div align="center"></div>
							<div align="center"></div>

							<div align="left">
								<p></p>
								<p class="left">
									<img src="images/e01.gif" width="14" height="16" alt=""
										border="0" align="absmiddle">&nbsp;&nbsp;BẠN ĐỌC 
								</p>
								<p class="left">
									<img src="images/dot_o.gif" width="5" height="5" alt=""
										border="0">&nbsp;&nbsp;<a href="index.jsp">Tìm kiếm
									</a>
								</p>
								<p class="left">
									<img src="images/dot_o.gif" width="5" height="5" alt=""
										border="0">&nbsp;&nbsp;<a href="request.jsp">Đặt
											sách </a>
								</p>
								<p class="left">&nbsp;</p>
							</div>

							<hr>


								<div align="left">
									<p class="left">
										<img src="images/e01.gif" width="14" height="16" alt=""
											border="0" align="absmiddle">&nbsp;ACTION 
									</p>
									<p class="left">
										<img src="images/dot_o.gif" width="5" height="5" alt=""
											border="0">&nbsp;&nbsp;<a href="checkOut.jsp">Cho
												mượn tài nguyên </a>
									</p>
									<p class="left">
										<img src="images/dot_o.gif" width="5" height="5" alt=""
											border="0">&nbsp;&nbsp;<a href="checkIn.jsp">Trả
												tài nguyên </a>
									</p>
								</div>

								<hr />


								<div align="left">
									<p class="left">
										<img src="images/e01.gif" width="14" height="16" alt=""
											border="0" align="absmiddle">&nbsp;MANAGER 
									</p>
									<p class="left">
										<img src="images/dot_o.gif" width="5" height="5" alt=""
											border="0">&nbsp;&nbsp;<a href="editBook.jsp">Thêm
												sách </a>
									</p>
									<p class="left">
										<img src="images/dot_o.gif" width="5" height="5" alt=""
											border="0">&nbsp;&nbsp;<a href="editCD.jsp">Thêm CD
										</a>
									</p>

									<p class="left">
										<img src="images/dot_o.gif" width="5" height="5" alt=""
											border="0">&nbsp;&nbsp;<a href="deleteResource.jsp">Xoá
												tài liệu </a>
									</p>
									<p></p>
									<p class="left">
										<img src="images/dot_o.gif" width="5" height="5" alt=""
											border="0">&nbsp;&nbsp;<a href="editPatron.jsp">Thêm
												bạn đọc </a>
									</p>
									<p class="left">
										<img src="images/dot_o.gif" width="5" height="5" alt=""
											border="0">&nbsp;&nbsp;<a href="updatePatron.jsp">Cập
												nhật bạn đọc </a>
									</p>
									<p class="left">
										<img src="images/dot_o.gif" width="5" height="5" alt=""
											border="0">&nbsp;&nbsp;<a href="deletePatron.jsp">Xoá
												bạn đọc </a>
									</p>
								</div>


								<br><br>
						</td>

						<td rowspan="2">
							<div align="center">
								<img src="images/top01.gif" width="597" height="24" alt=""
									border="0">
							</div>

							<div align="center">
								<table width="100%" border="0">
									<tr>
										<td width="6%" height="30">&nbsp;</td>
										<td width="66%">
											<p align="center">..:: Home &gt; Bạn đọc ::..</p>
										</td>
										<td width="28%">
											<p align="right">
												<a href="login.jsp"> <%=logedIn%>
												</a>|<a href="login.jsp"> Logout </a>
											</p>
										</td>
									</tr>
								</table>
							</div>

							<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr valign="top">
									<td width="45%">
										<p></p>
										<p class="style1">Thông tin bạn đọc :</p>


										<form name="formEditPatron" method="post" action="controler">
											<table width="95%" border="0" align="center">
												<tr>
													<td width="29%"><p>
															<strong>Tên đăng nhập : </strong>
														</p></td>
													<td width="71%"><input name="patron.userName"
														type="text" id="patron.userName" size="35"
														value="<%=patron.getUser_name()%>" /></td>
												</tr>
												<tr>
													<td><p>
															<strong>Mật khẩu : </strong>
														</p></td>
													<td><input name="patron.password" type="text"
														id="patron.password" size="35"
														value="<%=patron.getUser_password()%>" /></td>
												</tr>
												<tr>
													<td><p>
															<strong>Họ tên : </strong>
														</p></td>
													<td><input name="patron.fullName" type="text"
														id="patron.fullName" size="35"
														value="<%=patron.getFull_name()%>" /></td>
												</tr>
												<tr>
													<td><p>
															<strong>Ngày sinh : </strong>
														</p></td>
													<td><input name="patron.birthday" type="text"
														id="patron.birthday" size="35" value="<%=date%>" /></td>
												</tr>
												<tr>
													<td><p>
															<strong>e - Mail : </strong>
														</p></td>
													<td><input name="patron.email" type="text"
														id="patron.email" size="35" value="<%=patron.getEmail()%>" /></td>
												</tr>
												<tr>
													<td><p>
															<strong>Địa chỉ : </strong>
														</p></td>
													<td><input name="patron.address" type="text"
														id="patron.address" size="35"
														value="<%=patron.getAddress()%>" /></td>
												</tr>
												<tr>
													<td height="30"><p>
															<strong>Chức vụ : </strong>
														</p></td>
													<td><select name="patron.roles" id="patron.roles" onchange="patron_change(this,0);">
															<option value="PATRON_STUDENT">Sinh viên</option>
															<option value="PATRON_FACULTY">Giảng viên</option>
															<option value="PATRON_LIB_MANAGER">Nhân viên thư viện</option>
													</select></td>
												</tr>
											</table>
											<div id="patron_student">
												<table width="95%" border="0" align="center">
													<tr>
														<td width="29%"><p>
																<strong>Mã sinh viên : </strong>
															</p></td>
														<td width="71%"><input name="student.id" type="text"
															id="student.id" size="35"
															value="<%=student.getStudentID()%>" /></td>
													</tr>
													<tr>
														<td><p>
																<strong>Lớp : </strong>
															</p></td>
														<td><input name="student.classrom" type="text"
															id="student.classrom" size="35"
															value="<%=student.getClassrom()%>" /></td>
													</tr>
													<tr>
														<td><p>
																<strong>Khoa : </strong>
															</p></td>
														<td><input name="student.department" type="text"
															id="student.department" size="35"
															value="<%=student.getDepartment()%>" /></td>
													</tr>
												</table>
											</div>
											<div id="patron_faculty">
												<table width="95%" border="0" align="center">
													<tr>
														<td width="29%"><p>
																<strong>Khoa : </strong>
															</p></td>
														<td width="71%"><input name="faculty.department"
															type="text" id="faculty.department" size="35"
															value="<%=faculty.getDepartment()%>" /></td>
													</tr>
													<tr>
														<td><p>
																<strong>Môn dạy : </strong>
															</p></td>
														<td><input name="department.subjects" type="text"
															id="faculty.subjects" size="35"
															value="<%=faculty.getSubjects()%>" /></td>
													</tr>
												</table>
											</div>
											<div id="patron_libManager">
												<table width="95%" border="0" align="center">
													<tr>
														<td width="29%"><p>
																<strong>Chức năng : </strong>
															</p></td>
														<td width="71%"><input name="libManager.permission"
															type="text" id="libManager.permission" size="35"
															value="<%=libManager.getPermission()%>" /></td>
													</tr>
												</table>
											</div>
											<div id="fuction">
												<table width="95%" border="0" align="center">
													<tr>
														<td width="30%" height="21">&nbsp;</td>
														<td width="53%"><div align="center">
																<input name="action" type="hidden" value="<%=action%>" />
																<input name="patron.submit" type="submit"
																	id="patron.submit" value="Save" /> <input
																	name="patron.reset" type="reset" id="patron.reset" />
															</div></td>
														<td width="17%">&nbsp;</td>
													</tr>
													<tr>
														<td>&nbsp;</td>
														<td>&nbsp;</td>
														<td>&nbsp;</td>
													</tr>
												</table>
											</div>
										</form> <script type="text/javascript">
											Calendar.setup({
												inputField : "patron.birthday", // ID of the input field
												ifFormat : "%d/%m/%Y", // the date format
												button : "patron.birthday" // ID of the button
											});
										</script>


										<p class="right">&nbsp;</p>
									</td>
								</tr>
							</table>

							<div align="center">
								<img src="images/hr01.gif" width="556" height="11" alt=""
									border="0" />
							</div>
						</td>
						<td rowspan="2">&nbsp;</td>
					</tr>
					<tr valign="bottom" bgcolor="#D0E0ED">
						<td><img src="images/bot_left.gif" width="183" height="21"
							alt="" border="0" /></td>
					</tr>
				</table>
				<table border="0" cellpadding="0" cellspacing="0" width="780"
					height="64" background="images/fon_bot.gif">
					<tr valign="top">
						<td>
							<table border="0" cellpadding="0" cellspacing="0" width="780"
								background="">
								<tr>
									<td width="300"><p class="menu02">Copyright &copy;2015truonglee</p></td>
									<td>
										<p class="menu02">
											<a href="">Home</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <a
												href="">About Us</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <a
												href="">Support</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <a
												href="">Services</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <a
												href="">Contacts</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <a
												href="">Help</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <a
												href="">FAQ</a>
										</p>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
			<td valign="bottom" background="images/bg_right.gif"><img
				src="images/bg_right.gif" alt="" width="17" height="16" border="0"></td>
			<td width="50%" background="images/bg.gif"><img
				src="images/px1.gif" width="1" height="1" alt="" border="0"></td>
		</tr>
	</table>

</body>
</html>
