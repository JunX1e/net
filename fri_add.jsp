<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.ResultSet"%> 		<%-- 导入java.sql.ResultSet类 --%>	
<%@ page import="java.util.Vector"%> 			<%-- 导入Java的向量类 --%>
<%@ page import="com.model.friend"%> 	<%-- 导入收藏夹音乐模型类 --%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/> <%-- 创建ConnDB类的对象 --%>
<jsp:useBean id="chStr" scope="page" class="com.tools.Chstr"/>
<jsp:useBean id="ins_fri_list" scope="page" class="com.dao.frillistdaoimpl"/>
<jsp:useBean id="fri_list" scope="request" class="com.model.fri_list">
<jsp:setProperty name="fri_list" property="*"/>
</jsp:useBean>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  String username=(String)session.getAttribute("username");	//获取会员账号
	String username1 =request.getParameter("ID");//获取音乐ID
	int userID=-1;
	ResultSet rsid = conn.executeQuery("select  * "
			+"from tb_member where username ='" + username1 + "'");	//getid
    if(rsid.next())
    {userID=rsid.getInt("id");}
	
	int idtempt= -1;
	/* String bid= ID+" ";//判断需要 */
	boolean Flag = true;//记录收藏夹内是否已经存在所要添加的音乐
	friend myfriend = new friend(); 
	myfriend.userID = userID;						//将音乐ID保存到myMusicelement对象中
	
	
	//如果没有登录，将跳转到登录页面
	if (username == null || username == "") {
		response.sendRedirect("login.jsp");					//重定向页面到会员登录页面
		return;//返回
	}
	 Vector fri = (Vector) session.getAttribute("fri");	//获取收藏夹对象
		if (fri == null) {									//如果收藏夹对象为空
			fri = new Vector();								//创建一个收藏夹对象
		} else {
			//判断收藏夹内是否已经存在音乐
			for (int i = 0; i < fri.size(); i++) {
				friend myfriend1 = (friend) fri.elementAt(i);//获取收藏夹内的一个音乐
				if (myfriend1.userID == myfriend.userID) {	//如果当前要添加的音乐已经在收藏夹中
					Flag = false;			//设置标记变量Flag为false，代表收藏夹中存在该音乐
				}
			}
		}
		if (Flag)		
			//如果收藏夹内不存在该音乐
			{
			
			
			fri.addElement(myfriend);//音乐保存到收藏夹中 
			
			
			
			/*更新记录到数据库*/
			ResultSet rs = conn.executeQuery("select * from tb_frilist where username='" + username + "'");
		    String frilist="";	
		    if(rs.next())
		    {
			frilist=rs.getString("fri_list");
		    }
		   String[] list1 = frilist.split("\\|");	
		   int lg= list1.length;
		   String[] list2 = new String[lg+1];
		   /* 新数据插入表头 */
		   for(int k = 0;k<lg+1;k++){
			   if(k == 0){
			   list2[k] = userID+"";		   
			   }
			   else{
			  list2[k] = list1[k-1];
			   }
			   }
		   
		   
		   String newlist= String.join("|",list2);
		   fri_list.setUsername(username);
			fri_list.setFrilist(newlist);
			
			
			int ret = 0;
			ret = ins_fri_list.update(fri_list); 
			if (ret != 0) {/* System.out.println("OK"); */}
		
		
		
	
		}
		
		
	
		
		
	session.setAttribute("fri", fri);	//将收藏夹对象添加到Session中
	
	
	conn.close();						//关闭数据库的连接
	
	
	response.sendRedirect("fri_see.jsp");//重定向页面到查看收藏夹页面
	
	
	
	
	
	%>
</body>
</html>