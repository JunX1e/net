<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.ResultSet"%>		<%-- 导入java.sql.ResultSet类 --%>
<%-- 创建com.tools.ConnDB类的对象 --%>

<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<%
ResultSet rs = conn.executeQuery(
		"select * from tb_music "
		);		//查询最新上传的音乐信息

				
				
				
int musicid=-1;
String musicname = "";							
String singer = "";	
String uper="";
String time = "";
int freeze= -1 ;
String flag= "";
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
<h2 class="title">歌曲信息总览表</h2>
<div  style="overflow-y:auto; width:800px; height:600px; margin-left:500px;
    margin-top:50px;">
<table class="hovertable">
<tr>
    <th style="width:150px">歌名</th><th style="width:150px">歌手</th><th style="width:150px">上传时间</th><th style="width:150px">上传者</th><th style="width:150px">账号是否被冻结</th>
</tr>
<% 
				
                                         while (rs.next()) 
                                          {						//设置一个循环
	                                         musicid=rs.getInt("musicid");  
                                        	 musicname = rs.getString("musicname"); 					//获取ID
	                                         singer = rs.getString("singer"); 
                                        	 uper=rs.getString("uper");
	                                         time = rs.getString("intime");
	                                         freeze =rs.getInt("freeze");
	                                         if (freeze==0){ 
	                                        	flag="否"; 
	                               
 %>

<tr >
    <td><%=musicname%></td><td><%=singer%></td><td><%=time%></td><td><%=uper%></td><td><%=flag%>----<a href="freezemusic.jsp?musicid=<%=musicid%>">冻结该音乐！！</a></td>
</tr>


<%} 
	                                         else{ flag="是";
	                                         %>
	                                         <tr >
   <td><%=musicname%></td><td><%=singer%></td><td><%=time%></td><td><%=uper%></td><td><%=flag%>----<a href="unfreezemusic.jsp?musicid=<%=musicid%>">解冻该音乐！！</a></td>
</tr>
<%} 

	} %>
</table>
</div>
</body>
</html>