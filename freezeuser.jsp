<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<jsp:useBean id="freeze_member" scope="page" class="com.dao.memberfreezeimpl"/>
<jsp:useBean id="member" scope="request" class="com.model.Member">
<jsp:setProperty name="member" property="*"/>
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
    int userID = Integer.parseInt(request.getParameter("userid")); 	
  
    member.setID(userID);
    member.setFreeze(1);
    int ret = 0;
	ret = freeze_member.update(member);
	if (ret != 0) {
	    
		out.println("<script language='javascript'>alert('会员账号冻结成功！');window.location.href='manageuser.jsp';</script>");
	} else {
		out.println("<script language='javascript'>alert('失败！');window.location.href='manageuser.jsp';</script>");
	}
%>
</body>
</html>