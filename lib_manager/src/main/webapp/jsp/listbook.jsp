
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="manager.resource.*"%>
<%@page import="sql.*"%>
<% 
	ResourceManager resourcemanager = new ResourceManager();
	List<Resource> list = resourcemanager.gets();
	String[] str = new String[list.size()];
	for(int i=0;i<list.size();i++){
		str[i]=list.get(i).getIsbn();
	}
	
	String query = (String)request.getParameter("q");
	
	int cnt=1;
	for(int j=0;j<str.length;j++)
	{
		if(str[j].toUpperCase().startsWith(query.toUpperCase()))
		{
			out.print(str[j]+"\n");
			if(cnt>=50)
				break;
			cnt++;
		}
	}
%>