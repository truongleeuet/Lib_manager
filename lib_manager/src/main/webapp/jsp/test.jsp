<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/style.css" />
	<script type="text/javascript" src="jquery/jquery-1.4.2.min.js"></script>
	<script src="jquery/jquery.autocomplete.js"></script>	
	
	<script>
	jQuery(function(){
		$("#country").autocomplete("listbook.jsp");
	});
   </script>
	
</head>
<body>


	Select Country   :	
	<input type="text" id="country" name="country" class="input_text"/>
	
</body>
</html>