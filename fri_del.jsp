<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.ResultSet"%> 		<%-- 导入java.sql.ResultSet类 --%>	
<%@ page import="java.util.Vector"%> 			<%-- 导入Java的向量类 --%>
<%@ page import="com.model.friend"%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/> <%-- 创建ConnDB类的对象 --%>
<jsp:useBean id="chStr" scope="page" class="com.tools.Chstr"/>
<jsp:useBean id="ins_fri_list" scope="page" class="com.dao.frillistdaoimpl"/>
<jsp:useBean id="fri_list" scope="request" class="com.model.fri_list">
<jsp:setProperty name="fri_list" property="*"/>
</jsp:useBean>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>收藏夹</title>
</head>
<body>

<%
	String username=(String)session.getAttribute("username");	//获取会员账号
	int ID = Integer.parseInt(request.getParameter("ID"));//获取音乐ID
	
	
	boolean Flag = false;//记录收藏夹内是否已经存在所要添加的音乐
	
	boolean flag1=false;
	
	
	
		ResultSet rs = conn.executeQuery("select * from tb_frilist where username='" + username + "'");
	    String frilist="";	
	    if(rs.next())
	    {
		frilist=rs.getString("fri_list");
	    }
	   String[] list1 = frilist.split("\\|");	
	   int lg= list1.length;
	   String[] list2 = new String[lg-1];
	   /* 新数据插入表头 */
	   for(int k = 0;k<lg-1;k++){
		   if(list1[k].equals(ID+"")){
		   	 list2[k]=list1[k+1];	
		   	 flag1=true; //已找到
		   	/* System.out.println("找到位置"+k); */
		   }
		   else{
			   if(flag1)
			   { list2[k] = list1[k+1]; }
			   else
		        {list2[k] = list1[k];
		  } 
		  }
		   }
	   
	   
	   String newlist= String.join("|",list2);
	   
		/* String newlist ="";
		int[] newlist1 = null;
		String[] newlist2 = null ;
		
		for (int j=0; j<fri.size(); j++)
		{
			Musicelement Musicitem = (Musicelement) fri.elementAt(j);//获取收藏夹内的一个音乐
			newlist1[j] = Musicitem.ID ;
			newlist2[j] = newlist1[j]+"" ;
		}
		
		newlist = String.join("|",newlist2);  
			    
		 */
		    fri_list.setUsername(username);
			fri_list.setFrilist(newlist);
			
			
			 int ret = 0;
			ret = ins_fri_list.update(fri_list); 
			if (ret != 0) {/* System.out.println("OK"); */}
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	
	conn.close();						//关闭数据库的连接
	
	session.removeAttribute("fri");
	
	ResultSet rs2 = conn.executeQuery("select * from tb_frilist where username='" + username + "'");
	
	String frilist2="";	
	
	
	if(rs2.next())
	{
		frilist2=rs2.getString("fri_list");
	}
	String[] list3 = frilist2.split("\\|");	
	
	
	int idtempt=-1;
	

	Vector fri = (Vector) session.getAttribute("fri");	//获取收藏夹对象
	
	if (fri == null) {									//如果收藏夹对象为空
		fri = new Vector();								//创建一个收藏夹对象
	}
	
	
	
	if(list3[0].equals(""))
	{
		session.setAttribute("fri", fri);
			
	}
	else
	{
		for(int j = 0;j<list2.length;j++ )
		{
		idtempt = Integer.parseInt(list2[j]);
		friend myfriend = new friend(); 
		myfriend.userID = idtempt;						//将音乐ID保存到myMusicelement对象中
		fri.addElement(myfriend);
		}
		
		
		session.setAttribute("fri", fri);
	}
	conn.close();						//关闭数据库的连接
	
	
	
	
	
	
	response.sendRedirect("fri_see.jsp");//重定向页面到查看收藏夹页面
%>




</body>
</html>