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
	String username=(String)session.getAttribute("username");	//获取会员账号
	int ID = Integer.parseInt(request.getParameter("MusicID"));//获取音乐ID
	int idtempt= -1;
	/* String bid= ID+" ";//判断需要 */
	boolean Flag = true;//记录收藏夹内是否已经存在所要添加的音乐
	Musicelement myMusicelement = new Musicelement(); 
	myMusicelement.ID = ID;						//将音乐ID保存到myMusicelement对象中
	
	
	//如果没有登录，将跳转到登录页面
	if (username == null || username == "") {
		response.sendRedirect("login.jsp");					//重定向页面到会员登录页面
		return;//返回
	}
	
	/*读取收藏列表  */
	
	/* ResultSet rs = conn.executeQuery("select * from tb_favlist where username='" + username + "'");
	String favlist="";	
	if(rs.next())
	{
		favlist=rs.getString("fav_list");
	}
	String[] list1 = favlist.split("\\|");	
	

	Vector fav = (Vector) session.getAttribute("fav");	//获取收藏夹对象
	if (fav == null) {									//如果收藏夹对象为空
		fav = new Vector();								//创建一个收藏夹对象
	}
	
	for (int k=0; k < list1.length ; k++)
	{
	  if( bid.equals(list1[j]) )
	  {
		 flagkey = false ;   //收藏夹中已有该首歌曲
		  
	 }
	
	for(int i = 0;i<list1.length;i++ )
	{
	idtempt = Integer.parseInt(list1[i]);
	Musicelement myMusicelement = new Musicelement(); 
	myMusicelement.ID = idtempt;						//将音乐ID保存到myMusicelement对象中
	fav.addElement(myMusicelement);
	}
	
	 */
	
	
	/* --- */
	
	
	
	
	
	
	
	/* if(list1.length == 0)
	{
		out.println("<script language='javascript'> alert('原收藏夹为空')  </script>");	
	} 
	else
	{
		for (int j=0;j < list1.length ; j++)
		{
		  if( bid.equals(list1[j]) )
		  {
			  Flag = false ;   //收藏夹中已有该首歌曲
			  
		 }
           		  
		  
   }
		  
			
		}
	Musicelement myMusicelement = new Musicelement(); 
	myMusicelement.ID = ID;						//将音乐ID保存到myMusicelement对象中

	
	if (Flag)	
	{
		fav.addElement(myMusicelement);
		
		}	//音乐保存到收藏夹中 */
	
	
	
	
							
	 Vector fav = (Vector) session.getAttribute("fav");	//获取收藏夹对象
	if (fav == null) {									//如果收藏夹对象为空
		fav = new Vector();								//创建一个收藏夹对象
	} else {
		//判断收藏夹内是否已经存在音乐
		for (int i = 0; i < fav.size(); i++) {
			Musicelement Musicitem = (Musicelement) fav.elementAt(i);//获取收藏夹内的一个音乐
			if (Musicitem.ID == myMusicelement.ID) {	//如果当前要添加的音乐已经在收藏夹中
				Flag = false;			//设置标记变量Flag为false，代表收藏夹中存在该音乐
			}
		}
	}
	if (Flag)		
		//如果收藏夹内不存在该音乐
		{
		
		
		fav.addElement(myMusicelement);//音乐保存到收藏夹中 
		
		
		
		/*更新记录到数据库*/
		ResultSet rs = conn.executeQuery("select * from tb_favlist where username='" + username + "'");
	    String favlist="";	
	    if(rs.next())
	    {
		favlist=rs.getString("fav_list");
	    }
	   String[] list1 = favlist.split("\\|");	
	   int lg= list1.length;
	   String[] list2 = new String[lg+1];
	   /* 新数据插入表头 */
	   for(int k = 0;k<lg+1;k++){
		   if(k == 0){
		   list2[k] = ID+"";		   
		   }
		   else{
		  list2[k] = list1[k-1];
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
			if (ret != 0) {/* System.out.println("OK"); */}
		
		
		
	
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	session.setAttribute("fav", fav);	//将收藏夹对象添加到Session中
	
	
	conn.close();						//关闭数据库的连接
	
	
	response.sendRedirect("fav_see.jsp");//重定向页面到查看收藏夹页面
%>




</body>
</html>