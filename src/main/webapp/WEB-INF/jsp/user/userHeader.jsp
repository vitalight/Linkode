<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="home-main">
	<div class="bg-container special">
		<img class="user-bg" src="${pageContext.request.contextPath}/static/img/banner.jpg" />
	</div>
	<div class="user-info">
		<img class="info-avatar" src="${pageContext.request.contextPath}/static/img/avatar/avatar-${user.id%7}.jpg" />
		<div class="info">
			<div class="username">${user.username}</div>
			<div class="grey-info">
				<fmt:setBundle basename="messages" var="lang"/>
				<fmt:message bundle="${lang}" key="${user.sex}"/>&nbsp;&nbsp;|&nbsp;&nbsp;设计爱好者</div>
			<c:if test="${LOGIN_USER_ID != id}">
			<a class="hollow-btn" href="${pageContext.request.contextPath}/chat/${LOGIN_USER_ID}/${id}">私信</a>
				<c:if test="${!hasLiked}">
				<a class="hollow-btn" id="js-like" href="javascript:;">关注</a>
				</c:if>
				<c:if test="${hasLiked}">
				<a class="hollow-btn" id="js-like" href="javascript:;">取消关注</a>
				</c:if>
			</c:if>
			
			<c:if test="${LOGIN_USER_ID == id}">
			<a class="hollow-btn" href="${pageContext.request.contextPath}/logout">登出</a>
			</c:if>
		</div>
		<div class="info-nav">
			<a class="nav-btn js-trigger" id="info" >资料</a>
			<a class="nav-btn js-trigger" id="portfolio" >作品</a>
			<a class="nav-btn js-trigger" id="project">项目</a>
			<a class="nav-btn js-trigger" id="rating">评价</a>
			<c:if test="${LOGIN_USER_ID == id}">
			<a class="nav-btn js-trigger" id="chatlog">私信箱</a>
			</c:if>
		</div>
		
	</div>
</div>