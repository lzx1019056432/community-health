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
		<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/botton.css" />
		<script src="js/jquery-3.2.1.min.js"></script>
		<script src="js/bootstrap.min.js"></script>

		<title>登录</title>
		<link rel="icon" type="image/x-icon" href="img/icon.png" />
	</head>
<script language="javascript" type="text/javascript">
		var code;

		function createCode() {
			code = "";
			var codeLength = 4; //验证码的长度
			var checkCode = document.getElementById("checkCode");
			var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
			for(var i = 0; i < codeLength; i++) {
				var charNum = Math.floor(Math.random() * 52);
				code += codeChars[charNum];
			}
				 
			if(checkCode) {
				checkCode.className = "code";
				checkCode.innerHTML = code;
			}
		}

		function validateCode() {
			var inputCode = document.getElementById("inputCode").value;
			var name =document.getElementById("user_name").value;
			var pass =document.getElementById("user_password").value;
			var form =document.getElementById("login");
			if(name.length <= 0){
				alert("请输入用户名！");
			}else if(pass.length <= 0) {
				alert("请输入密码");
			}
			else if(inputCode.length <= 0) {
				alert("请输入验证码");
			} else if(inputCode.toUpperCase().toLowerCase() != code.toUpperCase().toLowerCase()) {
				alert("验证码输入有误！");

			} else {
				form.submit();
			}
		}
	</script>
<!-- 	<script>
	$(document).ready(function(){
		  $("#subbtn").click(function(){
			  
			  validateCode();
		    $.post("askquestion.do",
		    {
		      data:$('#yourformid').serialize()
		    },
		    function(data,status){
		      alert(data);
		    });

		  });
		});
	
	</script> -->
	<body onload="createCode()">
<%
User user = (User)request.getSession().getAttribute("user");
%>
		<nav class="navbar navbar-default" role="navigation" id="navbar">
			<div class="container-fluid">

				<div>
					<ul style="margin-left: 300px; font-size: 17px;" class="nav navbar-nav">
						<li class="navbar-li">
							<a href="searchall.do" style="color: white;">首页</a>
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
							<a href="talk2.do" style="color: white;">我的聊天室</a>
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
							<a href="loginout.do" style="color: white;"><span style="margin-right: 5px" class="glyphicon glyphicon-log-out"></span> 登出</a>
						</li>
						</c:if>
					</ul>
			</div>
		</nav>

		<!--导航结束-->
		<div class="logo">
			<img style="width: 100%;" src="img/LOGO.png" />
		</div>
		<div class="container" style="height: 618px;">
			<div class="row">
				<div class="col-lg-12" style="border: 1px solid #888888; margin-top: 130px; margin-bottom: -80px;">
					<div class="col-lg-8">
						<h1>用户登录</h1>
						<hr />
						<div class="col-lg-8 col-lg-offset-2 all-content">

							<form action="Login.do" method="post" id="login">

								<div id="user">
									△ 用户名：
									<input style="margin-left: 16px;" type="text" name="user_name" id="user_name" value="" />
								</div>
								<br />
								<div id="psw">
									△ 密&nbsp; &nbsp;码：
									<input style="margin-left: 18px;" type="password" name="user_password" id="user_password" value="" />
								</div>
								<h6 style="color: #ADADAD;margin-left: 130px;">长度在3-10位以内。</h6>
								<div id="Firmpsw">
									△ 验证码：
									<input style="margin-left: 15px;" type="text" id="inputCode" />								
								</div>
								<div class="yzm">
									<div class="code" id="checkCode" onclick="createCode()"></div>
									 
								</div>
								
								<div style="margin-top: 40px;margin-left: 75px;">
									<a  class="button button-action button-pill" onclick="validateCode();">登录</a>
									<a href="#" class="button button-action button-pill" onclick="document:表单ID名.submit();">注册</a>
								</div>
							</form>
							
						</div>
					</div>
					<div class="col-lg-4">
						<dl class="side-intro">
							<dt style="font-family: '微软雅黑';font-weight: 100;font-size: 20px;">我们提供的在线健康咨询服务</dt>
							<br />
							<dd>99%用户表示满意</dd>
							<br />
							<dd>3分钟内首次回复</dd>
							<br />
							<dd>50万名认证二甲以上公立医院医生</dd>
						</dl>
					</div>
				</div>
			</div>
		</div>

		<!--容器结束-->
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