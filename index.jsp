<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>		<%-- 导入java.sql.ResultSet类 --%>
<%-- 创建com.tools.ConnDB类的对象 --%>

<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />

<%
	/* 最新音乐音乐信息 */
	ResultSet rs_new = conn.executeQuery(
			"select top 9  t1.musicID,t1.musicName,t1.picture,t1.uper,t1.singer,t1.typeid1,t1.typeid2,t1.lantypeid  "
					+"from tb_music t1 where freeze = 0"+"order by t1.intime desc"
			);		//查询最新上传的音乐信息
	ResultSet rs_new1 = conn.executeQuery(
					"select top 9 t1.musicID,t1.musicName,t1.picture,t1.uper,t1.singer,t1.typeid1,t1.typeid2,t1.lantypeid "
					+"from tb_music t1 where freeze = 0"+"order by t1.hit desc"
					);		//查询最热音乐信息

					
					
					
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
<title>首页-音乐分享网站</title>
<link rel="stylesheet" href="css/mr-01.css" type="text/css"> 
<link rel="stylesheet" href="css/player.css" type="text/css">
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

			
		 <!-- 轮播广告及热门音乐 -->
	<div class="container mr-sl mr-sl-1">
		<div class="mr-spotlight mr-spotlight-1  row">
			
			<!-- 显示轮播广告 -->
			<div
				class=" col-lg-9 col-md-12  col-sm-3 hidden-sm   col-xs-6 hidden-xs ">
				<div class="mr-module module " id="Mod159">
					<div class="module-inner">
						<div class="module-ct">
							<div class="mijoshop">
								<div class="container_oc">
									<div class="slideshow">
										<div id="slidershow" class="nivoSlider">
											<a href="https://music.163.com/#/album?id=75871739"  target="_blank"class="nivo-imageLink" style="display: block;"><img
												src="images/png8.png" class="img-responsive"
												style="display: none;"> </a> 
												
											<a href="https://music.163.com/#/song?id=1315718569" target="_blank"
												class="nivo-imageLink" style="display: none;"> <img
												src="images/png9.png" class="img-responsive"
												style="display: none;">
											</a> <a href="https://www.xiami.com/album/2104617467" target="_blank" class="nivo-imageLink" style="display: none;">
												<img src="images/png10.png" class="img-responsive"
												style="display: none;">
											</a> <a href="https://www.xiami.com/album/2104655681" target="_blank"  class="nivo-imageLink" style="display: none;">
												<img src="images/png11.png" class="img-responsive"
												style="display: none;">
											</a>
										</div>
									</div>
									<script type="text/javascript">
										//实现调用幻灯片插件轮播广告
									
										jQuery(document).ready(function() {
											jQuery('#slidershow').nivoSlider();
										});
									//-->
									</script>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 显示热门音乐 -->
			 <div class="col-lg-3  col-md-6 hidden-md   col-sm-3 hidden-sm   col-xs-6 hidden-xs ">
				<div class="mr-module module highlight " id="Mod160">
					<div class="module-inner">
						<h3 class="module-title ">
							<span>站长信息
						</span>
						</h3>
						

										<div class="box-product "style="margin-left:20px ;margin-top:10px;">
											<div>
												<div class="image">
												
												<img  style="width:236px; height:165px;" src="images/leader.jpg">
												
												<div class="leader" style=" font-size:16px;">
													   站长：fgnb <br>
													   联系方式：2580695477@qq.com <br>
													   有对网站的建议或是解封请求请联系站长
													
												</div>
												
											</div>
										</div> 

										<!-- // 循环显示热门音乐 ：添加两条音乐信息-->
			 						</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			
	

	
	
	
	<div class="custom">
		<div>
			<div class="ja-tabswrap default" style="width: 100%;">
				<div id="myTab" class="container">

					<h3 class="index_h3">
						<span class="index_title">最新音乐</span> <a style="margin-left:75%;font-size:12px;" href="allmusic.jsp">更多>></a>
					</h3>
					<!-- //最新上架选项卡 -->
					<div class="ja-tab-content ja-tab-content col-6 active"
						style="opacity: 1; width: 100%; visibility: visible;">
						<div class="ja-tab-subcontent">
							<div class="mijomusic">
								<div class="container_oc">
									<div class="row">
										<!-- 循环显示最新上架音乐 ：添加12条音乐信息-->
										<% 
				
                                         while (rs_new.next()) 
                                          {						//设置一个循环
	                                           
                                        	 new_musicID = rs_new.getInt("musicID"); 					//获取ID
	                                         new_musicname = rs_new.getString("musicname"); 			//获取名称
	                                         new_uper = rs_new.getString("uper"); 			//获取UP
	                                         new_picture = rs_new.getString("picture"); 			//获取图片 
	                                         new_singer=rs_new.getString("singer");                 //获取歌手
	                                         /* typeName1=rs_newt.getString("typename");     */                    
	                                         t1=rs_new.getInt("typeid1");
                                             t2=rs_new.getInt("typeid2");
                                             t3=rs_new.getInt("lantypeid");  
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
														<div class="actions" >
															<div   class="image" >
																<a href="musicDetail.jsp?ID=<%=new_musicID%>">
																<img  src="<%=new_picture%>" alt="<%=new_musicname%>" class="img-responsive"></a>
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
																<a href="userDetail.jsp?ID=<%=new_uper%>"> Uploader：<%=new_uper%></a>
																#<%=typeName1%>
																#<%=typeName2%>
																#<%=typeName3%>
																</div>
															</div>
															
														</div>
													</div>
												</div>
											<%  } %>	
										<!-- //循环显示最新上架音乐：添加12条音乐信息 -->
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- //最新上架选项卡 -->
					<!-- 音乐选项卡 -->
					<h3 class="index_h3"><span class="index_title">最热音乐</span><a style="margin-left:75%;font-size:12px;" href="allmusic.jsp">更多>></a></h3>
					<div class="ja-tab-subcontent">
						<div class="mijoshop">
							<div class="container_oc">
								<div class="row">
									<!-- 最热音乐 -->
									<% 
				
                                         while (rs_new1.next()) 
                                          {						//设置一个循环
	                                           
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
												
												<% } %>
									<!-- 最热音乐-->
									
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- //音乐 选项卡-->
			</div>
		</div>
	</div>
	<!-- </nav> -->
	<!-- //最新上架及打折音乐展示 -->
	<!-- 提示信息栏 -->
	<%-- <%@ include file="common-footer.jsp"%> --%>
	<!-- //信息栏 -->
	
		
		
		
	



 
		
		
		
		
		
	</body>

					
		
		
		
		
		
		
		
		

</html>