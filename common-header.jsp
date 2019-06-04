<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header id="mr-header" class="wrap mr-header">
	<div class="container">
		<div class="row">
			<!-- //网站Logo -->
			<!-- 主导航条 -->
			<nav id="mr-mainnav"
				class="col-xs-12 col-md-6 mr-mainnav navbar navbar-default">
				<div class="mr-navbar navbar-collapse collapse">
					<div class="mr-megamenu animate slide" data-duration="400"
						data-responsive="true">
						<ul class="nav navbar-nav level0">
							<li itemprop="name" data-id="435" data-level="1"><a
								id="index" itemprop="url" class="" href="index.jsp"
								data-target="#">发现音乐 </a></li>
							<li itemprop="name" data-id="510" data-level="1"><a
								id="page2" itemprop="url" class=""
								href="mymusic.jsp" data-target="#">我的音乐</a></li>

							<li itemprop="name" data-id="510" data-level="1"><a
								id="page3" itemprop="url" class="" href="dongtai.jsp"
								data-target="#">音乐推荐</a></li>

							 <li itemprop="name" data-id="510" data-level="1"><a
								id="page4" itemprop="url" class="" href="musicupload.jsp"
								data-target="#">音乐上传</a></li>
							
						</ul>
					</div>

				</div>
			</nav>
			<!-- //主导航条 -->
		</div>
	</div>
</header>
<script>
	// 获取页面参数
	function GetString(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");//正则表达式
		var r = window.location.search.substr(1).match(reg);//获取鼠标点击区域
		if (r != null)
			return unescape(r[2]);//返回区域编号
		return null;
	}
	var type = GetString('type');
	if (type === '14') {
		var jingying = document.getElementById('page2');
		jingying.style.backgroundColor = "#b728d0";

	}
	if (type === '15') {
		var wenyi = document.getElementById('page3');
		wenyi.style.backgroundColor = "#b728d0";

	}
	if (type === '16') {
		var jiaoyu = document.getElementById('page4');
		jiaoyu.style.backgroundColor = "#b728d0";

	}
	
	if (type == null) {//默认登录无点击
		var index = document.getElementById('index');
		index.style.backgroundColor = "#b728d0";

	}
</script>