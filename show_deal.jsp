<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int ord = Integer.parseInt( request.getParameter("ord"));
int type= Integer.parseInt(request.getParameter("type"));
if (ord==1)
{
	response.sendRedirect("allmusic.jsp?ord=1&type="+type);
}
else
{
	response.sendRedirect("allmusic.jsp?ord=0&type="+type);
}
%>
</body>
</html>