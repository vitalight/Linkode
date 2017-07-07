<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
	String headType = (String)request.getAttribute("headType");
	String crud="", portfolio="", project="", login="";
	if (headType == null) {
	} else if (headType.equals("crud")) {
		crud = "nav-btn-chose";
	} else if (headType.equals("portfolio")) {
		portfolio = "nav-btn-chose";
	} else if (headType.equals("project")) {
		project = "nav-btn-chose";
	} else {
		login = "nav-btn-chose";
	}
%>
<nav class="white-nav navbar-fixed-top">
	<ul>
		<li><a class="logo-btn" ><img class="nav-logo" src="${pageContext.request.contextPath}/static/img/LK.png"/></a></li>
		<li><a class="nav-btn <%=crud %>" href="${pageContext.request.contextPath}/admin">管理员界面</a></li>
		<li><a class="nav-btn <%=portfolio %>" href="${pageContext.request.contextPath}/portfolio">作品交流</a></li>
		<li><a class="nav-btn <%=project %>" href="${pageContext.request.contextPath}/project">项目众包</a></li>
		<shiro:authenticated>
			<li><a class="nav-btn <%=login %>" href="${pageContext.request.contextPath}/logout">登出</a></li>
		</shiro:authenticated>
		<shiro:notAuthenticated>
			<li><a class="nav-btn <%=login %>" href="${pageContext.request.contextPath}/login">登录</a></li>
		</shiro:notAuthenticated>
	</ul>
	<c:if test="${!empty LOGIN_USER_ID}">
		<img class="user-btn avatar" src="${pageContext.request.contextPath}/static/img/avatar.png"/>
		<a class="nav-btn user-btn">Hello, ${LOGIN_USER_NAME}<span class="glyphicon glyphicon glyphicon-chevron-down myicon"></span></a>
	</c:if>
</nav>
