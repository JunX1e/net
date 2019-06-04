<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<html>
<head>
<style type="text/css">
table.hovertable {
    margin-left:200px;
    margin-top:50px;
    font-family: verdana,arial,sans-serif;
    font-size:11px;
    color:#333333;
    border-width: 1px;
    border-color: #999999;
    border-collapse: collapse;
}
table.hovertable th {
    background-color:#c3dde0;
    border-width: 1px;
    padding: 8px;
    border-style: solid;
    border-color: #a9c6c9;
}
table.hovertable tr {
    background-color:#d4e3e5;
}
table.hovertable td {
    border-width: 1px;
    padding: 8px;
    border-style: solid;
    border-color: #a9c6c9;
}
</style>
<meta charset="UTF-8">
<title>用户详情</title>
<link rel="stylesheet" href="css/mr-01.css" type="text/css">
</head>
<body>
<jsp:include page="index-loginCon.jsp" />
	<!-- 网站头部 -->
<%@ include file="common-header.jsp"%>
	<!-- //网站头部 -->
<%
String username = request.getParameter("ID");	//获取音乐ID */

String musicname = "";							
String intime= "";								
String singer="";
int num=0;

String email1="";
ResultSet rs3 = conn.executeQuery("select  t1.musicID,t1.musicName,t1.intime,t1.uper,t1.singer "
		+"from tb_music t1 where t1.uper ='" + username + "' order by t1.intime desc");	

ResultSet rs4 = conn.executeQuery("select  * "
				+"from tb_member where username ='" + username + "'");	
ResultSet rs5 = conn.executeQuery("select  * "
		+"from tb_music t1 where t1.uper ='" + username + "' order by t1.intime desc");	
while (rs5.next()){num++;}
if(rs4.next())
{
email1=rs4.getString("email");	
}
	
%>
<div class="col-lg-3  col-md-6 hidden-md   col-sm-3 hidden-sm   col-xs-6 hidden-xs ">
				<div >
					<div class="module-inner">
						
							      
						
						

										<div class="box-product "style="background:#c3dde0; width:220px;margin-left:50px ;margin-top:50px; border-radius:10px">
											<div>
												<div class="image">
												
												<img  style="width:145px; height:165px; margin-left:10px ;margin-top:10px;" src="images/touxiang.jpg">
												
												<div class="leader" style=" font-size:16px;">
													  用户信息<br>
													  用户名：<%=username%><br>
													   上传歌曲：<%=num %>首<br>
													  联系方式：<%=email1 %><br>
													<input type="button" value="添加好友" 
                                                 onclick='javascript:window.location.href="fri_add.jsp?ID=<%=username%>"; '>
												</div>
												
											</div>
										</div> 

										<!-- // 循环显示热门音乐 ：添加两条音乐信息-->
			 						</div>
								</div>
							</div>
						</div>


	
 <table class="hovertable">
<tr>
    <th style="width:200px">歌名</th><th style="width:200px">歌手</th><th style="width:500px">上传时间</th>
</tr>
<% while (rs3.next()) {									//如果找到对应的音乐信息
		musicname = rs3.getString("musicname");					//获取音乐名称
		intime = rs3.getString("intime");					//获取音乐描述		
		singer = rs3.getString("singer");					//获取音乐图片
		
		%>
<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
    <td><%=musicname%></td><td><%=singer%></td><td><%=intime%></td>
</tr>
<%
}

%>
</table>	



</body>
</html>