<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="display little-margin-top">
	<c:forEach items="${model}" var="project">
	<div class="display-bar">
		<img class="display-bar-img" src="${pageContext.request.contextPath}/static/img/pic/pic-${project.id%13}.png"/>
		<div class="bar-main">
			<h3>${project.title }
			<span class="type-tag">
			<fmt:setBundle basename="messages" var="lang"/>
			<fmt:message bundle="${lang}" key="${project.type}"/></span>

			<c:if test="${project.status=='contract'}">
			<span class="type-tag ran-3">待完成</span>
			</c:if>
			<c:if test="${project.status=='confirm'}">
			<span class="type-tag ran-1">已完成</span>
			</c:if>
			</h3>
			<div class="bar-info">
				<span class="bar-text">开始日期：
					<fmt:formatDate type="date" value="${project.startDate}" />
				</span>
				<span class="bar-text">截止日期：
					<fmt:formatDate type="date" value="${project.endDate}" />
				</span>
			</div>
			<div class="bar-content">
				${project.requirement}
			</div>
			<div class="author-info">
				<img class="bar-avatar" 
					src="${pageContext.request.contextPath}/file/user/${project.posterId}"/>
				${project.username}
			</div>
			<span class="bar-price">￥${project.money}</span>
		</div>
		<a class="card-over" href="${pageContext.request.contextPath}/project/${project.id}"></a>
	</div>
	</c:forEach>
	<c:if test="${model==null}">
	<div class="display-bar empty-bar">
		<img src="${pageContext.request.contextPath}/static/img/empty.png" />
		<div class="empty-text">空空如也...</div>
	</div>
	</c:if>
</div>
