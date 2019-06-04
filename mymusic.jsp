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
<link rel="stylesheet" href="css/mr-01.css" type="text/css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="index-loginCon.jsp" />
	<!-- 网站头部 -->
<%@ include file="common-header.jsp"%>
	<!-- //网站头部 -->
<%

String username = (String)session.getAttribute("username");	//获取音乐ID */
if (username == null || username == "") {
	response.sendRedirect("login.jsp");					//重定向页面到会员登录页面
	return;//返回
}
String musicname = "";							
String intime= "";								
String singer="";
int num=0;
int musicid=-1;
String email1="";
String truename1="";
String tel1="";
ResultSet rs3 = conn.executeQuery("select  t1.musicID,t1.musicName,t1.intime,t1.uper,t1.singer "
		+"from tb_music t1 where freeze=0 and t1.uper ='" + username + "' order by t1.intime desc");	

ResultSet rs4 = conn.executeQuery("select  * "
				+"from tb_member where username ='" + username + "'");	
ResultSet rs5 = conn.executeQuery("select  * "
		+"from tb_music t1 where t1.uper ='" + username + "' order by t1.intime desc");	
while (rs5.next()){num++;}
if(rs4.next())
{
	email1=rs4.getString("email");
	tel1=rs4.getString("tel");
	truename1=rs4.getString("truename");
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
													   真名：<%=truename1 %><br>
													   上传歌曲：<%=num %>首<br>
													 
													  电话：<%=tel1 %><br>
													  
													 邮箱：<%=email1 %><br>
													<input type="button" value="修改信息" 
                                                 onclick='javascript:window.location.href="modifyMember.jsp"; '>
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
	    musicid=rs3.getInt("musicid");
		musicname = rs3.getString("musicname");					//获取音乐名称
		intime = rs3.getString("intime");					//		
		singer = rs3.getString("singer");					//
		
		%>
<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
    <td><%=musicname%></td><td><%=singer%></td><td><%=intime%>----<a href="modifymusic.jsp?ID=<%=musicid%>">修改信息</a>------<a href="freezemusic.jsp?musicid=<%=musicid%>">删除</a></td>
</tr>
<%
}

%>
</table>	
</body>
</html>