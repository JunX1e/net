<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%><%-- 导入java.sql.ResultSet类 --%>
<%-- 创建com.tools.ConnDB类的对象 --%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<jsp:useBean id="chStr" scope="page" class="com.tools.Chstr" /><%-- 创建ChStr类的对象 --%>
<%
	String searchword = request.getParameter("searchword");
	searchword = chStr.chStr(searchword);
	ResultSet rs_new1 = conn.executeQuery(
			"select * from tb_music t1 where  freeze = 0 and t1.musicname like '%"
					+ searchword + "%' or singer like '%"+searchword+"%'or uper like '%"+searchword+"%'");
	int new_musicID = 0;										//ID的变量
	String new_musicname = "";							//名称的变量
	String new_uper = "";								//上传者的变量
	String new_picture = " ";								//图片的变量
	String new_singer=" ";                                    //歌手 
	int t1=-1;
	int t2=-1;
	int t3=-1;
	String typeName1 = "";									//分类的变量 */
	String typeName2 = "";
	String typeName3 = "";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>搜索结果</title>
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

			<!-- 显示搜索到的列表 -->
			<div id="mr-content"
				class="mr-content col-xs-12 col-sm-12 col-md-9 col-md-push-3" style="margin-left:-200px;">

				<div id="system-message-container" style="display: none;"></div>

				<div id="mrshop" class="mrshop common-home">
					<div class="container_oc">
						<ul class="breadcrumb">
						</ul>
						<div class="row">
							<div id="content_oc" class="col-sm-12">
								<div class="box_oc">
									<div class="box-heading">
										<h1 class="mrshop_heading_h1">搜索结果</h1>
									</div>
									<div class="box-content1">
										<hr>
										<div class="row">
											<%
												String str = (String) request.getParameter("Page");
												if (str == null) {
													str = "0";
												}
												int pagesize = 8;
												rs_new1.last();
												int RecordCount = rs_new1.getRow();
												if (RecordCount == 0) {
													out.println(
															"<script language='javascript'>alert('搜索没有记录!');window.location.href='index.jsp';</script>");
													return;
												}
												int maxPage = 0;
												maxPage = (RecordCount % pagesize == 0) ? (RecordCount / pagesize) : (RecordCount / pagesize + 1);

												int Page = Integer.parseInt(str);
												if (Page < 1) {
													Page = 1;
												} else {
													if (Page > maxPage) {
														Page = maxPage;
													}
												}
												rs_new1.absolute((Page - 1) * pagesize + 1);
												for (int i = 1; i <= pagesize; i++) {
													 new_musicID = rs_new1.getInt("musicID"); 					//获取ID
			                                         new_musicname = rs_new1.getString("musicname"); 			//获取名称
			                                         new_uper = rs_new1.getString("uper"); 			//获取UP
			                                         new_picture = rs_new1.getString("picture"); 			//获取图片 
			                                         new_singer=rs_new1.getString("singer");                 //获取歌手
			                                         t1=rs_new1.getInt("typeid1");
		                                             t2=rs_new1.getInt("typeid2");
		                                             t3=rs_new1.getInt("lantypeid");  
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
													
											%>
											<div
													class="music-show col-lg-4 col-md-4 col-sm-6 col-xs-12">
													<div class="music-thumb transition">
														<div class="actions">
															<div class="image">
																<a href="musicDetail.jsp?ID=<%=new_musicID%> "><img src="<%=new_picture%>"
																	alt="   " class="img-responsive"> </a>
															</div>
															<div class="button-group">
																<div class="cart">
																	<button class="btn btn-primary btn-primary" type="button" data-toggle="tooltip"
																		onclick='javascript:window.location.href="fav_add.jsp?MusicID=<%=new_musicID%>"; '
																		style="display: none; width: 33.3333%;" data-original-title="加入到收藏夹">
																		<i class="fa fa-shopping-cart"></i>
																	</button>
																</div>
															</div>
														</div>
														<div class="caption" >
															<div class="name" style="margin-top: 5px; font-size:14px">
																<a href="musicDetail.jsp?ID=<%=new_musicID%>"> <span style="color: #0885B1"></span>  <%=new_musicname%>
																</a>
																<div class="name" style="margin-top: 0px; font-size:12px" >
																
																Singer: <%=new_singer %><br/>
																<a href="userDetail.jsp?ID=<%=new_uper%>">Uploader：<%=new_uper%></a>
																
																#<%=typeName1%>
																#<%=typeName2%>
																#<%=typeName3%>
																
																</div>
															</div>
															
														</div>
															
														</div>
													</div>
											<% 	try {
														if (!rs_new1.next()) {
															break;
														}
													} catch (Exception e) {
													}
												}
											%>
										</div>
										<div class="row pagination">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td height="30" align="right">当前页数：[<%=Page%>/<%=maxPage%>]&nbsp;
														<%
															if (Page > 1) {
														%> <a
														href="search_result.jsp?Page=1&searchword=<%=searchword%>">第一页</a>
														<a
														href="search_result.jsp?Page=<%=Page - 1%>&searchword=<%=searchword%>">上一页</a>
														<%
															}
															if (Page < maxPage) {
														%> <a
														href="search_result.jsp?Page=<%=Page + 1%>&searchword=<%=searchword%>">下一页</a>
														<a
														href="search_result.jsp?Page=<%=maxPage%>&searchword=<%=searchword%>">最后一页&nbsp;</a>
														<%
															}
														%>
													</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- //显示搜索到的图书列表-->
			<!-- 显示左侧热门商品 -->
			<%-- <jsp:include page="leftHotGoods.jsp" /> --%>
			<!-- // 显示左侧热门商品 -->

		</div>
	</div>
	<!-- 版权栏 -->
	<%@ include file="common-footer.jsp"%>
	<!-- //版权栏 -->
</body>
</html>