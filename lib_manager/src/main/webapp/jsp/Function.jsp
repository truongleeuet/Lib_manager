
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@page import="java.util.*"%>
<%@ page import="manager.resource.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%!public String getPage(String url,int currentPage, int records, int pages,List<Resource> list) {
		//ResourceManager resourcemanager = new ResourceManager();
		//list = resourcemanager.gets();
		String tmp = "";
		Resource resource = new Resource();
		int totalRecords = list.size();
		int totalPages = totalRecords / records;
		if ((totalRecords % records) > 0)
			totalPages += 1;

		//currentPage = 1;
		//  	if (request.getParameter("page") != null) {
		//  		try {
		//  			currentPage = Integer
		//  					.parseInt(request.getParameter("page"));
		//  		} catch (Exception e) {
		//  			currentPage = 1;
		//  		}
		//  	}
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

		if (totalRecords == 0) {
			tmp += "<p>Không có kết quả tìm kiếm</p>";
			for (int k = 0; k < 9; k++) {
				tmp += "<p></p>";
			}
		} else {
			tmp += showList(currentPage, records, resource, list);
// 			tmp+="</div>";
		}
		tmp+="<p align=\"right\" class=\"right\" style=\"clear: both\">";
		if (Segment > 1) {
			tmp+=" <a href=\" " + url + "?page=" + (Segment - 1) * 3 + " \" >Previous&nbsp; </a>";
		}
		for (int No = startNo; No <= endNo; No++) {
			tmp+="<a href=\" " +url + "?page=" + No + " \"> " + No + "&nbsp;</a>";
		}
		if (totalPages > 3 * Segment) {
			tmp+="<a href=\" " +url+ "?page=" + ((Segment * 3) + 1) +"\"> Next&nbsp; </a>";
		}
		tmp+="</p>";
		return tmp;
	}%>

	<%!public String showList(int currentPages, int records, Resource resource,
			List<Resource> list) {
		int i = 0;
		String tmp = "";
		int totalRecords = list.size();
		while (i < records && i + (currentPages - 1) * records < totalRecords) {
			resource = list.get(i + (currentPages - 1) * records);
			i++;
			tmp += "<div class=\"bookdiv\" style=\" width: 220px; height: 290px; boder: 1px solid #CCC; float: left;background:#ecf0f1;margin-left: 13px;margin-bottom: 10px;margin-top: 10px;\">";
			tmp += "	<img class=\"imagebook\" src=\" " + resource.getImages()
					+ "\"" + " alt=\"Hinhanh\" style=\" width: 128px; height:168px;margin-left: 46px;\"></img>";
			tmp += "	<p align=\"center\" style=\"height:40px;\">";
			tmp += "		<b>" + resource.getName() + "</b> </p>";

			tmp += "	<p align=\"center\">" + resource.getAmount()
					+ "</p>";
			tmp += " <p align=\"center\"> <a href=\"controler?action=VIEW_RESOURCE&isbn="+resource.getIsbn()+"\">Read More</a></p></div>";
			
	
		}
		return tmp;
	}%>
	
</body>
</html>