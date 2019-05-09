<%@page import="com.test.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/MyStyle.css" />
		<link rel="stylesheet" type="text/css" href="css/AQ.css" />
		<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="js/jquery-3.2.1.min.js"></script>
		<script src="js/bootstrap.min.js"></script>

		<title>健康咨询</title>
		<link rel="icon" type="image/x-icon" href="img/icon.png" />
	</head>
<script>
		$(document).ready(function() {

			$(".message-fir").click(function() {
				 
				$('#heal_tittle').text($(this).prev().val());
				$('#heal_answer').text($(this).next().val());
			});
		});
		
		
	</script>
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
							<a href="BrowseDoc.do" style="color: #9BFFBD; background-color: #09AD41; ">健康问答</a>
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
							<a href="loginout.do" style="color: white; margin-right: 5px"><span class="glyphicon glyphicon-log-out"></span> 登出</a>
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
					<!--最顶层目录-->
					<div class="col-lg-12 AQmenu">
						<table>
							<tr>
								<td>
									<a href="BrowseProject.do?ques_depart=皮肤科  " class="ques_depart" value="皮肤科">皮肤科</a>
								</td>
								<td>
									<a href="BrowseProject.do?ques_depart=妇科 " class="ques_depart" value="妇科">妇科</a>
								</td>
								<td>
									<a href="BrowseProject.do?ques_depart=儿科 " class="ques_depart">儿科</a>
								</td>
								<td>
									<a href="">内科</a>
								</td>
								<td>
									<a href="">男科</a>
								</td>
								<td>
									<a href="">外科</a>
								</td>
							</tr>
							<tr>
								<td>
									<a href="">骨科</a>
								</td>
								<td>
									<a href="">精神心理科</a>
								</td>
								<td>
									<a href="">中医科</a>
								</td>
								<td>
									<a href="">口腔科</a>
								</td>
								<td>
									<a href="">眼科</a>
								</td>
								<td>
									<a href="">耳鼻咽喉科</a>
								</td>
							</tr>
							<tr>
								<td>
									<a href="">营养科</a>
								</td>
								<td>
									<a href="">肿瘤防治科</a>
								</td>
						</table>

						<div class="AQmenu-down" style="background-color:#F8F8F8 ; margin-top: 30px; padding: 5px 10px;">
							<span style="font-family: '微软雅黑';font-size: 17px;">
									疾病：
									<a href=""> 青春痘</a>
									<a href=""> 痤疮</a>
									<a href=""> 湿疹</a>
									<a href="">艾滋病</a>
							</span>
						</div>

					</div>

					<!--内容容器-->

					<div class="col-lg-12 AQcontent">
						<!--内容左侧-->
						 
						<div class="col-lg-8 AQcontent-left">
					 <div style="margin-top:0px; font-size: 16px;">
					 <c:if test="${ques_depart eq null }">
					 <span style=" background-color: #FE6507; padding:7px 5px; border-radius: 5px; color: #ffffff;">全部</span>
					 </c:if>
					 <c:if test="${ques_depart ne null }">
					<span style=" background-color: #FE6507; padding:7px 5px; border-radius: 5px; color: #ffffff;">${ques_depart }</span>
					</c:if>
					</div>
			<c:forEach items="${allanswer }" var="ar">
							<!--每一条信息-->
							<div class="AQcontent-left-message">
							
								<div class="pull-right" style="font-size: 15px;color: #8C8C8C;">
								${ar.ans_time} 
								</div>
								<div class="message-hidden2">
									<span class="message-ask">
									问
								</span>
								<input type="hidden" id="mess_before" value="${ar.ques_tittle}">
									<span class="message-fir" data-toggle="modal" data-target="#myModal">
									${ar.ques_tittle}
								</span>
								<input type="hidden" id="mess_next" value="${ar.ques_answer}">
								</div>
								<div class="message-hidden2">
									<span class="message-ans">
									答
								</span>
									<span class="message-sec">
									${ar.ques_answer}
								</span>
								</div>
								<div>
									<span class="message-thi">
					
								</span>
								</div>

							</div>

							<!--每一条信息结束-->
			</c:forEach>

						</div>
						<!--内容右侧-->
						<div class="col-lg-4 AQcontent-right">
							<div class="AQcontent-right-title">
								推荐专家
							</div>
			<c:forEach items="${alldoc }" var="ad">
<!--每个专家小卡片-->
							<div class="AQcontent-right-Doc">
								<div class="AQcontent-right-head">
									<a href="#">
										<img src="img/${ad.doc_image }" />
									</a>
									<span class="AQcontent-right-consult">
									可咨询
									</span>
								
								</div>

								<div class="doc-right">
									<div class="AQcontent-right-name">
										<a href="details.do?id=${ad.doc_id}">${ad.user_nike}</a>
									</div>
									<div class="AQcontent-right-message">
										<br />${ad.doc_depart } ${ad.doc_position }
									</div>
									<div class="AQcontent-right-goodat">
									${ad.doc_adept }	
									</div>
								</div>
							</div>
							<!--每个专家小卡片结束-->
		</c:forEach>
						 
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
                <h4 class="modal-title" id="myModalLabel">问题-答案详情</h4>
            </div>
            <div class="modal-body">
<!--               题目： <div id="heal_tittle">
               	 
             </div>
               答案： <div id="heal_answer">
               	 
             </div> -->
             
             <div>
										<span class="message-ask">
									问
								</span>
										<span class="message-fir" id="heal_tittle">
									  
								</span>
									</div>
									<div style="margin-top:20px;">
										<span class="message-ans">
									答
								</span>
										<span class="message-sec" id="heal_answer">
									  
								</span>
									</div>
								 
            	
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
        
        
        <!--
        	模态框结束
        -->
	</body>

</html>