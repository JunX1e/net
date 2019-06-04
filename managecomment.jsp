<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.ResultSet"%>		<%-- 导入java.sql.ResultSet类 --%>
<%-- 创建com.tools.ConnDB类的对象 --%>

<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<%
ResultSet rs = conn.executeQuery(
		"select * from tb_comment "
		);		//查询最新上传的音乐信息

				
				
				
int id=-1;
String username = "";							
String text = "";								
String time= "" ;
String flag="";
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
<h2 class="title">评论总览表</h2>
<div  style="overflow-y:auto; width:500px; height:600px; margin-left:500px;
    margin-top:50px;">
<table class="hovertable">
<tr>
    <th style="width:150px">id</th><th style="width:150px">评论用户</th><th style="width:150px">评论内容</th><th style="width:150px">发布时间</th><th style="width:150px">管理</th>
</tr>
<% 
				
                                         while (rs.next()) 
                                          {						//设置一个循环
	                                         id=rs.getInt("id");  
                                        	 username = rs.getString("username"); 					//获取ID
	                                        text = rs.getString("comment"); 			//获取名称
	                                        time =rs.getString("time");
	                                         
	                               
 %>

<tr >
    <td><%=id%></td><td><%=username%></td><td><%=text%></td><td><%=time%></td><td><a href="deletecomment.jsp?coid=<%=id%>">删除</a></td>
</tr>


<%} %>
	                                        
</table>
</div>
</body>
</html>