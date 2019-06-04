<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 导入java.sql.ResultSet类 --%>	
<%@ page import="java.sql.ResultSet"%>
<%-- 创建ConnDB类的对象 --%>	
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String username = request.getParameter("username");//获取账户
String checkCode = request.getParameter("checkCode");//获取验证码
String PWD = request.getParameter("PWD");//获取密码
ResultSet rs1 = conn.executeQuery("select * from tb_admin ");
String admin="";
String adminpwd="";

while(rs1.next()){
	admin=rs1.getString("admin");
	adminpwd=rs1.getString("pwd");
	
	if(username.equals(admin)&PWD.equals(adminpwd)){
	response.sendRedirect("managedetail.jsp");}
}
if (checkCode.equals(session.getAttribute("randCheckCode").toString())) {
	try {//捕捉异常
		ResultSet rs = conn.executeQuery("select * from tb_Member where freeze=0 and username='" 
                                              + username + "'");
		if (rs.next()) {//如果找到相应的账号
			if (PWD.equals(rs.getString("password"))) {//如果输入的密码和获取的密码一致
                   //把当前的账户保存到Session中，实现登录
				session.setAttribute("username", username); 
				  //把当前的账户收藏夹保存
				  response.sendRedirect("fav_loading.jsp");//载入数据
				
			} else {
				out.println(
		"<script language='javascript'>alert('您输入的用户名或密码错误，请与管理员联系!');"
				        +"window.location.href='login.jsp';</script>");
			}
		} else {
			out.println(
				"<script language='javascript'>alert('您输入的用户名或密码错误，或您的账户"+
	              "已经被冻结，请与管理员联系!');window.location.href='login.jsp';</script>");
			}
		} catch (Exception e) {//处理异常
			out.println(
					"<script language='javascript'>alert('您的操作有误!');"
			        +"window.location.href='login.jsp';</script>");
		}
		conn.close();//关闭数据库连接
	} else {
		out.println("<script language='javascript'>alert('您输入的验证码错误!');history.back();</script>");
	}

%>

</body>
</html>