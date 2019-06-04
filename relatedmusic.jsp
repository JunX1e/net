<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>

<%@ page import="java.util.Vector"%>			<%-- 导入Java的向量类 --%>
<%@ page import="java.text.DecimalFormat"%>	<%-- 导入格式化数字的类 --%>
<%@ page import="com.model.Musicelement"%>		<%-- 导入购物车音乐的模型类 --%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<%
int typeSystem1=-1;
int typeSystem2=-1;
int id1=-1;
int id2=-1;
int id3=-1;
int flag=0;
int[] arr={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
int[] arr1={0,0,0,0,0,0,0}; 
 String username = (String) session.getAttribute("username");//获取会员账号
//如果没有登录，将跳转到登录页面
if (username == "" || username == null) {
	response.sendRedirect("login.jsp");					//重定向页面到会员登录页面
	return;												//返回
} else {
	Vector fav = (Vector) session.getAttribute("fav");	//获取对象
	if (fav == null || fav.size() == 0) {				//如果为空
					typeSystem1=1;
	                typeSystem2=1;
	               flag=1;
	} else {
		int ID = -1;	
		  for (int i = 0; i < fav.size(); i++) {
              Musicelement Musicitem = (Musicelement) fav.elementAt(i);	//获取一个音乐
              
             ID = Musicitem.ID;										//获取音乐ID
             if (ID > 0) {
             ResultSet rs_music = conn.executeQuery("select * from tb_music where musicID=" + ID);
              if (rs_music.next()) {
                  id1=rs_music.getInt("typeid1"); 
                  id2=rs_music.getInt("typeid2"); 
                  id3=rs_music.getInt("lantypeid"); 
                  }
              conn.close();										//关闭数据库的连接
                
             switch(id1){
             case 1:
            	 arr[1]++;
            	 break;
             case 2:
            	 arr[2]++;
            	 break;
             case 3:
            	 arr[3]++;
            	 break;
             case 4:
            	 arr[4]++;
            	 break;
             case 5:
            	 arr[5]++;
            	 break;
             case 6:
            	 arr[6]++;
            	 break;
             case 7:
            	 arr[7]++;
            	 break;
             case 8:
            	 arr[8]++;
            	 break;
             case 9:
            	 arr[9]++;
            	 break;
             case 10:
            	 arr[10]++;
            	 break;
             case 11:
            	 arr[11]++;
            	 break;
             case 12:
            	 arr[12]++;
            	 break;
             case 13:
            	 arr[13]++;
            	 break;
             case 14:
            	 arr[14]++;
            	 break;
             case 15:
            	 arr[15]++;
            	 break;	 
             default:
            	 break;
             }
             switch(id2){
             case 1:
            	 arr[1]++;
            	 break;
             case 2:
            	 arr[2]++;
            	 break;
             case 3:
            	 arr[3]++;
            	 break;
             case 4:
            	 arr[4]++;
            	 break;
             case 5:
            	 arr[5]++;
            	 break;
             case 6:
            	 arr[6]++;
            	 break;
             case 7:
            	 arr[7]++;
            	 break;
             case 8:
            	 arr[8]++;
            	 break;
             case 9:
            	 arr[9]++;
            	 break;
             case 10:
            	 arr[10]++;
            	 break;
             case 11:
            	 arr[11]++;
            	 break;
             case 12:
            	 arr[12]++;
            	 break;
             case 13:
            	 arr[13]++;
            	 break;
             case 14:
            	 arr[14]++;
            	 break;
             case 15:
            	 arr[15]++;
            	 break;	 
             default:
            	 break;
             }
             switch(id3){
             case 1:
            	 arr1[1]++;
            	 break;
             case 2:
            	 arr1[2]++;
            	 break;
             case 3:
            	 arr1[3]++;
            	 break;
             case 4:
            	 arr1[4]++;
            	 break;
             case 5:
            	 arr1[5]++;
            	 break;
             case 6:
            	 arr1[6]++;
            	 break;
         	 
             default:
            	 break;
             }
             
             }

	
		  }
		  int max1=0;
		  int max2=0;
		  
		  for(int i=1;i<16;i++){
			 if(max1<arr[i])
			 {
				 max1=arr[i];
				 typeSystem1=i;
			 }
			  
		  }
		  for(int i=1;i<7;i++){
				 if(max2<arr1[i])
				 {
					 max2=arr1[i];
					 typeSystem2=i;
				 }
				  
			  }
		  
		  
	}
}


%>




	<%
		ResultSet rs_relate = conn.executeQuery(
				"select top 12 * from tb_music where typeid1=" + typeSystem1+" and lantypeid= "+typeSystem2 + "or typeid2= "+typeSystem1);
		
	
	
	
	
	int relate_musicID = 0;										//ID的变量
		String relate_musicname = "";							//名称的变量
		String relate_uper = "";								//上传者的变量
		String relate_picture = " ";								//图片的变量
		String relate_singer=" ";                                    //歌手 
		int t1=-1;
		int t2=-1;
		int t3=-1;
		String typeName1 = "";									//分类的变量 */
		String typeName2 = "";
		String typeName3 = "";
		String typename1 = "";
		String typename2 = "";
	if(typeSystem1!=-1)
        {
        	ResultSet rs_newt1 = conn.executeQuery(
        			"select typename from tb_type where  ID="+typeSystem1);
        	if(rs_newt1.next()){
        	typename1=rs_newt1.getString("typename");
              }
        }
    if(typeSystem2!=-1)
        {
    	ResultSet rs_newt3 = conn.executeQuery(
     			"select typename2 from tb_lantype where  typeid="+typeSystem2);
     	if(rs_newt3.next()){
     	typename2=rs_newt3.getString("typename2");
           }
        }
		
		
	%>
<div class="custom">
		<div>
			<div class="ja-tabswrap default" style="width: 100%;">
				<div id="myTab" class="container">

					<h3 class="index_h3">
						<span class="index_title">为你推荐</span>
					</h3>
	                  <div class="ja-tab-content ja-tab-content col-6 active"
						style="opacity: 1; width: 100%; visibility: visible;">
						<div class="ja-tab-subcontent">
							<div class="mijomusic">
								<div class="container_oc">
									<div class="row">
								<h2>根据你喜爱的音乐本站为你推荐#<%=typename1%>#<%=typename2%>类的音乐</h2>	
					
										<!-- 循环信息-->
										<% 
				
                                         while (rs_relate.next()) 
                                          {						//设置一个循环
	                                           
                                        	 relate_musicID = rs_relate.getInt("musicID"); 					//获取ID
	                                         relate_musicname = rs_relate.getString("musicname"); 			//获取名称
	                                         relate_uper = rs_relate.getString("uper"); 			//获取UP
	                                         relate_picture = rs_relate.getString("picture"); 			//获取图片 
	                                         relate_singer=rs_relate.getString("singer");                 //获取歌手
	                                         /* typeName1=rs_relatet.getString("typename");     */                    
	                                         t1=rs_relate.getInt("typeid1");
                                             t2=rs_relate.getInt("typeid2");
                                             t3=rs_relate.getInt("lantypeid");  
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
																<a href="musicDetail.jsp?ID=<%=relate_musicID%>">
																<img  src="<%=relate_picture%>" alt="<%=relate_musicname%>" class="img-responsive"></a>
															</div>
															<div class="button-group">
																<div class="cart">
																	<button class="btn btn-primary btn-primary" type="button" data-toggle="tooltip"
																		onclick='javascript:window.location.href="fav_add.jsp?MusicID=<%=relate_musicID%>"; '
																		style="display: none; width: 33.3333%;" data-original-title="加入到收藏夹">
																		<i class="fa fa-shopping-cart"></i>
																	</button>
																</div>
															</div> 
														</div>
														<div class="caption" >
															<div class="name" style="margin-top: 5px; font-size:14px">
																<a href="musicDetail.jsp?ID=<%=relate_musicID%>"> <span style="color: #0885B1"></span>  <%=relate_musicname%>
																</a>
																<div class="name" style="margin-top: 0px; font-size:12px" >
																
																Singer: <%=relate_singer %><br/>
																<a href="userDetail.jsp?ID=<%=relate_uper%>"> Uploader：<%=relate_uper%></a>
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
	           </div>
	      </div>
	 </div>

</div>