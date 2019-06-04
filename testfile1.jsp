<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.ResultSet"%> 		<%-- 导入java.sql.ResultSet类 --%>	
<%@ page import="java.util.Vector"%> 			<%-- 导入Java的向量类 --%>
<%@ page import="com.model.Musicelement"%> 	<%-- 导入收藏夹音乐模型类 --%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/> <%-- 创建ConnDB类的对象 --%>
<jsp:useBean id="chStr" scope="page" class="com.tools.Chstr"/>
<jsp:useBean id="ins_fav_list" scope="page" class="com.dao.fav_listdaoImpl"/>
<jsp:useBean id="fav_list" scope="request" class="com.model.fav_list">
<jsp:setProperty name="fav_list" property="*"/>
</jsp:useBean>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>收藏夹</title>
</head>
<body>

<%
	String username="tom";	//获取会员账号
	int ID =7;//获取音乐ID
	
	boolean Flag = false;//记录收藏夹内是否已经存在所要添加的音乐
	
	boolean flag1=false;
	
	
	
		ResultSet rs = conn.executeQuery("select * from tb_favlist where username='" + username + "'");
	    String favlist="";	
	    if(rs.next())
	    {
		favlist=rs.getString("fav_list");
	    }
	   String[] list1 = favlist.split("\\|");	
	   int lg= list1.length;
	   String[] list2 = new String[lg-1];
	   /* 新数据插入表头 */
	   for(int k = 0;k<lg-1;k++){
		   if(list1[k].equals(ID+"")){
		   	 list2[k]=list1[k+1];	
		   	 flag1=true; //已找到
		   	System.out.println("找到位置"+k);
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
		
		for (int j=0; j<fav.size(); j++)
		{
			Musicelement Musicitem = (Musicelement) fav.elementAt(j);//获取收藏夹内的一个音乐
			newlist1[j] = Musicitem.ID ;
			newlist2[j] = newlist1[j]+"" ;
		}
		
		newlist = String.join("|",newlist2);  
			    
		 */
		    fav_list.setUsername(username);
			fav_list.setFav_list(newlist);
			
			
			 int ret = 0;
			ret = ins_fav_list.update(fav_list); 
			if (ret != 0) {System.out.println("OK");}
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	
	conn.close();						//关闭数据库的连接
	
	
	
%>
<%=newlist %>




</body>
</html>