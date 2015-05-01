<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="manager.resource.*"%>
<%@page import="manager.user.*"%>
<%@page import="sql.*"%>

<%
	StudentManager studentmanager = new StudentManager();
	List<Patron> liststudent = studentmanager.gets();
	FacultyManager facultymanager = new FacultyManager();
	List<Patron> listfaculty = facultymanager.gets();
	LibStaffManager libmanager = new LibStaffManager();
	List<Patron> listmanager = libmanager.gets();
	int count = liststudent.size() + listfaculty.size() + listmanager.size();
	String[] str = new String[count];
	
// 	ResourceManager resourcemanager = new ResourceManager();
// 	List<Resource> list = resourcemanager.gets();
// 	String[] str1 = new String[list.size()];
// 	for (int i = 0; i < list.size(); i++) {
// 		str1[i] = list.get(i).getName();
// 	}

	for (int i = 0; i < count;i++) {
		if(i<liststudent.size()){
			str[i] = liststudent.get(i).getUser_id();
		}else if(i >= liststudent.size() && i < (liststudent.size()+listfaculty.size()) ){
			str[i] =  listfaculty.get(i-liststudent.size()).getUser_id();
// 			str[i] = "sdfsdf";
		}
		else if(i>=(liststudent.size()+listfaculty.size())){
			str[i] = listmanager.get(i-(listfaculty.size()+liststudent.size())).getUser_id();
			//str[i] = "fdg";
		}
	//	i++;
	}

	String query = (String) request.getParameter("q");
	
	int cnt = 1;
	for (int j = 0; j < str.length; j++) {
		if (str[j].toUpperCase().startsWith(query.toUpperCase())) {
			out.print(str[j] + "\n");
			if (cnt >= 50)
				break;
			cnt++;
		}
	}
	
// 	int cnt1 = 1;
// 	for (int j = 0; j < str1.length; j++) {
// 		if (str1[j].toUpperCase().startsWith(query.toUpperCase())) {
// 			out.print(str1[j] + "\n");
// 			if (cnt1 >= 50)
// 				break;
// 			cnt1++;
// 		}
// 	}

	
%>
<%-- soluong count :<%=count%> --%>
<%-- soluong student :<%=liststudent.size()%> --%>
<%-- soluong faculty :<%=listfaculty.size()%> --%>
<%-- soluong libmanger:<%=listmanager.size()%> --%>
<%-- ten<% for(int i=0;i<count;i++){%> --%>
<%-- 	<%=str[i] %> --%>

<%-- <%} %> --%>
<%--  <% String abc = liststudent.get(0).getUser_id();  %> --%>
<%-- ten<%=abc %> --%>

