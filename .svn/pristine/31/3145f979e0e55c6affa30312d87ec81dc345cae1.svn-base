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

		<title>注册</title>
		<link rel="icon" type="image/x-icon" href="img/icon.png" />
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
							<a href="loginout.do" style="color: white;"><span  style="margin-right: 5px" class="glyphicon glyphicon-log-out"></span> 登出</a>
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
						<h1>用户注册</h1>
						<hr />
						<div class="col-lg-8 col-lg-offset-2 all-content">
							<form action="Register.do" method="post" id="register">

								<div id="user">
									△ 昵&nbsp; &nbsp;称：
									<input style="margin-left: 18px;" type="text" name="user_nike" id=""  />
								</div>
								<br />
								<div id="user">
									△ 用户名：
									<input style="margin-left: 16px;" type="text" name="user_name" id="" />
								</div>
								<br />
								<div id="psw">
									△ 密&nbsp; &nbsp;码：
									<input style="margin-left: 18px;" type="password" name="user_password" id="" />
								</div>
								<h6 style="color: #ADADAD;margin-left: 130px;">长度在3-10位以内。</h6>
								<div id="Firmpsw">
									△ 确认密码：
									<input type="password" name="password" id=""  />
								</div>
								<div style="margin-top: 40px;margin-left: 126px;">
									<a href="#" class="button button-action button-pill" onclick="document:register.submit();">注册</a>
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