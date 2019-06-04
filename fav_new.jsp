<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.sql.ResultSet"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<%-- 创建类的对象 --%>	
<jsp:useBean id="ins_fav_list" scope="page" class="com.dao.fav_listdaoImpl" />
<%-- 创建类的对象，类的所有属性进行赋值 --%>	
<jsp:useBean id="fav_list" scope="request" class="com.model.fav_list" />
<jsp:useBean id="ins_fri_list" scope="page" class="com.dao.frillistdaoimpl" />
<%-- 创建类的对象，类的所有属性进行赋值 --%>	
<jsp:useBean id="fri_list" scope="request" class="com.model.fri_list" />	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
request.setCharacterEncoding("UTF-8");	
//设置请求的编码为UTF-8
	String username =(String)session.getAttribute("username");			//获取会员账号
	
		int ret = 0;	
		
		
		//记录更新记录条数的变量
		fav_list.setUsername(username);
		fav_list.setFav_list("");
		
		
		ret = ins_fav_list.insert(fav_list);
		
		int ret2 =0 ;
		fri_list.setUsername(username);
		fri_list.setFrilist("");
		
		ret2 =ins_fri_list.insert(fri_list);
		
		//将填写的会员信息保存到数据库
	
		
		
	
	
	response.sendRedirect("index.jsp");//跳转到前台首页
		%>
</body>
</html>