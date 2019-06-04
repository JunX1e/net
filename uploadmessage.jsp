<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>

<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<html>
<head>

<link rel="stylesheet" href="css/mr-01.css"       type="text/css">
<jsp:useBean id="info1" scope="page" class="com.model.newmusic" />
<%@ page import="com.model.newmusic"%>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="index-loginCon.jsp" />
	<!-- 网站头部 -->
<%@ include file="common-header.jsp"%>
	<!-- //网站头部 -->
<%-- 上传地址：
<h2>${message}</h2>
上传信息： --%>
<% 

String address= (String)session.getAttribute("address"); 
newmusic nmusic1= new newmusic();
String add= (String)session.getAttribute("newmusicname");
String username= (String)session.getAttribute("username");
/* address= "C:\\Users\\25806\\Desktop\\2.mp3" ;  */
nmusic1 = info1.getSongInfo(address);

String name1=nmusic1.getSongName();
String singer1=nmusic1.getSingerName();   
%>


	<div id="mr-mainbody" class="container mr-mainbody">
		<div class="row">
			<!-- MAIN CONTENT -->
			<div id="mr-content" class="mr-content col-xs-12">
				<div id="system-message-container" style="display: none;"></div>

				<div class="registration col-sm-6 col-sm-offset-3">

						<!-- 会员注册表单 -->
					<form id="music-upload" action="musicupload_deal.jsp"
						onsubmit="return regis();" method="post"
						class="form-horizontal">

							<fieldset>
								<legend style="color: #929292; font-size: 26px">音乐信息确认</legend>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="musicname-lbl" for="musicname" class="required">
											歌名：</label>
									</div>
									<div class="col-sm-8">
										<!-- gemin文本框 -->
										<input type="text" name="musicname" id="musicname"
									value="<%=name1 %>  " class="required" size="38"
									aria-required="true"><span class="star">&nbsp;*</span>
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											歌手 ：</label>
									</div>
									<div class="col-sm-8">
										<!-- geshou文本框 -->
										<input type="text" name="singer" id="singer" value="<%=singer1 %>"  class="validate-password required" size="38"
									maxlength="99" required="required" aria-required="true"><span class="star">&nbsp;*</span>
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="ind-lbl" for="ind" class="required">
											介绍：</label>
									</div>
									<div class="col-sm-8" style="clear: none;">
										<!-- 输入的文本框 -->
										<input type="text" name="introduce" class="validate-ind " id="ind"
									value="" size="38" autocomplete="ind" aria-required="true">
									</div>
								</div>
								<div class="form-group">
								<div class="col-sm-4 control-label">
										<label id="pic-lbl" for="picture" class="required">
											图片：</label>
									</div>
									<div class="col-sm-4 control-label">
										<input type="text" name="picture"
									value="musicpicbox/123.png" >
									<br><div style="font-size:10px">请输入图片的url或者将使用默认的封面图片</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<input type="hidden" name="address"
									value="<%=add%>" >
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<input type="hidden" name="uper"
									value="<%=username%>" >
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="type-lbl" for="type" class="required">
											类型1：</label>
									</div>
									<div class="col-sm-8" style="clear: none;">
										<!-- xuanz的文本框 -->
									<select  name="typeID1" >
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
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="type-lbl" for="type" class="required">
											类型2：</label>
									</div>
									<div class="col-sm-8" style="clear: none;">
										<!-- xuanz的文本框 -->
									<select  name="typeID2" >
									<%
									ResultSet rs_type2 = conn.executeQuery("select * "
										+ "  from tb_type ");
									String type2="";
									int typeid2=-1;
									while(rs_type2.next()){
									type2=rs_type2.getString("typename");
									typeid2=rs_type2.getInt("id");
									%>                    
									<option value="<%=typeid2%>"><%=type2 %></option> 
									<%
									}
									%>
									</select>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="type-lbl" for="type" class="required">
											语种：</label>
									</div>
									<div class="col-sm-8" style="clear: none;">
										<!-- xuanz的文本框 -->
									<select  name="typeID3" >
									<%
									ResultSet rs_type3 = conn.executeQuery("select * "
										+ "  from tb_lantype ");
									String type3="";
									int typeid3=-1;
									while(rs_type3.next()){
									type3=rs_type3.getString("typename2");
									typeid3=rs_type3.getInt("typeid");
									%>                    
									<option value="<%=typeid3%>"><%=type3 %></option> 
									<%
									}
									%>
									</select>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-4 col-sm-8" style="margin-left: 150px;"><input name="ID" type="hidden" value="<%-- <%=id%> --%>">
										<button type="submit" class="btn btn-primary pull-left" style="width:100px;">提交</button>
							<button type="button" onclick="javascript:history.go(-1)"
								class="btn btn-primary pull-left" style="width:100px;">取消</button>
									</div>
								</div>
							</fieldset>
						</form>
				</div>

			</div>
			<!-- //MAIN CONTENT -->

		</div>
	</div>
 

<%-- <br>
歌名：<%=name1%>
<br>
歌手：<%=singer1%> --%>
</body>
</html>