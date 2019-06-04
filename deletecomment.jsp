<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<jsp:useBean id="comment_delete" scope="page" class="com.dao.commentDaoimpl"/>
<jsp:useBean id="comment" scope="request" class="com.model.comment">
<jsp:setProperty name="comment" property="*"/>
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
     int commentid = Integer.parseInt(request.getParameter("coid")); 	 
  
    comment.setCoid(commentid);  
    int ret = 0;
	ret = comment_delete.delete(comment);
	if (ret != 0) {
		out.println("<script language='javascript'>alert('已删除！');window.location.href='managecomment.jsp';</script>");
	} else {
		out.println("<script language='javascript'>alert('失败！');window.location.href='managecomment.jsp';</script>");
	}
%>
</body>