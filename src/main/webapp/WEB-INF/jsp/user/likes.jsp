<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="display-container">
	<c:forEach items="${model}" var="user">
	<div class="display-item">
		<img class="item-img" src="${pageContext.request.contextPath}/static/img/small-banner.png" />
		<img class="user-avatar" src="${pageContext.request.contextPath}/static/img/avatar/avatar-${user.id%7}.jpg" />
		<div class="item-title">${user.username }</div>
		<div class="item-intro">
			<div class="item-limit">个人介绍：${user.intro}</div>
			评分：<%-- 评分显示数据准备, 当分母为0时的做特殊处理 --%>
			<c:set var="ratingNumber" value="${user.ratingNumber}" />
			<c:if test="${ratingNumber==0}">
				<c:set var="ratingNumber" value="1" />
			</c:if>
			<%-- ratingInt是rating的下取整，用于计算显示评分星星的长度 --%>
			<fmt:formatNumber value="${user.ratingTotal/ratingNumber}" pattern="0.0" var="rating" />
			<fmt:formatNumber value="${(rating-0.5)}" pattern="0" var="ratingInt" />
			<fmt:formatNumber value="${rating*0.92+ratingInt*0.29}" pattern="0.00" var="width" />
			<fmt:formatNumber value="${6-width }" pattern="0.00" var="margin" />
			
			<span class="rate-star">
				<i class="fa fa-star-o" aria-hidden="true"></i>
				<i class="fa fa-star-o" aria-hidden="true"></i>
				<i class="fa fa-star-o" aria-hidden="true"></i>
				<i class="fa fa-star-o" aria-hidden="true"></i>
				<i class="fa fa-star-o" aria-hidden="true"></i>
			</span>
			<span style="width:${width}em; margin-right:${margin}em" class="rate-star-out">
				<span class="rate-star-in">
				<i class="fa fa-star" aria-hidden="true"></i>
				<i class="fa fa-star" aria-hidden="true"></i>
				<i class="fa fa-star" aria-hidden="true"></i>
				<i class="fa fa-star" aria-hidden="true"></i>
				<i class="fa fa-star" aria-hidden="true"></i>
				</span>
			</span>
		</div>
		<a class="card-over" href="${pageContext.request.contextPath}/user/${user.id}"></a>
	</div>
	</c:forEach>
</div>