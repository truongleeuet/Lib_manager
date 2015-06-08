<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.List"%>
<%@page import="manager.resource.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="manager.resource.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%
	List<Resource> list = (List<Resource>) session.getAttribute("search_result");
	if (list == null) {
		list = new ArrayList<Resource>();
	}
	int totalRecord = list.size();
	int totalPages = totalRecord / 3;
	if ((totalRecord % 3) > 0)
		totalPages += 1;
	int pages = 3;

	int currentPage = 1;
	if (request.getParameter("page") != null) {
		try {
			currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			currentPage = 1;
		}
	}
	int Segment = currentPage / pages;
	int startNo = 0;
	int endNo = 0;
	if ((currentPage % pages) > 0)
		Segment += 1;
	startNo = Segment * pages - pages + 1;
	if (Segment * pages > totalPages) {
		endNo = totalPages;
	} else
		endNo = Segment * pages;

	Resource resource = new Resource();
%>
<link rel="stylesheet" type="text/css" href="css/body.css" />
</head>
<body>
	<div class="bodybook">
		<div align="center">
			<table width="100%" border="0">
				<tr>
					<td width="6%">&nbsp;</td>
					<td width="67%">
						<p align="center">..:: Home &gt; Tìm kiếm ::..</p>
					</td>

				</tr>
			</table>
		</div>

		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr valign="top">
				<td width="45%">
					<form name="formSearch" method="get" action="controler">
						<table width="90%" border="0" align="center">

							<tr>
								<td>&nbsp;</td>
								<td colspan="3"><div align="right">
										<input name="searchKey" type="text" id="searchKey"
											placeholder="Thông tin tìm kiếm" size="50">
									</div></td>
								<td><div align="left">
										<input name="action" type="hidden" value="SEARCH_RESOURCE" />
										<input name="search.Submit" type="submit" id="search.submit"
											value="Tìm kiếm">
									</div></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td colspan="3">&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</table>
					</form>

					<div>
						<p>
							Kết quả tìm kiếm :<%=totalRecord%></p>
					</div> <%
 	if (totalRecord == 0) {
 		out.println("<p>Không có kết quả tìm kiếm</p>");
 		for (int k = 0; k < 3; k++) {
 			out.println("<p></p>");
 		}
 	} else {
 		int i = 0;
 		while (i < 3 && i + (currentPage - 1) * 3 < totalRecord) {
 			resource = list.get(i + (currentPage - 1) * 3);
 			i++;
 %>


					<table width="100%" border="0" class="trbook">
						<tr>
							<td rowspan="6"><img src="<%=resource.getImages()%>"
								width="200" height="270" alt="" /></td>
							<td width="36%"><p>
									<strong> Mã tài liệu : </strong>
								</p></td>
							<td width="64%"><p><%=resource.getIsbn()%></p></td>
						</tr>
						<tr>
							<td><p>
									<strong> Tên tài liệu : </strong>
								</p></td>
							<td><p>
									<%=resource.getName()%>
								</p></td>
						</tr>
						<tr>
							<td><p>
									<strong> Thể loại : </strong>
								</p></td>
							<td><p>
									<%=resource.getCategories()%></p></td>
						</tr>
						<tr>
							<td>
								<p>
									<strong> Số lượng có trong thư viện : </strong>
								</p>
							</td>
							<td>
								<p>
									<%=resource.getAmount()%>
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<p>
									<strong> Tác giả : </strong>
								</p>
							</td>
							<td>
								<p><%=resource.getAuthors()%></p>
							</td>
						</tr>
						<tr valign="top">
							<td>
								<p>
									<strong> Miêu tả : </strong>
								</p>
							</td>

							<td><textarea name="book.description" id="book.description"
									cols="35" rows="5"><%=resource.getDescription()%>
							</textarea></td>

						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>
								<p align="right" class="right">
									<a
										href="controler?action=VIEW_RESOURCE&isbn=<%=resource.getIsbn()%>">Read
										More</a>
								</p>
							</td>
						</tr>
					</table> <%
 	}
 	}
 %>
					<p align="right" class="right">
						<%
							if (Segment > 1) {
						%>
						<a href="body.jsp?page=<%=(Segment - 1) * 3%>"> Previous&nbsp;
						</a>
						<%
							}
						%>
						<%
							for (int No = startNo; No <= endNo; No++) {
						%>
						<a href="body.jsp?page=<%=No%>"> <%=(No)%>&nbsp;
						</a>
						<%
							}
						%>
						<%
							if (totalPages > 3 * Segment) {
						%>
						<a href="body.jsp?page=<%=(Segment * 3) + 1%>"> Next&nbsp; </a>
						<%
							}
						%>
					
				</td>
			</tr>
		</table>
	</div>
</body>
</html>