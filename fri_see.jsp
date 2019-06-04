

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page import="java.sql.ResultSet"%>			<%-- 导入java.sql.ResultSet类 --%>
<%@ page import="java.util.Vector"%>			<%-- 导入Java的向量类 --%>
<%@ page import="java.text.DecimalFormat"%>	<%-- 导入格式化数字的类 --%>
<%@ page import="com.model.friend"%>		<%-- 导入购物车音乐的模型类 --%>
<%-- 创建com.tools.ConnDB类的对象 --%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<%
	String username = (String) session.getAttribute("username");//获取会员账号
	//如果没有登录，将跳转到登录页面
	if (username == "" || username == null) {
		response.sendRedirect("login.jsp");					//重定向页面到会员登录页面
		return;												//返回
	} else {
		Vector fri = (Vector) session.getAttribute("fri");	//获取购物车对象
		if (fri == null || fri.size() == 0) {				//如果购物车为空
			response.sendRedirect("fri_null.jsp");			//重定向页面到购物车为空页面
		} else {
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/mr-01.css" type="text/css"> 

</head>
<body>
<jsp:include page="index-loginCon.jsp" />
	<!-- 网站头部 -->
<%@ include file="common-header.jsp"%>
	<!-- //网站头部 -->
<%   	
int ID = -1;													//保存音乐ID的变量
String friname = "";										//保存音乐名称的变量


%>


	
	
	
	
<div id="mr-mainbody" class="container mr-mainbody">
		<div class="row">
			<!-- 页面主体内容 -->
			<div id="mr-content" class="mr-content col-xs-12">
				<div id="mrshop" class="mrshop common-home">
					<div class="container_oc">
						<div class="row">
							<div id="content_oc" class="col-sm-12">
								<h1>我的收藏夹</h1>
								<!-- 显示收藏夹中的音乐 -->
								<div class="table-responsive cart-info">
									<table class="table table-bordered">
										<thead>
											<tr>
												<td class="text-center image">好友id号</td>
												<td class="text-left name">好友名</td>
												<td class="text-left image">操作</td>
												
											</tr>
										</thead>
										<tbody>
										<!-- 遍历收藏夹中的音乐并显示 -->
											<%
	                                        
											for (int i = 0; i < fri.size(); i++) {
												
												
												friend myfriend = (friend) fri.elementAt(i);	//
												ID = myfriend.userID;										//ID
												if (ID > 0) {
												ResultSet rs_user= conn.executeQuery("select * from tb_member where ID=" + ID);
												if (rs_user.next()) {
												friname = rs_user.getString("username");		//
												conn.close();										//关闭数据库的连接
												
                                            %>
											
											<!-- 显示一条音乐信息 -->
											<tr>
												<td class="text-center image" width="20%"><a href="userDetail.jsp?ID=<%=ID%>">
													<%=ID%> </a></td>
												<td class="text-left name"><a
													href="userDetail.jsp?ID=<%=friname%>"><%=friname%></a>
												</td>
												<td class="text-left name"><a
													href="fri_del.jsp?ID=<%=ID%>">删除</a>
												</td>
												
											</tr>
											<!-- 显示一条音乐信息 -->
                                              <%
												}
												}
											    }
                                              %>
											<!-- //遍历收藏夹中的音乐并显示 -->
										</tbody>
									</table>
								</div>
								<!-- //显示收藏夹中的音乐 -->
								
							</div>
						</div>

					
						<br />
						
					</div>
				</div>
			</div>
			<!-- //页面主体内容 -->
		</div>
	

</body>
</html>

	<%
	} 
	}
	%>