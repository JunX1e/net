<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%> 		<%-- 导入java.sql.ResultSet类 --%>	
<%@ page import="java.util.Vector"%> 			<%-- 导入Java的向量类 --%>
<%@ page import="com.model.Musicelement"%> 	<%-- 导入收藏夹音乐模型类 --%>
<%@ page import="com.model.friend"%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/> <%-- 创建ConnDB类的对象 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
	String username=(String)session.getAttribute("username");	//获取会员账号
	int idtempt= -1;	
	int idtempt2= -1;
	boolean flagkey =true; //整体判断	
	
	//如果没有登录成功，将不载入
	if (username == null || username == "") {
		
		return;//返回
	}
	else{
	/*读取收藏列表  */
	
	ResultSet rs = conn.executeQuery("select * from tb_favlist where username='" + username + "'");
	ResultSet rs1 = conn.executeQuery("select * from tb_frilist where username='" + username + "'");
	String favlist="";	
	String frilist="";
	
	if(rs.next())
	{
		favlist=rs.getString("fav_list");
	}
	String[] list1 = favlist.split("\\|");	
	
	
	if(rs1.next())
	{
		frilist=rs1.getString("fri_list");
	}
	String[] list2 = frilist.split("\\|");
	

	Vector fav = (Vector) session.getAttribute("fav");	//获取收藏夹对象
	
	if (fav == null) {									//如果收藏夹对象为空
		fav = new Vector();								//创建一个收藏夹对象
	}
	
	
	
	if(list1[0].equals(""))
	{
		session.setAttribute("fav", fav);
			
	}
	else
	{
	for(int i = 0;i<list1.length;i++ )
	{
	idtempt = Integer.parseInt(list1[i]);
	Musicelement myMusicelement = new Musicelement(); 
	myMusicelement.ID = idtempt;						//将音乐ID保存到myMusicelement对象中
	fav.addElement(myMusicelement);
	}
	session.setAttribute("fav", fav);
	
	}
	
	
	
	
    Vector fri = (Vector) session.getAttribute("fri");	//获取收藏夹对象
	
	if (fri == null) {									//如果收藏夹对象为空
		fri = new Vector();								//创建一个收藏夹对象
	}
	
	if(list2[0].equals(""))
	{
		session.setAttribute("fri", fri);
		
	}
	else
	{
	for(int j = 0;j<list2.length;j++ )
	{
	idtempt2 = Integer.parseInt(list2[j]);
	friend myfriend = new friend(); 
	myfriend.userID = idtempt2;						//将音乐ID保存到myMusicelement对象中
	fri.addElement(myfriend);
	}
	
	
	session.setAttribute("fri", fri);
	
	} 
	response.sendRedirect("index.jsp");//跳转到前台首页
	}
	%>
</body>
</html>