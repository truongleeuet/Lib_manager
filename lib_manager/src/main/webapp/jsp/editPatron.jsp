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

<script type="text/javascript" src="jquery/jquery-1.11.2.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.11.2/jquery-ui.min.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

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
	DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
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
<!-- 	<script src="prototype.js"></script> -->

<script type="text/javascript">
	function patron_type() {
		var student = document.getElementById("patron_student");
		student.style.display = 'block';
		var faculty = document.getElementById("patron_faculty");
		faculty.style.display = 'none';
		var libManager = document.getElementById("patron_libManager");
		libManager.style.display = 'none';
		<%if (selection == 0) {%>
			student.style.display = 'block';
		<%} else if (selection == 1) {%>
			faculty.style.display = 'none';
		<%} else if (selection == 2) {%>
			libManager.style.display = 'none';
		<%}%>
	// 	alert("Page is loaded");
	}
	function patron_change(x) {
		var whichSelected = x.selectedIndex;
		var sel = x.options[whichSelected].text;
		var student = document.getElementById("patron_student");
		var faculty = document.getElementById("patron_faculty");
		var libManager = document.getElementById("patron_libManager");
		if (sel === 'Sinh viên') {
			student.style.display = 'block';
			faculty.style.display = 'none';
			libManager.style.display = 'none';
		} else if (sel === 'Giảng viên') {
			faculty.style.display = 'block';
			student.style.display = 'none';
			libManager.style.display = 'none';
		}else if (sel === 'Nhân viên thư viện') {
			student.style.display = 'none';
			faculty.style.display = 'none';
			libManager.style.display = 'block';
		}

	}
</script>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body onLoad="patron_type();">

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
						<p align="center">..:: Home &gt; Đặt sách::..</p>
					</div>
					<table>
						<tr valign="top">
							<td width="45%">
								<p></p>
								<p class="style1">Thông tin bạn đọc :</p>


								<form name="formEditPatron" method="get" action="controler">
									<table width="95%" border="0" align="center">
										<tr>
											<td width="29%"><p>
													<strong>Mã đăng nhập : </strong>
												</p></td>
											<td width="71%"><input name="patron.userID" type="text"
												id="patron.userID" size="35"
												value="<%=patron.getUser_id()%>" /></td>
										</tr>
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
											<td><input name="patron.birthday" type="date"
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
											<td><select name="patron.roles" id="patron.roles"
												onchange="patron_change(this);">
													<option value="PATRON_STUDENT">Sinh viên</option>
													<option value="PATRON_FACULTY">Giảng viên</option>
													<option value="PATRON_LIB_MANAGER">Nhân viên thư
														viện</option>
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
								</form>

								<p class="right">&nbsp;</p>
							</td>
						</tr>
					</table>

				</div>
				<div>
					<%@include file="footer.jsp"%>
				</div>
			</td>
		</tr>
	</table>

</body>
</html>
