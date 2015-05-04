<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.List"%>
<%@page import="manager.resource.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="manager.resource.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script src="script.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
		<link ref="stylesheet" href="css/bootstrap.css">
			<link ref="stylesheet" href="css/bootstrap.min.css">
				<link rel="stylesheet" href="css/bootstrap-theme.min.css">

					<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
						<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
							<link rel="stylesheet" href="bootstrap/css/bootstrap.css.map">
								<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css">
									<link rel="stylesheet"
										href="bootstrap/css/bootstrap-theme.css.map">
										<link rel="stylesheet"
											href="bootstrap/css/bootstrap-theme.min.css">


											<script>
		$( document ).ready(function() {
			$('#cssmenu li.active').children('ul').show();
			  $('#cssmenu li.has-sub>a').on('click', function(){
			    $(this).removeAttr('href');
			    var element = $(this).parent('li');
			    if (element.hasClass('active')) {
			      element.removeClass('active');
			      element.find('li').removeClass('active');
			      element.find('ul').slideUp();
			    }
			    else {
			      element.addClass('active');
			      element.children('ul').slideDown();
			      element.siblings('li').children('ul').slideUp();
			      element.siblings('li').removeClass('active');
			      element.siblings('li').find('li').removeClass('active');
			      element.siblings('li').find('ul').slideUp();
			    }
			  });
						</script>
											<script language="JavaScript">
            function calcHeight()
            {    
                var dodai_trang = document.getElementById('Shacker').contentWindow.document.body.scrollHeight;
                document.getElementById('Shacker').height=dodai_trang;
            }
            </script>

											<title>Home - Lib manager Sys</title> <%
 	String logedIn = (String) session.getAttribute("login.done");
 	String roles = (String) session.getAttribute("patron.roles");
 %>
											<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>

<body>
	<!-- style="background-image:url(img/library2.JPG);background-size: contain;" -->
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
					<div class="body">
						<iframe id="Shacker" src="body.jsp" name="iframe_a"
							onLoad="calcHeight();" scrolling="no"></iframe>
					</div>
				</div>
				<div>
					<jsp:include page="footer.jsp" flush="true" />
				</div>
			</td>
		</tr>
	</table>
</body>
</html>
