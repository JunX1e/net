<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%><%-- 导入java.sql.ResultSet类 --%>
<%-- 创建com.tools.ConnDB类的对象 --%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<jsp:useBean id="chStr" scope="page" class="com.tools.Chstr" /><%-- 创建ChStr类的对象 --%>
<%
	
	ResultSet rs_new = conn.executeQuery(
			"select   t1.musicID,t1.musicName,t1.picture,t1.uper,t1.singer,t1.typeid1,t1.typeid2,t1.lantypeid  "
					+"from tb_music t1 "+"where  freeze = 0  order by t1.hit desc"); //默认按热度

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
String str = (String) request.getParameter("Page");
String ord = (String)request.getParameter("ord");
String type= (String)request.getParameter("type");
if (ord == null) {
	ord="0";
}
if (type == null) {
	type = "1";
}
if (ord.equals("1"))
{
	rs_new = conn.executeQuery(
			"select   t1.musicID,t1.musicName,t1.picture,t1.uper,t1.singer,t1.typeid1,t1.typeid2,t1.lantypeid  "
					+"from tb_music t1 where typeid1= "+type+"or typeid2 = "+type+"order by t1.intime desc");	
}
else if(ord.equals("0"))
{
	rs_new = conn.executeQuery(
			"select   t1.musicID,t1.musicName,t1.picture,t1.uper,t1.singer,t1.typeid1,t1.typeid2,t1.lantypeid  "
					+"from tb_music t1 where typeid1= "+type+"or typeid2 = "+type+"order by t1.hit desc");
}




if (str == null) {
	str = "0";
}
int pagesize = 12;
rs_new.last();
int RecordCount = rs_new.getRow();
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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>全部音乐</title>
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
	<div class="custom">
		<div>
			<div class="ja-tabswrap default" style="width: 100%;">
				<div id="myTab" class="container">

					<h3 class="index_h3">
						<span class="index_title">全部音乐</span><a id="selectshow" style="margin-left:75%;font-size:12px;" >筛选</a>
					
					</h3>
					<!-- //最新上架选项卡 -->
					
					<div class="ja-tab-content ja-tab-content col-6 active"
						style="opacity: 1; width: 100%; visibility: visible;">
						<div class="ja-tab-subcontent">
							<div class="mijomusic">
								<div class="container_oc">
									<div class="row">
										<!-- 循环显示最新上架音乐 ：添加12条音乐信息-->
										<div id="select" style=" margin:5px; height:50px; width:500px; position:fixed; right:10px;top:-500px; opacity:0.8; background:white; z-index:999;">
										<form  action="show_deal.jsp"
						 method="post"
						class="form-horizontal" >
						<div style="float:left; margin:5px;">
										<select name="ord" > 
                                         <option value="0"> 按热度排序 </option> 
                                          <option value="1">按时间排序</option> 
                                         </select> 
                                         </div>
                                         <div style="float:left; margin:5px;" >
                                         <select name="type" > 
                                          <option value="1">无</option> 
                                         <%
									ResultSet rs_type = conn.executeQuery("select * "
										+ "  from tb_type ");
									String type1="";
									int typeid=-1;
									while(rs_type.next()){
									type1=rs_type.getString("typename");
									typeid=rs_type.getInt("id");
									%>                    
									<option value="<%=typeid%>"><%=type1%></option> 
									<%
									}
									%>
                                         
                                         </select>
                                        </div>
                                         <button type="submit" class="btn btn-primary pull-left" style="width:100px; margin:5px;">确认</button>
                                        </form>
                                        </div>
                                        <div>  
                                       
								<% 
										
										rs_new.absolute((Page - 1) * pagesize + 1);
										for (int i = 1; i <= pagesize; i++) {
                                       
	                                           
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
											
											<%
												try {
														if (!rs_new.next()) {
															break;
														}
													} catch (Exception e) {
													}
												}
											%>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
										
											
										</div>
										<div class="row pagination">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td height="30" align="right">当前页数：[<%=Page%>/<%=maxPage%>]&nbsp;
														<%
															if (Page > 1) {
														%> <a
														href="allmusic.jsp?Page=1">第一页</a>
														<a
														href="allmusic.jsp?Page=<%=Page - 1%>">上一页</a>
														<%
															}
															if (Page < maxPage) {
														%> <a
														href="allmusic.jsp?Page=<%=Page + 1%>">下一页</a>
														<a
														href="allmusic.jsp?Page=<%=maxPage%>">最后一页&nbsp;</a>
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
	<script>
	var flag = 0;
	var oselect = document.getElementById("select")
	var oselectshow =  document.getElementById("selectshow")
	oselectshow.onclick = function(){
		                     if(flag==0){ 
		                    	 oselect.style.top="250px" 
		                          flag=1	
		                     }
		                     else{
			            	 oselect.style.top="-500px"
			            	  flag=0;
			            	 
		                     }
		             }
	</script>
</body>
</html>