<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>			<%-- 导入java.sql.ResultSet类 --%>
<%@ page import="java.util.Vector"%>			<%-- 导入Java的向量类 --%>
<%@ page import="java.text.DecimalFormat"%>	<%-- 导入格式化数字的类 --%>
<%@ page import="com.model.Musicelement"%>		<%-- 导入购物车音乐的模型类 --%>
<%-- 创建com.tools.ConnDB类的对象 --%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<%
	String username = (String) session.getAttribute("username");//获取会员账号
	//如果没有登录，将跳转到登录页面
	if (username == "" || username == null) {
		response.sendRedirect("login.jsp");					//重定向页面到会员登录页面
		return;												//返回
	} else {
		Vector fav = (Vector) session.getAttribute("fav");	//获取购物车对象
		if (fav == null || fav.size() == 0) {				//如果购物车为空
			response.sendRedirect("fav_null.jsp");			//重定向页面到购物车为空页面
		} else {
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>我的收藏夹</title>
<link rel="stylesheet" href="css/mr-01.css" type="text/css">

<script src="js/jsArr01.js" type="text/javascript"></script>
<script src="js/module.js" type="text/javascript"></script>
<script src="js/jsArr02.js" type="text/javascript"></script>
<script src="js/tab.js" type="text/javascript"></script>

</head>

<body>
	<jsp:include page="index-loginCon.jsp" />
	<!-- 网站头部 -->
	<%@ include file="common-header.jsp"%>
	<!-- //网站头部 -->
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
												<td class="text-center image">音乐图片</td>
												<td class="text-left name">音乐名称</td>
												<td class="text-left image">操作</td>
												
											</tr>
										</thead>
										<tbody>
										<!-- 遍历收藏夹中的音乐并显示 -->
											<%
	                                        
                                           	
	                                        int ID = -1;													//保存音乐ID的变量
	                                        String musicname = "";										//保存音乐名称的变量
	                                        String picture = "";											//保存音乐图片的变量
	//遍历音乐
	                                      for (int i = 0; i < fav.size(); i++) {
		                                   Musicelement Musicitem = (Musicelement) fav.elementAt(i);	//获取一个音乐
		                                   
		                                  ID = Musicitem.ID;										//获取音乐ID
		                                  if (ID > 0) {
			                              ResultSet rs_music = conn.executeQuery("select * from tb_music where musicID=" + ID);
			                               if (rs_music.next()) {
				                           musicname = rs_music.getString("musicname");		//获取音乐名称
			 	                           picture = rs_music.getString("picture");			//获取音乐图片
			                                   }
			                               conn.close();										//关闭数据库的连接
	                                         }
                                            %>
											
											<!-- 显示一条音乐信息 -->
											<tr>
												<td class="text-center image" width="20%"><a href="musicDetail.jsp?ID=<%=Musicitem.ID%>">
													<img width="80px" src="<%=picture%>"> </a></td>
												<td class="text-left name"><a
													href="musicDetail.jsp?ID=<%=Musicitem.ID%>"><%=musicname%></a>
												</td>
												<td class="text-left name"><a
													href="fav_del.jsp?ID=<%=Musicitem.ID%>">删除</a>
												</td>
												
											</tr>
											<!-- 显示一条音乐信息 -->
                                              <% 
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
	</div>
	

	
</body>
</html>
<% 
		}
		}
%>