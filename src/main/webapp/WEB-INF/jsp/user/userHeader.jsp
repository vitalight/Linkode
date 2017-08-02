<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="home-main">
	<div class="bg-container special">
		<img class="user-bg" src="${pageContext.request.contextPath}/static/img/banner.jpg" />
	</div>
	<div class="user-info">
		<img class="info-avatar" src="${pageContext.request.contextPath}/static/img/avatar/avatar-${user.id}.jpg" />
		<div class="info">
			<div class="username">${user.username}</div>
			<div class="grey-info">${user.sex} | 设计爱好者</div>
			<c:if test="${LOGIN_USER_ID != id}">
			<a class="hollow-btn" href="${pageContext.request.contextPath}/chat/${LOGIN_USER_ID}/${id}">私信</a>
			<a class="hollow-btn">关注</a>
			</c:if>
		</div>
		<div class="info-nav">
			<a class="nav-btn" id="info" href="${pageContext.request.contextPath}/user/${id}/info">资料</a>
			<a class="nav-btn" id="portfolio" href="${pageContext.request.contextPath}/user/${id}/portfolio">作品</a>
			<a class="nav-btn" id="project" href="${pageContext.request.contextPath}/user/${id}/project">项目</a>
			<a class="nav-btn" id="chatlog" href="${pageContext.request.contextPath}/user/${id}/chatlog">私信箱</a>
		</div>
		
	</div>
</div>