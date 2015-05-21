
<!-- <script -->
<!-- 	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script> -->
<%@page import="manager.resource.*"%>
<%@page import="manager.*"%>
<%@page import="java.util.List"%>

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/carousel.css" />
<%
	ResourceBorrowManagerImpl borrowmanager = new ResourceBorrowManagerImpl();
	List<Resource> listbook = borrowmanager.getBookHot();
%>
<div class="container">
	<br>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
		</ol>

		<!-- Wrapper for slides -->

		<div class="carousel-inner" role="listbox">
			<%-- 			<% --%>
<!-- 			// for (int i = 0; i < listbook.size(); i++) { -->
			<%-- 			%> --%>
			<!-- 			<div class="item active"> -->
			<%-- 				<img src="<%listbook.get(i).getImages();%>" alt="Chania" --%>
			<!-- 					class="tales"> -->
<!-- 		</div> -->
		<div class="item active">
			<img src="img/1.jpg" alt="Chania" class="tales">
		</div>
		<div class="item">
			<img src="img/2.jpg" alt="Chania" class="tales">
		</div>

		<div class="item">
			<img src="img/3.jpg" alt="Flower" class="tales">
		</div>

		<div class="item">
			<img src="img/4.jpg" alt="Flower" class="tales">
		</div>
		<div class="item">
			<img src="img/4.jpg" alt="Flower" class="tales">
		</div>
		<%-- 			<% --%>
<!-- // 				} -->
<%-- 			%> --%>

		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
</div>
