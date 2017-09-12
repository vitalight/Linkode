<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","主页"); %>
<% request.setAttribute("headType","main"); %>
<%@ include file="./modules/web-header.jsp"%>
<%@ include file="./modules/header.jsp"%>
	
	<div class="home-main">
		<div class="bg-container">
		</div>
		<div class="display-container">
			<div class="display-type">
				<a href="${pageContext.request.contextPath}/portfolio">热门作品</a>
				<span class="grey glyphicon glyphicon-chevron-right"></span>
				
			</div>
			
			<c:forEach items="${portfolios}" end="7" var="portfolio">
			<div class="display-item">
				<img class="item-img" src="${pageContext.request.contextPath}/file/portfolio/${portfolio.id}" />
				<img class="user-avatar" src="${pageContext.request.contextPath}/static/img/avatar/avatar-${portfolio.userId%7}.jpg" />
				<div class="item-title">${portfolio.title}</div>
				<div class="item-intro">${portfolio.content }</div>
				<a class="card-over" href="${pageContext.request.contextPath}/portfolio/${portfolio.id}"></a>
			</div>
			</c:forEach>
			
			<c:forEach begin="${portfolios.size()}" end="7">
			<div class="display-item">
				<img class="item-empty" src="${pageContext.request.contextPath}/static/img/empty.png" />
				<div class="empty-text">暂无更多</div>
			</div>
			</c:forEach>
			
			<div class="display-ad">
				<img src="${pageContext.request.contextPath}/static/img/ad/ad-${ads[0].id}.png" />
				<a class="card-over" target="_blank" href="${ads[0].content}"></a>
			</div>
		
			<div class="display-type">
				<a href="${pageContext.request.contextPath}/project">推荐项目</a>
				<span class="grey glyphicon glyphicon-chevron-right"></span>
			</div>
			
			<c:forEach items="${projects}" end="7" var="project">
			<div class="display-item">
				<img class="item-img" src="${pageContext.request.contextPath}/static/img/pic/pic-${project.id%13 }.png" />
				<img class="user-avatar" src="${pageContext.request.contextPath}/static/img/avatar/avatar-${project.posterId%7}.jpg" />
				<div class="item-title">${project.title }</div>
				<div class="item-intro">${project.requirement}</div>
				<a class="card-over" href="${pageContext.request.contextPath}/project/${project.id}"></a>
			</div>
			</c:forEach>
			
			<c:forEach begin="${projects.size()}" end="7">
			<div class="display-item">
				<img class="item-empty" src="${pageContext.request.contextPath}/static/img/empty.png" />
				<div class="empty-text">暂无更多</div>
			</div>
			</c:forEach>
			
			<div class="display-ad">
				<img src="${pageContext.request.contextPath}/static/img/ad/ad-${ads[1].id}.png" />
				<a class="card-over" target="_blank" href="${ads[1].content}"></a>
			</div>
			
			<div class="tail">
				© 2017 Linkode
			</div>
		</div>
	</div>
	
<%@ include  file="./modules/javascript.jsp"%>
<%@ include  file="./modules/web-footer.jsp"%>
