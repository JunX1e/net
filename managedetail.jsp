<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>		<%-- 导入java.sql.ResultSet类 --%>
<%-- 创建com.tools.ConnDB类的对象 --%>

<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />

<!DOCTYPE html>

<%
int usernum=0;
int musnum=0;
int comment=0;
int playtimes=0;
int hit=-1;
ResultSet rs_new = conn.executeQuery(
		"select * from tb_music "
		);		
ResultSet rs_new1 = conn.executeQuery(
				"select  * from tb_member "
				);	
ResultSet rs_new2 = conn.executeQuery(
		"select  * from tb_comment "
		);		
while(rs_new.next())
{
musnum++;
hit=rs_new.getInt("hit");
playtimes=playtimes+hit;
}
while(rs_new1.next()){
usernum++;
	
}
while(rs_new2.next()){
	comment++;
	
}



%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="managepage.jsp"%>  
<h1 style="margin-left:500px">欢迎管理员admin</h1>
<div style="margin-left:500px;">
音乐数量：<%=musnum %> <br>
播放次数：<%=playtimes %> <br>
用户量：<%=usernum %> <br>
评论量：<%=comment %><br>
管理员： admin 密码：admin 
</div>


</body>
</html>