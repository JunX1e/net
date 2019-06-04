<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ page import="java.sql.ResultSet"%><%-- 导入java.sql.ResultSet类 --%>
<%-- 创建com.tools.ConnDB类的对象 --%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<jsp:useBean id="ins_music" scope="page" class="com.dao.MusicDaoimple"/>
<jsp:useBean id="music" scope="request" class="com.model.Music">
<jsp:setProperty name="music" property="*"/>
</jsp:useBean>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
    /* String address= (String)session.getAttribute("newmusicname");
    String username= (String)session.getAttribute("username");
   
    music.setAddress(address);
    music.setUper(username); */
		int ret = 0;
		ret = ins_music.update(music); 
		if (ret != 0) {
		   
			out.println("<script language='javascript'>alert('音乐修改成功！');window.location.href='index.jsp';</script>");
		} else {
			out.println("<script language='javascript'>alert('失败！');window.location.href='index.jsp';</script>");
		}
%>

</body>
</html>