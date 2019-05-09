<%@page import="com.test.entity.User"%>
<%@page import="com.test.entity.Pagedata"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/MyStyle.css" />
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<title>好近医院</title>
<link rel="icon" type="image/x-icon" href="img/icon.png" />
</head>

<body>

	<%
		User user = (User) request.getSession().getAttribute("user");
	%>
	<nav class="navbar navbar-default" role="navigation" id="navbar">
		<div class="container-fluid">

			<div>
				<ul style="margin-left: 300px; font-size: 17px;"
					class="nav navbar-nav">
					<li class="navbar-li"><a href="searchall.do"
						style="color: #9BFFBD; background-color: #09AD41;">首页</a></li>
					<li class="navbar-li"><a href="BrowseDoc.do"
						style="color: white;">健康问答</a></li>
					<li class="navbar-li"><a href="knowledge.jsp"
						style="color: white;">疾病知识</a></li>
					<li class="navbar-li"><a href="Myqa.do" style="color: white;">我的问答</a>
						<!--后台判断是患者或是医师进行页面跳转到ask-doc/ask-pat--></li>
					<c:if test="${user.user_groupid eq 1}">
						<li class="navbar-li"><a href="talk2.do"
							style="color: white;">我的聊天室</a> <!--后台判断是患者或是医师进行页面跳转到ask-doc/ask-pat-->
						</li>
					</c:if>

				</ul>
			</div>

			<ul class="nav navbar-nav navbar-right">

				<c:if test="${user eq null}">

					<li class="navbar-li-right"><a href="register.jsp"
						style="color: white;"><span style="margin-right: 5px" class="glyphicon glyphicon-user"></span>注册</a>
					</li>
					<li class="navbar-li-right"><a href="login.jsp"
						style="color: white;"><span style="margin-right: 5px" class="glyphicon glyphicon-log-in"></span>登录</a>
					</li>
				</c:if>
				<!--登录成功后上面的注册/登录加样式 display：none进行隐藏-->
				<c:if test="${user ne null}">
					<li class="navbar-li-right"><a href="editMessage.jsp"
						style="color: white;margin-right: 5px"><%=user.getUser_nike()%></a></li>
					<li class="navbar-li-right"><a href="loginout.do"
						style="color: white;"><span
							class="glyphicon glyphicon-log-out"></span> 登出</a></li>
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
				<div style="text-align: right; margin-top: 10px;">
					<div class="btn-group btn-group-lg">
						<a href="searchall.do"><button type="button"
								class="btn btn-default" id="btn-choose">按距离排行</button></a> <a
							href="searchbyeva.do"><button type="button"
								class="btn btn-default" id="btn-choose"
								style="background-color: #34ce6c; color: #ffffff;">按好评度排行</button></a>
					</div>
				</div>
				<!--数据库检索循环罗列出信息排行-->
				<div style="margin: auto 0px;">
					<c:forEach items="${listall}" var="lit">
						<div class="col-lg-12 card">
							<div class="col-lg-6" style="margin-left: -10px;">
								<img src="img/${lit.hos_img1 }" width="500px" />
							</div>
							<div class="col-lg-6">
								<div class="card-title">
									<a href="searchoneof.do?id=${lit.hos_id}">${lit.hos_name}</a>
								</div>
								<div class="card-message">
									<div class="c-m-list">
										<div class="c-m-font">
											<i class="fa fa-id-card" aria-hidden="true"></i>
											${lit.hos_description}
										</div>
									</div>
									<div class="c-m-list">
										<div class="c-m-font">
											<i class="fa fa-map-marker" aria-hidden="true"></i>
											${lit.hos_location}
										</div>
									</div>
									<div class="c-m-list">
										<div class="c-m-font">
											<i class="fa fa-clock-o" aria-hidden="true"></i> 问诊时间： <br />
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;周一至周日 上午8:00 - 下午18:00
										</div>
									</div>
								</div>
								<div class="card-rank">综合评分：${lit.eva}</div>
							</div>
						</div>
					</c:forEach>

				</div>

			</div>
			<%
				Pagedata pd = (Pagedata) request.getAttribute("pagedata");
			%>
			<div class="col-lg-12 hm-page">

				<c:choose>
					<c:when
						test="${pagedata.getPageindex()==1&&pagedata.getPageCount()==1}">

						<button type="button" class="btn btn-default " disabled="disabled">上一页</button> &nbsp;&nbsp;|<%=pd.getPageindex()%>|&nbsp;&nbsp; 下一页

  </c:when>
					<c:when test="${pagedata.getPageindex()==1 }">

						<button type="button" class="btn btn-default" disabled="disabled">上一页</button>&nbsp;&nbsp;|<%=pd.getPageindex()%>|&nbsp;&nbsp;<a
							href="searchbyeva.do?currentpage=<%=pd.getPageindex() + 1%>" style="text-decoration:none">
							<button type="button" class="btn btn-default">下一页</button>
						</a>

					</c:when>

					<c:when test="${pagedata.getPageindex()==pagedata.getPageCount()}">

						<a href="searchbyeva.do?currentpage=<%=pd.getPageindex() - 1%>"><button
								type="button" class="btn btn-default">上一页</button></a>&nbsp;|&nbsp;<%=pd.getPageindex()%>&nbsp;&nbsp;|&nbsp;&nbsp;<button
							type="button" class="btn btn-default" disabled="disabled">下一页</button>

					</c:when>
				</c:choose>

			</div>
		</div>
	</div>
	</div>

	<!--容器结束		-->
	<div id="footer" class="footer" style="margin-top:100px;">
		<div class="ft-up">
			<table width="800px;" style="margin: 5px auto;">
				<tr>
					<td><a href="#">开放平台</a></td>
					<td><a href="#">关于好近</a></td>
					<td><a href="#">公司动态</a></td>
					<td><a href="#">加入好近</a></td>
					<td><a href="#">联系我们</a></td>
				</tr>
			</table>
		</div>
		<div class="ft-down">
			<p>京ICP证000001号 京ICP备000001号 京卫网申2018第0001号</p>
			<img src="img/icon-police.png" />京公网备1111111号
		</div>
	</div>
</body>

</html>