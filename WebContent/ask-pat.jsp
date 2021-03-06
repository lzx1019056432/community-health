<%@page import="com.test.entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/MyStyle.css" />
		<link rel="stylesheet" type="text/css" href="css/AQ.css" />
		<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="js/jquery-3.2.1.min.js"></script>
		<script src="js/bootstrap.min.js"></script>

		<title>在线提问</title>
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
							<a href="searchall.do"style="color: white;">首页</a>
						</li>
						<li class="navbar-li">
							<a href="BrowseDoc.do" style="color: white;">健康问答</a>
						</li>
						<li class="navbar-li">
							<a href="knowledge.jsp" style="color: white;">疾病知识</a>
						</li>
						<li class="navbar-li">
							<a href="Myqa.do" style="color: #9BFFBD; background-color: #09AD41; ">我的问答</a>
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
		<div class="container main-content">
			<div class="row">
				<div class="col-lg-12" style="margin-top: 50px;">
					<div class="">
						<ul id="myTab" class="nav nav-tabs">
							<li class="active">
								<a href="#home" data-toggle="tab">
									我的提问-已解答
								</a>
							</li>
							<li>
								<a href="#ios" data-toggle="tab">尚未解答</a>
							</li>
						</ul>
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane fade in active" id="home">
				<c:forEach items="${answer }" var="ar">
								<div class="AQcontent-left-message">
									<div class="pull-right" style="font-size: 15px;color: #8C8C8C;">
										${ar.ans_time}
									</div>
									<div>
										<span class="message-ask">
									问
								</span>
										<span class="message-fir">
									${ar.ques_tittle}
								</span>
									</div>
									<div>
										<span class="message-ans">
									答
								</span>
										<span class="message-sec">
									${ar.ques_answer}
								</span>
									</div>
								</div>
				</c:forEach>
								
								
							</div>
							<div class="tab-pane fade" id="ios">
					<c:forEach items="${unanswer }" var="unar">
								<div class="AQcontent-left-message">
									<div class="pull-right" style="font-size: 15px;color: #8C8C8C;">
										${unar.que_time}
									</div>
									<div>
										<span class="message-ask">
									问
								</span>
										<span class="message-fir">
									${unar.ques_tittle}
								</span>
									</div>

								</div>
					</c:forEach>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

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