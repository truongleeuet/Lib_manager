<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css"> -->
<script type="text/javascript" src="jquery/jquery-1.11.2.min.js"></script>
<!-- <script src="//code.jquery.com/jquery-1.11.2.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css.map">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css.map">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<script type="text/javascript">
	$(document).ready(function() {
		$('ul.nav > li ').click(function(e) {
			//alert('clicked');
			//e.preventDefault();
			$('ul.nav > li ').removeClass('active');
			$(this).addClass('active');
		});
	});
</script>
<script type="text/javascript">
$(document).ready(function(){
    $(".dropdown-toggle").dropdown();
});  
</script>

<link rel="stylesheet" type="text/css" href="css/header.css" />


	<div class="wrapheader">
		<div>
			<img src="img/logo.gif" class="imgcompany">
		</div>
		<div class="user">
			<c:if test="${sessionScope.login_done eq null}">
		
			<p align="right">
				&nbsp;&nbsp; Guest &nbsp;&nbsp; |&nbsp;&nbsp; <a href="login.jsp" >Login</a>
				&nbsp;&nbsp;
			</p>
			</c:if>

			<c:if test="${sessionScope.login_done ne null}">
			<p align="right">
				<a href="#">${sessionScope.login_done }</a> | <a href="controler?action=LOGOUT">Logout</a>
				&nbsp;
			</p>
			</c:if>
			
		</div>
		<div class="menuheader">
			<ul class="nav nav-pills">
				<li class="active"><a href="index.jsp"><span
						class="glyphicon glyphicon-home"></span> HOME</a></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="Book.jsp" role="button"> 
					<span class="glyphicon glyphicon-book"></span>BOOK<span
						class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="computer.jsp" target="iframe_book">Computer</a></li>
						<li><a href="law.jsp" target="iframe_book">Law</a></li>
						<li><a href="poetry.jsp" target="iframe_book">Poetry</a></li>
						<li><a href="humor.jsp" target="iframe_book">Humor</a></li>
						<li><a href="Book.jsp" target="iframe_book">All</a></li>	
					</ul>
				</li>
				<li><a href="#"><span><img src="img/requesticon.jpg" ></span> REQUEST</a></li>
				<li><a href="#"><span><img src="img/contact_us_icon.png"></span> CONTACT</a></li>
				<li><a href="#"><span><img src="img/support.png"></span> SUPPORT</a></li>
			</ul>
		</div>
	</div>
