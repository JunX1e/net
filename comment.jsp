<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.ResultSet"%>		<%-- 导入java.sql.ResultSet类 --%>
<%-- 创建com.tools.ConnDB类的对象 --%>

<jsp:useBean id="conn2" scope="page" class="com.tools.ConnDB" />
  <%   
    /* 查询评论 */
    String username = (String)session.getAttribute("username");	//获取音乐ID */

    int musicid1 =Integer.parseInt(request.getParameter("ID")); 
  
	 ResultSet rs_new2 = conn2.executeQuery(
			"select  username,comment,time from tb_comment t1 where musicid="+musicid1
			);		
	String username1 = "";							//
	String comment1 = "";								
	String time1="";								
   %>
    
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="comment" style="margin:100px">
<h1>评论区</h1>
     <!-- 评论展示 -->
    <div class="comment-01">
        <ul>
        
        <% 
        int i=1;
                                         while (rs_new2.next()) 
                                          {						//设置一个循环
	                                          
                                        	 username1=rs_new2.getString("username");
                                             comment1=rs_new2.getString("comment");
	                                         time1=rs_new2.getString("time");                      
	                                                                             
	                                                                             
	                                                                       
                                               %>
                                               
                                               
        <li >
         <%=i %>楼  <br>
        用户名：<%=username1%> <br>
        <%=comment1%>  <br>
        <%-- <%=musicid1%> --%>
       评论日期： <%=time1 %>
         </li>
        <div style="width:800px;height:1px;margin-left:0px ;padding:0px;background-color:#D5D5D5;overflow:hidden;"></div>
         <% 
           i++;
                                          } 
         %>
              </ul>
    </div>
     <!-- 写评论 -->
	<div class="comment-02">
			<form  action="comment_deal.jsp"
						 method="post"  >
				<div class="form-group">
									
										<input type="hidden" name="username"
									value="<%=username%>" >
									
			   </div>
			  <div class="form-group">
									
										<input type="hidden" name="id"
									value="<%=musicid1%>" >
									
			</div>
				
				<div class="form-group">
				<input type="text" name="comment" style="width:800px">
				</div>
		
			<button  style="float:left; margin-left:700px" type="submit" >submit</button>
			<div class="clear"></div>
		</form>
</div>
	<!--start-copyright-->
   		<div class="copy-right" style=" margin-left:700px">
   			<div class="wrap">
				<p>*请不要发表不良评论！*</p>
		</div>
	</div>
	<!--//end-copyright-->
	</div>
</body>
</html>