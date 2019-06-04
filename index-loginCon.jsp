<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="chStr" scope="page" class="com.tools.Chstr" />
<%
	String username = (String) session.getAttribute("username");

	if (username == null || username == "") {
%>
<div id="toolbar" style="background-color: #F0F0F0; width: 100%;">
	<div class="container">
		<div class="row">
			<div class="toolbar-ct-1">
				<p>
					<i class="fa fa-phone"></i> <span style="margin-right: 15px;">联系邮箱：2580695477@qq.com </span><a
						href="login.jsp">登录</a>&nbsp; ｜ &nbsp;<a href="register.jsp">注册</a>
				</p>
			</div>
			<!-- <div class="toolbar-ct-2">
				<a href="orderList.jsp">我的音乐</a>&nbsp;&nbsp; | &nbsp;&nbsp; 我的收藏
			</div> -->
		</div>
	</div>
	<div style="background:url(images/background.png);  background-size:100%; width: 100%">
		<div class="container">
			<div class="row">
				<div class="toolbar-ct col-xs-12 col-md-6  hidden-sm hidden-xs">
					<div class="toolbar-ct-1">
						<img style="width:300px; height:100px;" src="images/musiclogo.png">
					</div>
					<div>
						<!-- 搜索条 -->
						<div class="search_box" style="background-color:white; ">
							<div class="top-nav-search">
								<form method="post" action="search_result.jsp">
									<input type="text" name="searchword" size="38"
										style="border: 0px;" class="top-nav-search-input"
										placeholder="请输入要查询的歌曲" /> <input type="image"
										src="images/search_a.png" class="search_box_img"
										onFocus="this.blur()" />
								</form>
							</div>
						</div>
						<!-- //搜索条 -->



					</div>
				</div>

				<div class="toolbar-ct toolbar-ct-right col-xs-12 col-md-3">


					<div class="toolbar-ct-2 "
						style="margin-top: 35px; border: 1px solid #EAEAEA; padding: 5px;background-color: white;"
						>
						<a href="fav_see.jsp" style="color: #0000ff; font-size: 20px;"> <i
							class="fa fa-cart1"></i>  我的收藏夹</a>


					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%
	} else {
%>
<div id="toolbar" style="background-color: #F0F0F0; width: 100%;">
	<div class="container">
		<div class="row">
			<div class="toolbar-ct-1">
				<p>
					<i class="fa fa-phone"></i> <span style="margin-right: 15px;">联系邮箱：2580695477@qq.com</span>您好，<%=username%>
					&nbsp; &nbsp;<a href="modifyMember.jsp">修改</a>&nbsp;&nbsp;
					|&nbsp;&nbsp;<a href="logout.jsp">退出</a>
				</p>
			</div>
			<div class="toolbar-ct-2">
				 <a
					href="fri_see.jsp">我的好友</a>
			</div>
		</div>
	</div>
	<div style="background:url(images/background.png);background-size:100%; width: 100%">
		<div class="container">
			<div class="row">
				<div class="toolbar-ct col-xs-12 col-md-6  hidden-sm hidden-xs">
					<div class="toolbar-ct-1">
						<img  style="width:300px; height:88px;" src="images/musiclogo.png">
					</div>
					<div>
						<!-- 搜索条 -->
						<div class="search_box" style="background-color: white;">
							<div class="top-nav-search">
								<form method="post" action="search_result.jsp">
									<input type="text" name="searchword" size="38"
										style="border: 0px;" class="top-nav-search-input"
										placeholder="请输入要查询的歌曲" /> <input type="image"
										src="images/search.png" class="search_box_img"
										onFocus="this.blur()" />
								</form>
							</div>
						</div>
						<!-- //搜索条 -->



					</div>
				</div>

				 <div class="toolbar-ct toolbar-ct-right col-xs-12 col-md-3" >


					<div class="toolbar-ct-2 "
						style="margin-top: 35px; border: 1px solid #EAEAEA; padding: 5px;background-color: white;">
						<a href="fav_see.jsp" style="color: #0000ff; font-size: 20px;"> <i
							class="fa fa-cart1"></i> 我的收藏夹</a>


					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%
	}
%>