<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.ResultSet"%>		<%-- 导入java.sql.ResultSet类 --%>
<%-- 创建com.tools.ConnDB类的对象 --%>

<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<%
ResultSet rs = conn.executeQuery(
		"select * from tb_member "
		);		//查询最新上传的音乐信息

				
				
				
int userid=-1;
String username = "";							
String truename = "";								
int freeze= -1 ;
String flag="";
String pwd="";
String email="";
String tel="";
 %>

<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

table.hovertable {
    margin-left:0px;
    margin-top:0px;
    font-family: verdana,arial,sans-serif;
    font-size:11px;
    color:#333333;
    border-width: 1px;
    border-color: #999999;
    border-collapse: collapse;
}
table.hovertable th {
    background-color:white;
    border-width: 1px;
    padding: 8px;
    border-style: solid;
    border-color: #a9c6c9;
}
table.hovertable tr {
    background-color:white;
}
table.hovertable td {
    border-width: 1px;
    padding: 8px;
    border-style: solid;
    border-color: #a9c6c9;
}
.title{
margin-left:500px;
}
</style>
<title>Insert title here</title>
</head>
<body>
<%@ include file="managepage.jsp"%>  
<h2 class="title">用户信息总览表</h2>
<div  style="overflow-y:auto; width:800px; height:600px; margin-left:500px;
    margin-top:50px;">
<table class="hovertable">
<tr>
    <th style="width:150px">用户名</th><th style="width:150px">真实姓名</th><th style="width:150px">密码</th><th style="width:150px">邮箱</th><th style="width:150px">电话</th><th style="width:300px">账号是否被冻结</th>
</tr>
<% 
				
                                         while (rs.next()) 
                                          {						//设置一个循环
	                                         userid=rs.getInt("id");  
                                        	 username = rs.getString("username"); 					//获取ID
	                                         truename = rs.getString("truename"); 			//获取名称
	                                         freeze =rs.getInt("freeze");
	                                         pwd=rs.getString("password");
	                                         tel=rs.getString("tel"); 
	                                         email=rs.getString("email");
	                                         if (freeze==0){ 
	                                        	flag="否"; 
	                               
 %>

<tr >
    <td><%=username%></td><td><%=truename%></td><td><%=pwd%></td><td><%=email%></td><td><%=tel%></td><td><%=flag%>----<a href="freezeuser.jsp?userid=<%=userid%>">冻结该账号！！</a></td>
</tr>


<%} 
	                                         else{ flag="是";
	                                         %>
	                                         <tr >
    <td><%=username%></td><td><%=truename%></td><td><%=pwd%></td><td><%=email%></td><td><%=tel%></td><td><%=flag%>----<a href="unfreezeuser.jsp?userid=<%=userid%>">解冻该账号！！</a></td>
</tr>
<%} 

	} %>
</table>
</div>
</body>
</html>