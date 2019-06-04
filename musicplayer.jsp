<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>		<%-- 导入java.sql.ResultSet类 --%>
<%-- 创建com.tools.ConnDB类的对象 --%>

<jsp:useBean id="conn1" scope="page" class="com.tools.ConnDB" />

  <%  
                    ResultSet rs_new = conn1.executeQuery(
					"select  t1.musicID,t1.musicName,t1.address  "
					+"from tb_music t1 "+"order by t1.intime "
					);		//查询最热音乐信息 
					int new_musicID1 = 0;										//ID的变量
					String new_musicname1 = "";							//名称的变量			
					String new_musicaddress1 = "";	
					/* 获取当前播放的歌曲 */
					 int playid = Integer.parseInt(request.getParameter("ID"));	//获取音乐ID 
					playid=playid-1;
					
%>
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
		  
		   
			ul li {
				list-style: none;
			}
			
			
			.hide{
			background:black;
			position:fixed;
			bottom:0;
			right:0;
			height:50px;
			width:50px;
			z-index:999;
			}
			
			.music {
			    width: 100%;
				height: 66px;
				background: black;
				opacity:0.9;
				margin: 0px ;
				line-height: 40px;			
				position:fixed;			
				bottom: 0;
				z-index:998;
				

    
			}

			
			
			.musicL {
				float:left;
				margin:10px;
			}
			
			.progress {
				float: left;
				font-size: 14px;
				width: 800px;
				height:20px;
				margin-left: 10px;
				margin-top: 3px;
				
			}
			
			.load {
				display: inline-block;
				width: 500px;
				height: 5px;
				background: #ddd;
				cursor: pointer;
				position: relative;
				top: -2px;
			}
			
			.circle {
				width: 0px;
				height: 5px;
				background: #FFFF66	;
				position: relative;
				left: 0;
				top: 0;
				
			}
			
			.round {
				position: absolute;
				width: 10px;
				height: 10px;
				border-radius: 50%;
				background: #87cefa;
				left: 0px;
				top: -3px;
				
			}
			/* 音量 */
			.vol1 {
				float: left;
				font-size: 14px;
				width: 120px;
				height: 30px;
				margin-left: 10px;
				margin-top: 3px;
			}
			
			.vol1_load {
				display: inline-block;
				width: 60px;
				height: 5px;
				background: #ddd;
				cursor: pointer;
				position: relative;
				top: -2px;
			}
			
			.vol1_circle {
				width: 60px;
				height: 5px;
				background: #FFFF66	;
				position: relative;
				left: 0;
				top: 0;
			}
			
			.vol1_round {
				position: absolute;
				width: 10px;
				height: 10px;
				border-radius: 50%;
				background: #87cefa;
				left: 50px;
				top: -3px;
				
			}
			/*111  */
			
			
			.music_list {
				width: 280px;
				background: black ;
				margin: 0 auto;
				position:fixed; 
				right:0;
				bottom:-2000px;
				opacity:0.95;
				z-index:900;
			}
			
			.music_list li {
				 line-height: 30px;
				 cursor: pointer;
				 display: block; 
				 color: #f2f2f2; 
				 text-shadow: 1px 0 0 #101011;
				 padding: 0px;
				 box-shadow: 0 1px 0 #5a5b5c inset,0 1px 0 #080808; 
				 background: linear-gradient(top,#434345,#2f3032);

			}
			
			.music_list li:hover {
				text-decoration: none; 
				box-shadow: 0 1px 0 #f9bd71 inset,0 1px 0 #0a0a0a; 
				background: linear-gradient(top,#f48b03,#c87100);
				}
				
		   .detail_show{
				height:10px;
				width:300px;
				position:relative;
				margin-top:-15px;
				
				
				}
           .operator{
                float:left;
				margin-top:3px;
				margin-left:0px;
           }
           /*ul*/
           .ul{
              overflow:auto;
              height:500px;
           
           }
           
</style>
<title>Insert title here</title>
</head>
<body>
<div class="hide" >
<span class="hide1" id="hide1">
<img src="images/yincang.png">
</span>
</div>
<div class="music" id="musicplayer">

			<div class="musicL">
				<i class="next" id="top">
				<img src="images/shangyishou.png">
				</i>
				<span class="play" id="play">
					<img src="images/bofang.png">
				</span>
				<i class="next" id="down">
				<img src="images/xiayishou.png">
				</i>
			</div>
			
			
 
			
			<div class="progress">
			 
				
				<font color="#fffdd0"><span class="start_time" id="start_time">00:00</span></font>
				<div class="load" id="load"> 
					
					<div class="circle" id="circle">
						<div class="round" id="round">
                        
						</div> 
 
					</div>
				</div>
				
				<font color="#fffdd0"><span class="total_time" id="total_time">00:00</span></font>
			 <div class="detail_show"><font color="#fffdd0">正在播放： <span class="detailnow" id="detailnow"></span></font></div>
			</div>
			
			
			<div class="vol1">
			<font color="#fffdd0">vol:</font> 
			 <div class="vol1_load" id="vol1_load">
			 <div class= "vol1_circle" id="vol1_circle">
			 <div class="vol1_round" id="vol1_round">  </div>
			 
			 </div>
			 
			 </div>
			</div>
		
		
		<div class="operator">
		<i id="download">
		<a href=""><img src="images/xiazai.png"> </a>
		</i>
		<i id="gedan">
		<img src="images/gedan.png"> 
		</i>
		<i id="loop">
        <img src="images/xunhuan.png"> 
        </i>		
		</div>
			
			
			
 
		</div>
		
		<audio id="audio" ></audio>
        
		<div class="music_list" id="music_list" >
		
		<script>
		var arr=[];
		var name=[];
		</script>
		<ul id="ul" style="overflow:auto;height:360px;">
		<% 
				
                                         while (rs_new.next()) 
                                            {						//设置一个循环
	                                           
                                        	 new_musicID1 = rs_new.getInt("musicID"); 					//获取ID
	                                         new_musicname1 = rs_new.getString("musicname"); 			//获取名称
	                                         new_musicaddress1 = rs_new.getString("address");           //播放地址
	                                                             
                                               %>
			
			
				<li><%=new_musicname1%></li>
				
				
			
			<script>
			 var music ="<%=new_musicaddress1%>" ;
			 arr.push("mp3/"+music); 
			 var musicname="<%=new_musicname1%>" ;
			 name.push(musicname);
			</script>
			
		<% } %>
		</ul>
		</div>
		
		<script>
		    var firstplayid=<%=playid%>
		    var omusicplayer = document.getElementById("musicplayer")
		    var oTotal = document.getElementsByClassName("total_time")[0]
			var oAudio = document.getElementById("audio")
			var oPlay = document.getElementById("play")
			var oCircle = document.getElementById("circle")
			var oStart = document.getElementById("start_time")
			var oRound = document.getElementById("round")
			var oLoad = document.getElementById("load")
			var oUl = document.getElementById("ul")
			var oLi = oUl.getElementsByTagName("li")
			var oTop = document.getElementById("top")
			var oDown = document.getElementById("down")
			var ovol_Circle = document.getElementById("vol1_circle")
			var ovol_Round = document.getElementById("vol1_round")
			var ovol_Load = document.getElementById("vol1_load")
			var odetail = document.getElementById("detailnow")
			var odownload = document.getElementById("download")
			var ogedan = document.getElementById("gedan")
			var omusic_list = document.getElementById("music_list")
			var oloop = document.getElementById("loop")
			var ohide1 = document.getElementById("hide1")
			var num = firstplayid
		    var flag = 0 
		    var showflag = 0
			oAudio.src = arr[num]
		    oAudio.name = name[num]
		    
		  

		  //点击切换歌曲
		   
		  			for(var i = 0; i < oLi.length; i++) {
		  				oLi[i].index = i
		  				oLi[i].onclick = function() 
		  				{   
		  					num = this.index
		  					oAudio.src = arr[this.index]
		  					oAudio.name = name[this.index]
		  					oAudio.play()	   
		  					oPlay.innerHTML = '<img src="images/zanting.png">'
		  				}
		  			}
		  

		  //转换总时长
		  			oAudio.addEventListener("canplay", function() {
		  				oTotal.innerHTML = getMin(this.duration)
		  			})
		  			//显示播放信息
		  			oAudio.addEventListener("canplay", function() {
		  				odetail.innerHTML = oAudio.name;
		  			})
	                //改变下载文件
		  			oAudio.addEventListener("canplay", function() {
		  				
		  			odownload.innerHTML = '<a href="'+oAudio.src+'"><img src="images/xiazai.png"></a>'
		  			})	   
		  			//点击开始播放
		  			oPlay.onclick = function() {
		  				if(oAudio.paused) {
		  					oAudio.play()
		  					oPlay.innerHTML = '<img src="images/zanting.png">'
		   
		  				} else {
		  					oAudio.pause()
		  					oPlay.innerHTML = '<img src="images/bofang.png">'
		  				}
		  			}
		 

		  //监听进度变化
		  			oAudio.ontimeupdate = function() {
		  				var pre = Math.floor(oAudio.currentTime / oAudio.duration * 500-8)
		  				oCircle.style.width = pre + "px"
		  				oStart.innerHTML = getMin(oAudio.currentTime)
		  				oRound.style.left = oCircle.style.width
		  				if(oAudio.currentTime==oAudio.duration)
		  					{
		  					num++
			  				if(num > arr.length - 1) {
			  					num = 0
			  				}
			  				oAudio.src = arr[num]
			  				oAudio.name = name[num]
			  				oAudio.play()
		  					}
		  			}
		

		  //点击进度变化
		  			oLoad.onclick = function(e) {
		  				var l = e.clientX - oLoad.offsetLeft
		  				oAudio.currentTime = (l / 500) * oAudio.duration
		  			}
		

		  //拖拽原点
		  			oRound.onmousedown = function(e) {
		  				document.onmousemove = function(e) {
		  					var l = e.clientX - oLoad.offsetLeft
		  					oAudio.currentTime = (l / 500) * oAudio.duration
		   
		  				}
		  				document.onmouseup = function() {
		  					document.onmousedown = null
		  					document.onmousemove = null
		  					//					console.log("up")
		  				}
		  				return false;
		   
		  			}
		  /*音量  */
		  //设置初值 自动volwei1bushizhi
		  			
		

		  //点击变化zhuyibianhua
		  			ovol_Load.onclick = function(e) {
		  				var l = e.clientX - ovol_Load.offsetLeft
		  				oAudio.volume = (l / 60) 
		  			}
		

		  //拖拽原点xieru
		  			ovol_Round.onmousedown = function(x) {
		  				document.onmousemove = function(x) {
		  					var l = x.clientX - ovol_Load.offsetLeft
		  					oAudio.volume = (l / 60) 
		  					var pre = Math.floor(oAudio.volume*60-3)
			  				ovol_Circle.style.width = pre + "px"			  				
			  				ovol_Round.style.left = ovol_Circle.style.width
		   
		  				}
		  				document.onmouseup = function() {
		  					document.onmousedown = null
		  					document.onmousemove = null
		  					//					console.log("up")
		  				}
		  				return false
		   
		  			}
		  /*  */
		

		  //获取分钟的函数
		  			function getMin(time) {
		  				var m = Math.floor(time / 60)
		  				var s = Math.floor(time % 60)
		  				if(m <= 9) {
		  					m = "0" + m
		  				}
		  				if(s <= 9) {
		  					s = "0" + s
		  				}
		  				return m + ":" + s
		  			}
		

		  //上一首
		  			oTop.onclick = function() {
		  				num--
		  				if(num < 0) {
		  					num = arr.length - 1
		  				}
		  				oAudio.src = arr[num]
		  				oAudio.name = name[num]
		  				oAudio.play()
		  			}
		

		  //下一首
		  			oDown.onclick = function() {
		  				num++
		  				if(num > arr.length - 1) {
		  					num = 0
		  				}
		  				oAudio.src = arr[num]
		  				oAudio.name = name[num]
		  				oAudio.play()
		  			}
		  //gedna
		  			ogedan.onclick = function(){
		  				if(flag == 0){
		  					ogedan.innerHTML = '<img src="images/gedan_a.png">'
		  				    omusic_list.style.bottom="66px"
		  					flag=1
		  				}
		  				else{
		  				    ogedan.innerHTML = '<img src="images/gedan.png">'
		  				    omusic_list.style.bottom="-2000px"
		  				    flag=0
		  				}
		  			}
		  //loop
		            oloop.onclick = function(){
			             if(oAudio.loop == false)
			            	 {
			            	 oAudio.loop =true
			            	 oloop.innerHTML = '<img src="images/danquxunhuan.png">'
			            	 }
			             else
			            	 {
			            	 oloop.innerHTML = '<img src="images/xunhuan.png">'
			            	 oAudio.loop =false
			            	 }
			  
			  
		             }
		  //hide
		   ohide1.onclick = function(){
			             if(showflag == 0)
			            	 {
			            	 
			            	 ohide1.innerHTML = '<img src="images/xianshi.png">'
			            		 omusicplayer.style.bottom="-70px"
			            		 showflag = 1
			            		 ogedan.innerHTML = '<img src="images/gedan.png">'
			            		 omusic_list.style.bottom="-2000px"
					  		     flag=0
			            	 }
			             else
			            	 {
			            	 ohide1.innerHTML = '<img src="images/yincang.png">'
			                 omusicplayer.style.bottom="0px"
			                 showflag = 0;
			            	 }
			  
			  
		             }
		
			


		</script>
</body>
</html>