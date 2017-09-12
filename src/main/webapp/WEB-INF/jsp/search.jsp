<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% request.setAttribute("title","搜索"); %>
<%@ include file="./modules/web-header.jsp"%>
<%@ include file="./modules/header.jsp"%>
	
	<div class="home-main">
		<div class="display-container margin-top">
			<c:if test="${users.size()>0}">
			<div class="display-type">相关用户<span class="grey glyphicon glyphicon-chevron-right"></span></div>
			</c:if>
			
			<c:forEach items="${users}" var="user">
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
		
			<c:if test="${portfolios.size()>0}">
			<div class="display-type">相关作品<span class="grey glyphicon glyphicon-chevron-right"></span></div>
			</c:if>
			<c:forEach items="${portfolios}" var="portfolio">
			<div class="display-item">
				<img class="item-img" src="${pageContext.request.contextPath}/file/portfolio/${portfolio.id}" />
				<img class="user-avatar" src="${pageContext.request.contextPath}/static/img/avatar/avatar-${portfolio.userId%7}.jpg" />
				<div class="item-title">${portfolio.title}</div>
				<div class="item-intro">${portfolio.content }</div>
				<a class="card-over" href="${pageContext.request.contextPath}/portfolio/${portfolio.id}"></a>
			</div>
			</c:forEach>
			
			<c:if test="${projects.size()>0}">
			<div class="display-type">相关项目<span class="grey glyphicon glyphicon-chevron-right"></span></div>
			</c:if>
			
			<c:forEach items="${projects}" var="project">
			<div class="display-item">
				<img class="item-img" src="${pageContext.request.contextPath}/file/portfolio/${portfolio.id}" />
				<img class="user-avatar" src="${pageContext.request.contextPath}/static/img/avatar/avatar-${project.posterId%7}.jpg" />
				<div class="item-title">${project.title }</div>
				<div class="item-intro">${project.requirement}</div>
				<a class="card-over" href="${pageContext.request.contextPath}/project/${project.id}"></a>
			</div>
			</c:forEach>
			
			<c:if test="${portfolios.size()==0 && projects.size()==0 && users.size()==0}">
				<div class="display-bar empty-bar">
					<img src="${pageContext.request.contextPath}/static/img/empty.png" />
					<div class="empty-text">空空如也...</div>
				</div>
			</c:if>
			<div class="tail">
				© 2017 Linkode
			</div>
		</div>
	</div>
	
<%@ include  file="./modules/javascript.jsp"%>
<%@ include  file="./modules/web-footer.jsp"%>
