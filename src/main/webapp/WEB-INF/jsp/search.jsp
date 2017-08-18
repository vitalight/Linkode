<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","搜索"); %>
<%@ include file="./modules/web-header.jsp"%>
<%@ include file="./modules/header.jsp"%>
	
	<div class="home-main">
		<div class="display-container margin-top">
			<c:if test="${portfolios.size()>0}">
			<div class="display-type">相关作品<span class="grey glyphicon glyphicon-chevron-right"></span></div>
			</c:if>
			<c:forEach items="${portfolios}" var="portfolio">
			<div class="display-item">
				<img class="item-img" src="${pageContext.request.contextPath}/static/img/pic/pic-${portfolio.id%13}.png" />
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
				<img class="item-img" src="${pageContext.request.contextPath}/static/img/pic/pic-${project.id%13 }.png" />
				<img class="user-avatar" src="${pageContext.request.contextPath}/static/img/avatar/avatar-${project.posterId%7}.jpg" />
				<div class="item-title">${project.title }</div>
				<div class="item-intro">${project.requirement}</div>
				<a class="card-over" href="${pageContext.request.contextPath}/project/${project.id}"></a>
			</div>
			</c:forEach>
			
			<c:if test="${portfolios.size()==0 && projects.size()==0}">
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
