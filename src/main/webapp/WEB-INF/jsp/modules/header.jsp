<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="ckeditor" uri="http://ckeditor.com" %>
<nav class="white-nav navbar-fixed-top">
	<ul>
		<li><a class="logo-btn" ><img class="nav-logo" src="${pageContext.request.contextPath}/static/img/LK.png"/></a></li>
		<li><a class="nav-btn">主页</a></li>
		<c:if test="${LOGIN_USER_ROLE == 'admin'}">
		<li><a class="nav-btn" id="head-admin" href="${pageContext.request.contextPath}/admin">管理员界面</a></li>
		</c:if>
		<li><a class="nav-btn" id="head-portfolio" href="${pageContext.request.contextPath}/portfolio">作品交流</a></li>
		<li><a class="nav-btn" id="head-tutorial" href="${pageContext.request.contextPath}/tutorial">教程</a></li>
		<li><a class="nav-btn" id="head-post" href="${pageContext.request.contextPath}/post">讨论区</a></li>
		<li><a class="nav-btn" id="head-project" href="${pageContext.request.contextPath}/project">项目众包</a></li>
		<shiro:authenticated>
			<li><a class="nav-btn" id="head-login" href="${pageContext.request.contextPath}/logout">登出</a></li>
		</shiro:authenticated>
		<shiro:notAuthenticated>
			<li><a class="nav-btn" id="head-login" href="${pageContext.request.contextPath}/login">登录</a></li>
		</shiro:notAuthenticated>
	</ul>
	<c:if test="${!empty LOGIN_USER_ID}">
		<img class="user-btn avatar" src="${pageContext.request.contextPath}/static/img/avatar.png"/>
		<a class="nav-btn user-btn" href="/user/${LOGIN_USER_ID}">Hello, ${LOGIN_USER_NAME}<span class="glyphicon glyphicon glyphicon-chevron-down myicon"></span></a>
	</c:if>
</nav>
