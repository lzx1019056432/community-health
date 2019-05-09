<%@page import="java.net.InetAddress"%>
<%@page import="com.test.entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/MyStyle.css" />
		<link rel="stylesheet" type="text/css" href="css/AQ.css" />
		<link rel="stylesheet" href="css/wechat.css" />
		<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="js/jquery-3.2.1.min.js"></script>
		<script src="js/bootstrap.min.js"></script>

		<title>在线问答</title>
		<link rel="icon" type="image/x-icon" href="img/icon.png" />
		<script>
<%
InetAddress address = InetAddress.getLocalHost();    
String ip=address .getHostAddress().toString();
%>

		var path = '<%=basePath%>';
		  
		var uid=${uid eq null?-1:uid};	  
		var name='${name}'; 
		var from=${requestScope.from eq null?uid:uid1};
		var fromName='${name}'; 
		var to=${requestScope.fromtouser eq null?0:requestScope.fromtouser};
		 
		var websocket;
		if ('WebSocket' in window) {
			websocket = new WebSocket("ws://10.2.26.68:8080/community_health_care/socketTest1.do");
		} else if ('MozWebSocket' in window) {
			websocket = new MozWebSocket("ws://" + path + "/ws"+uid);
		} else {
			websocket = new SockJS("http://" + path + "/ws/sockjs"+uid);
		}
		websocket.onopen = function(event) {
			console.log("WebSocket:已连接");
			console.log(event);
		};
		websocket.onmessage = function(event) {
			var data=JSON.parse(event.data);
			 
			console.log("WebSocket:收到一条消息",data.from);
			
			if(to==0)
				{
				to = data.from;
				
				}
			 
			 
			$("#content").append("<br><br><br><br><div style='text-align: center;'>"+new Date().Format("hh:mm:ss")+"</div><div class='sender'><div><img src='img/doctoeimg.jpg' class='img-circle'></div><div><div class='left_triangle'></div><span>"+data.text+"</span></div></div>");
			scrollToBottom();
		};
		websocket.onerror = function(event) {
			console.log("WebSocket:发生错误 ");
			console.log(event);
		};
		websocket.onclose = function(event) {
			console.log("WebSocket:已关闭");
			console.log(event);
		}
		
			function sendMsg(){
				var v=$('#msg').val();
				if(v==""){
					return;
				}else{
					var data={};
					data["from"]=from;
					data["fromName"]=fromName;
					data["to"]=to;
					data["text"]=v;
					websocket.send(JSON.stringify(data));
					$("#content").append("<br><br><br><br><div style='text-align: center;'>"+new Date().Format("hh:mm:ss")+"</div><div class='receiver'><div><img src='img/IMG_1774.JPG' class='img-circle'></div><div><div class='right_triangle'></div><span>"+data.text+"</span></div></div>");					scrollToBottom();
					clearAll();
				}
			}
			
			function scrollToBottom(){
				var div = document.getElementById('content');
				div.scrollTop = div.scrollHeight;
			}
			
			Date.prototype.Format = function (fmt) { //author: meizz 
			    var o = {
			        /* "M+": this.getMonth() + 1, //月份 
			        "d+": this.getDate(), //日  */
			        "h+": this.getHours(), //小时 
			        "m+": this.getMinutes(), //分 
			        "s+": this.getSeconds(), //秒 
			       /*  "q+": Math.floor((this.getMonth() + 3) / 3), //季度  */
			        "S": this.getMilliseconds() //毫秒 
			    };
			    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
			    for (var k in o)
			    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
			    return fmt;
			}
			
			function send(event){
				var code;
				 if(window.event){
					 code = window.event.keyCode; // IE
				 }else{
					 code = e.which; // Firefox
				 }
				if(code==13){ 
					sendMsg();            
				}
			}
			
			function clearAll(){
				 
				$('#msg').val('');
			}
			/* function closecon(){
				$("#content").append("<div style='text-align: center;' id='send_data'><span style='background-color: #f1f1f1;'>对方已结束通话</span></div>");					 

			} */
	$(document).ready(function(){
		 
  $("#subbtn").click(function(){
  	 var a = $("input[name='optionsRadiosinline']:checked").val();
  	 var to = $("#docid").val();
  	 
    $.post("doctoreva.do",
    {
      i:a,
      uid:to
    },
    function(data,status){
      
    });
    $('#myModal').modal('hide');
    alert("已提交");
    window.location.href = "details.do?id="+to;
  });
});
	</script>
	</head>

	<body>
 
<%
User user = (User)request.getSession().getAttribute("user");
%>
		<nav class="navbar navbar-default" role="navigation" id="navbar">
			<div class="container-fluid">

				<div>
					<ul style="margin-left: 300px; font-size: 17px;" class="nav navbar-nav">
						<li class="navbar-li">
							<a href="searchall.do"  style="color: white;">首页</a>
						</li>
						<li class="navbar-li">
							<a href="BrowseDoc.do" style="color: white;">健康问答</a>
						</li>
						<li class="navbar-li">
							<a href="knowledge.jsp" style="color: white;">疾病知识</a>
						</li>
						<li class="navbar-li">
							<a href="Myqa.do" style="color: white;">我的问答</a>
							<!--后台判断是患者或是医师进行页面跳转到ask-doc/ask-pat-->
						</li>
						<c:if test="${user.user_groupid eq 1}">
						<li class="navbar-li">
							<a href="talk2.do" style="color: #9BFFBD; background-color: #09AD41; ">我的聊天室</a>
							<!--后台判断是患者或是医师进行页面跳转到ask-doc/ask-pat-->
						</li>
						</c:if>
						
					</ul>
				</div>
				
					<ul class="nav navbar-nav navbar-right">

					<c:if test="${user eq null}">
					
						<li class="navbar-li-right">
							<a href="register.jsp" style="color: white;"><span style="margin-right: 5px" class="glyphicon glyphicon-user"></span>注册</a>
						</li>
						<li class="navbar-li-right">
							<a href="login.jsp" style="color: white;"><span style="margin-right: 5px" class="glyphicon glyphicon-log-in"></span>登录</a>
						</li>
                      </c:if>
						<!--登录成功后上面的注册/登录加样式 display：none进行隐藏-->
                      <c:if test="${user ne null}">
						<li class="navbar-li-right">
							<a href="editMessage.jsp" style="color: white;"><%=user.getUser_nike() %></a>
						</li>
						<li class="navbar-li-right">
							<a href="loginout.do" style="color: white;margin-right: 5px"><span class="glyphicon glyphicon-log-out"></span> 登出</a>
						</li>
						</c:if>
					</ul>
			</div>
		</nav>


		<!--导航结束-->
		<div class="logo">
			<img style="width: 100%;" src="img/LOGO.png" />
		</div>
		<div class="container main-content">
			<div class="row">
				<div class="col-lg-12" style="margin-top: 50px;">
					<div class="aq-title">
						欢迎来到在线问答咨询医生
						<br />
						<span>
							请开始你的提问
						</span>
					</div>

					<div class="chat-output col-lg-6 col-lg-offset-3" id="content">
					 
					
					</div>
					<div class="chat-input col-lg-6 col-lg-offset-3" style="padding: 0px;">
						<textarea style="overflow-x:hidden; overflow-y: auto; resize: none; width:100%;"   rows="4" style="border-style:none;" onkeydown="send(event);" id="msg" class="msg"></textarea>
						<div>
							<button class="btn-danger btn-group-sm pull-left" style="border-radius: 5px; margin-left: 10px;" data-toggle="modal" data-target="#myModal">结束对话</button>
							<button class="btn-success btn-group-sm pull-right send" style="border-radius: 5px; margin-right: 10px;" onclick="sendMsg();">发送</button>
							<button class="btn-info btn-group-sm pull-right clear" style="border-radius: 5px; margin-right: 10px;" onclick="clearAll();">清空</button>
						</div>
						 
					</div>
				</div>
			</div>
		</div>
		<!-- 小注释 -->
		<div class="col-lg-4 col-lg-offset-4" style="color: #8e8e8e;">
			*在点击结束按钮后会有评价，不要忘记给辛劳的医师们打call哦！
		</div>
<!--
        	作者：offline
        	时间：2018-03-14
        	描述：bootstrap模态框
        -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="z-index: 1050;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">请给出你的评价</h4>
            </div>
            <div class="modal-body text-center">
                <label class="radio-inline">
        <input type="radio" name="optionsRadiosinline" id="optionsRadios1" value="1" checked>很好
    </label>
    <label class="radio-inline">
        <input type="radio" name="optionsRadiosinline" id="optionsRadios2"  value="2"> 非常好
    </label>
    <label class="radio-inline">
        <input type="radio" name="optionsRadiosinline" id="optionsRadios3"  value="3"> 还可以
    </label>
        <label class="radio-inline">
        <input type="radio" name="optionsRadiosinline" id="optionsRadios4"  value="4"> 有点不好
    </label>
    <input type="hidden" value="${fromtouser }" id="docid">
            	
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="subbtn">提交更改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
        
        
        <!--
        	模态框结束
        -->
		<!--容器结束		-->
		<div id="footer" class="footer">
			<div class="ft-up">
				<table width="800px;" style="margin:5px auto;">
					<tr>
						<td>
							<a href="#">开放平台</a>
						</td>
						<td>
							<a href="#">关于好近</a>
						</td>
						<td>
							<a href="#">公司动态</a>
						</td>
						<td>
							<a href="#">加入好近</a>
						</td>
						<td>
							<a href="#">联系我们</a>
						</td>
					</tr>
				</table>
			</div>
			<div class="ft-down">
				<p>京ICP证000001号 京ICP备000001号 京卫网申2018第0001号</p>
				<img src="img/icon-police.png"/>京公网备1111111号
			</div>
		</div>
	</body>

</html>