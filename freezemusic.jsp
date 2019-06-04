<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<jsp:useBean id="freeze_music" scope="page" class="com.dao.musicfreezeimpl"/>
<jsp:useBean id="music" scope="request" class="com.model.Music">
<jsp:setProperty name="music" property="*"/>
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	 request.setCharacterEncoding("UTF-8");
    int musicID = Integer.parseInt(request.getParameter("musicid")); 	
  
    music.setID(musicID);
    music.setFreeze(1);
    int ret = 0;
	ret = freeze_music.update(music);
	if (ret != 0) {
		out.println("<script language='javascript'>alert('音乐已下架！'); window.history.go(-1);</script>");
	} else {
		out.println("<script language='javascript'>alert('失败！');window.history.go(-1);</script>");
	}
%>
</body>
</html>