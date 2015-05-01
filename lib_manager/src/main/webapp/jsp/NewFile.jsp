<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="jquery/jquery-1.4.2.min.js"></script>
<script src="jquery/jquery.autocomplete.js"></script>

<script>
	jQuery(function() {
		$(":input").autocomplete("listbook.jsp");
	});
</script>
<script>
	jQuery(function() {
		$("#country").autocomplete("listbook.jsp");
	});
</script>

</head>
<body>
	<br>
	<br>
	<center>
		<font face="verdana" size="2"> <font size="4">Java(jsp)/jQuery
				Autocompleter Example ::: <font color="#809e02">Java4s.com</font>
		</font> <br>
		<br>
		<br>
		<br>
			<table width="710px">
				<tr valign="top">
					<td>
						<div>
							<p class="style1">Thông tin đặt sách :</p>
						</div>

						<form name="formCheckOut" method="get" action="controler">
							<table width="95%" border="0" align="center">
								<tr>
									<td width="37%">&nbsp;</td>
									<%-- 														<td width="63%"><p class="style2"><%=messageErr%></p></td> --%>
								</tr>
								<tr>
									<td width="45"><p>Tên đăng nhập của người mượn:</p></td>
									<td><input name="checkOut.userName" type="text"
										id="checkOut.userName" size="35"></td>
								</tr>
								<tr>
									<td width="45"><p>Mã của cuốn sách mượn :</p></td>
									<td><input name="checkOut.Isbn" type="text"
										id="checkOut.Isbn" class="input_text"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td><div align="center">
											<input name="action" type="hidden" value="CHECK_OUT" /> <input
												name="checkOut.submit" type="submit" id="checkOut.submit">
											<input name="checkOut.reset" type="reset" id="checkOut.reset">
										</div></td>
								</tr>
							</table>
						</form>
					</td>
				</tr>
			</table> Select Country : <input type="text" id="country" name="country"
			class="input_text" />

		</font>
		
</body>
</html>