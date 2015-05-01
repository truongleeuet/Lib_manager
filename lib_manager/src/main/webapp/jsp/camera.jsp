<%@page import="java.awt.image.BufferedImage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="support.*"%>
<%@ page import="com.github.sarxos.webcam.*"%>
<%@ page import="com.google.zxing.*"%>
<%@ page import="com.google.zxing.client.j2se.BufferedImageLuminanceSource"%>
<%@ page import="com.google.zxing.common.HybridBinarizer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%
	WebcamQRCodeExample webcam = new WebcamQRCodeExample();
	
%>
</head>
<body>
<form action="">
	Qrcode:<input type="text" name="qrcode" value="<%=webcam.getResult()%>">
</form>
</body>
</html>