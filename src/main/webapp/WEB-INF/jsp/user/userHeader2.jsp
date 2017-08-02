<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="margin-top display-sheet sheet-special">
	<div class="user-img">
		<img
			src="${pageContext.request.contextPath}/static/img/avatar/avatar-${id % 7}.jpg"
			class="radius-circle" width="100" height="100" />
		<p>
			<span class="icon-${user.sex}"></span> ${user.username}
		</p>
	</div>
	<div class="cute-list">
		<a class="cute-btn" id="info"
			href="${pageContext.request.contextPath}/user/${id}/info">个人信息</a> <a
			class="cute-btn" id="portfolio"
			href="${pageContext.request.contextPath}/user/${id}/portfolio">个人作品</a>
		<a class="cute-btn" id="project"
			href="${pageContext.request.contextPath}/user/${id}/project">个人项目</a>
		<c:if test="${LOGIN_USER_ID == id}">
			<a class="cute-btn" id="chatlog"
				href="${pageContext.request.contextPath}/user/${id}/chatlog">我的私信</a>
		</c:if>
		<c:if test="${LOGIN_USER_ID != id}">
			<a class="cute-btn" id="chatlog"
				href="${pageContext.request.contextPath}/chat/${LOGIN_USER_ID}/${id}">私聊</a>
		</c:if>
	</div>
</div>