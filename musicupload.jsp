<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
String username= (String)session.getAttribute("username");
if (username == null || username == "") {
	response.sendRedirect("login.jsp");					//重定向页面到会员登录页面
	return;//返回
} %>

<meta charset="UTF-8">
<link rel="stylesheet" href="css/mr-01.css" type="text/css"> 
<jsp:include page="index-loginCon.jsp" />
	<!-- 网站头部 -->
	<%@ include file="common-header.jsp"%>
	<!-- //网站头部 -->
<title>音乐上传</title>
</head>
<body>
<div style="margin-top:100px; margin-left:400px;">
<h1>上传你的音乐</h1>
<form method="post" action="/music/UploadServlet" enctype="multipart/form-data">
    选择一个文件:
    <input type="file" name="uploadFile" accept=".mp3" />
    <br/><br/>
    <input type="submit" value="上传"  />
</form>
<!-- test show detail -->
</div>

<div>


</div>

</body>
</html>