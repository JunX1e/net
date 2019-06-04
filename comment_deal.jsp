<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="conn3" scope="page" class="com.tools.ConnDB" />
<%-- 创建MemberDaoImpl类的对象 --%>	
<jsp:useBean id="ins_com" scope="page" class="com.dao.commentDaoimpl" />
<%-- 创建Member类的对象，并对Member类的所有属性进行赋值 --%>	
<jsp:useBean id="comment" scope="request" class="com.model.comment" />
<jsp:setProperty name="comment" property="*"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
request.setCharacterEncoding("UTF-8");	

String username = (String)session.getAttribute("username");	//获取音乐ID */
if (username == null || username == "") {
	response.sendRedirect("login.jsp");					//重定向页面到会员登录页面
	return;//返回
}
int ret = 0;	
		//记录更新记录条数的变量
			
		ret = ins_com.insert(comment);	
		
		%>
		评论已提交
		
		<a href="musicDetail.jsp?ID=<%=comment.id%>">返回</a>
		 
</body>
</html>