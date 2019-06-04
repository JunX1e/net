<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.sql.ResultSet" %>
	<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>音乐分享网站</title>
<link rel="stylesheet" href="css/mr-01.css" type="text/css">
<jsp:useBean id="ins_hit" scope="page" class="com.dao.hitdaoimpl"/>
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
			<div id="mr-content"
				class="mr-content col-xs-12 col-sm-12 col-md-9 col-md-push-3">
				<div id="mrshop" class="mrshop common-home">
					<div class="container_oc">
						<div class="row">
							<div id="content_oc" class="col-sm-12 view-product">
								<!-- 根据音乐ID获取并显示音乐信息 -->
								<%
	int typeSystem = 0;									//保存音乐类型ID的变量
	int ID = Integer.parseInt(request.getParameter("ID"));	//获取音乐ID
	if (ID > 0) {
		ResultSet rs = conn.executeQuery("select * from tb_music where musicID=" + ID);	//根据ID查询音乐信息
		String musicName = "";							//保存音乐名称的变量
		String picture = "";								//保存音乐图片的变量
		int hit =-1;
		String uper="";
		String new_singer=" ";                                    //歌手 
		int t1=-1;
		int t2=-1;
		int t3=-1;
		String typeName1 = "";									//分类的变量 */
		String typeName2 = "";
		String typeName3 = "";
		String introduce = "";							//保存音乐描述的变量
		if (rs.next()) {									//如果找到对应的音乐信息
			musicName = rs.getString("musicName");					//获取音乐名称
			introduce = rs.getString("introduce");					//获取音乐描述		
			picture = rs.getString("picture");					//获取音乐图片		
		    hit = rs.getInt("hit");
			uper=rs.getString("uper");
			 new_singer=rs.getString("singer");                 //获取歌手
             /* typeName1=rs_newt.getString("typename");     */                    
             t1=rs.getInt("typeid1");
             t2=rs.getInt("typeid2");
             t3=rs.getInt("lantypeid");  
             if(t1!=-1)
             {
             	ResultSet rs_newt1 = conn.executeQuery(
             			"select typename from tb_type where  ID="+t1);
             	if(rs_newt1.next()){
             	typeName1=rs_newt1.getString("typename");
                   }
             }
             if(t2!=-1)
             {
             	ResultSet rs_newt2 = conn.executeQuery(
             			"select typename from tb_type where  ID="+t2);
             	if(rs_newt2.next()){
             	typeName2=rs_newt2.getString("typename");
                   }
             }
             if(t3!=-1)
             {
             	ResultSet rs_newt3 = conn.executeQuery(
             			"select typename2 from tb_lantype where  typeid="+t3);
             	if(rs_newt3.next()){
             	typeName3=rs_newt3.getString("typename2");
                   }
             }
		}
 		conn.close();									//关闭数据库连接
%>
								
								<!-- 显示音乐详细信息 -->
								<div class="row">
									<div class="col-xs-12 col-md-4 col-sm-4">
										<ul class="thumbnails" style="list-style: none">
											<li><a class="thumbnail" href="#"> <img src="<%=picture%>"></a></li>
										</ul>
									</div>
									<div class="col-xs-12 col-md-8 col-sm-8">
										<div style="margin-left: 30px; margin-top: 20px">
											<h1 class="product-title"><%=musicName%></h1>
											
											<ul class="list-unstyled price"><li>UPER:<%=uper%></li>
											<li>Singer:<%=new_singer %></li>
											<li>#<%=typeName1 %>#<%=typeName2 %>#<%=typeName3 %></li>
											
											</ul> 
											<div class="rating"><p></p></div>
											<div id="product"><hr>
												<div class="form-group">
														<button type="button" onclick='javascript:window.location.href="fav_add.jsp?MusicID=<%=ID%>"; ' class="btn btn-primary btn-primary">
															<i class="fa fa-shopping-cart"></i> 添加到收藏夹</button>
							
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-12 description_oc clearfix">
										<ul class="nav nav-tabs htabs">
											<li class="active" style="width: 150px"><a href="#tab-description" data-toggle="tab"
												aria-expanded="true">音乐介绍</a></li>
										</ul>
										<div class="tab-content" style="border: 1px solid #eee; overflow: hidden;">
											<div class="tab-pane active" id="tab-description">
												<%=introduce %>
											</div>
										</div>
									</div>
								</div>
                                  <%
                                  hit=hit+1;
                                 int ret= ins_hit.update(hit,ID);
                                  
                     
                                  
                                  
	                          } else {												//获取到的ID不合法
		                      out.println("<script language='javascript'>alert('您的操作有误');"
 			                  +"window.location.href='index.jsp';</script>");
	                           }
                                    %>
                                  
								<%-- <%-- <!-- //显示音乐详细信息 -->
								<!-- 显示相关音乐 -->
								<div class="mr-module related-products">
									<h3 class="module-title ">相关音乐</h3>
									<!-- 显示底部相关音乐 -->
									<jsp:include page="relatedmusic.jsp">
										<jsp:param name="typeSystem" value="1" />
									</jsp:include>
									<!-- // 显示底部相关音乐 -->
								</div>
								<!-- //显示相关音乐 --> --%>
								
								
							</div>
						</div>
					</div>

				</div>
			</div>
			
			<%-- <!-- //页面主体内容 -->
			<!-- 显示左侧热门音乐 -->
			<jsp:include page="leftHotmusic.jsp">
				<jsp:param name="typeSystem" value="1" />
			</jsp:include>
			<!-- // 显示左侧热门音乐 --> --%> 
		</div>
	</div>
	<!-- 版权栏 -->
	 <%@ include file="comment.jsp"%> 
	<!-- //版权栏 -->
	
	<%@ include file="musicplayer.jsp"%>
    
</body>
</html>
