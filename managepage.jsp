<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">


.left {
	background: #313541;
	width: 20%;
	float: left;
	position: absolute;
	top: 0px;
	bottom: 0px;
}

.top {
	width: 80%;
	float: right;
	height: 100px;
	line-height: 100px;
	border-bottom: 1px solid #b0cdff;
}

.content {
	float: right;
	width: 80%;
	text-align: center;
	font-size: 40px;
	margin-top: 200px;
}

.leftTiyle {
	font-size: 25px;
	padding-left: 30px;
	font-weight: 600;
	color: #545454;
	float: left;
}

.thisUser {
	float: right;
	margin-right: 30px;
}

.bigTitle {
	background: #3d598a;
	color: #fff;
	height: 100px;
	line-height: 100px;
	text-align: center;
	font-size: 24px;
	font-family: -webkit-body;
}

.lines .active {
	background: #272a34;
	color: #fff;
}
.lines img{
    width: 23px;
    vertical-align: middle;
    margin-bottom: 4px;
    margin-right: 9px;
}
.lines div {
	height: 70px;
	line-height: 70px;
	padding-left: 50px;
	color: #707783;
}

.lines div:hover {
	cursor: pointer;
	color: #FFFFFF;
}

</style>
<script type="text/javascript" src="js/jquery.min.js" ></script>
	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	


		<div class="left">
			<div class="bigTitle">音乐分享网站后台管理系统</div>
			<div class="lines">
				<div  ><a style="color:white;" itemprop="url" class="" href="managedetail.jsp"
			data-target="#">网站信息</a></div>
				<div ><a style="color:white;" itemprop="url" class="" href="manageuser.jsp"
			data-target="#">用户管理</a></div>
				<div ><a style="color:white;" itemprop="url" class="" href="managemusic.jsp"
			data-target="#">音乐管理</a></div>
                  <div ><a style="color:white;" itemprop="url" class="" href="managecomment.jsp"
			data-target="#">评论管理</a></div>
			     
			<br>
			    <div > <a style="color:white;" itemprop="url" class="" href="index.jsp"
			data-target="#">返回首页</a></div>
			</div>
		</div>
		


	
		
	


</body>
</html>
