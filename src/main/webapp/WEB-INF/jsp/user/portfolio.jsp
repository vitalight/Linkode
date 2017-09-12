<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<div class="display-container">

		<c:forEach items="${portfolios}" var="portfolio">
			<div class="display-item">
				<img class="item-img"
					src="${pageContext.request.contextPath}/file/portfolio/${portfolio.id}" />
				<img class="user-avatar"
					src="${pageContext.request.contextPath}/file/user/${portfolio.userId}" />
				<div class="item-title">${portfolio.title}</div>
				<div class="item-intro">${portfolio.content }</div>
				<a class="card-over"
					href="${pageContext.request.contextPath}/portfolio/${portfolio.id}"></a>
			</div>
		</c:forEach>
		<c:if test="${portfolios==null}">
		<div class="display-bar empty-bar">
			<img src="${pageContext.request.contextPath}/static/img/empty.png" />
			<div class="empty-text">空空如也...</div>
		</div>
		</c:if>
	</div>
