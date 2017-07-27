<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","个人主页"); %>
<% request.setAttribute("headType","user"); %>
<%@ include file="../modules/web-header.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/pintuer.css">
</head>
<body>
<%@ include file="../modules/header.jsp"%>
	<%@ include file="./userHeader.jsp" %>
	<div class="display little-margin-top">
		<c:forEach items="${model}" var="project">
		<div class="display-bar">
			<img class="display-bar-img" src="${pageContext.request.contextPath}/static/img/pic/pic-${project.id%13}.png"/>
			<div class="bar-main">
				<h3>${project.title }
				<span class="type-tag">
				<fmt:setBundle basename="messages" var="lang"/>
				<fmt:message bundle="${lang}" key="${project.type}"/></span>
				
				<c:if test="${project.posterId==LOGIN_USER_ID}">
				<span class="type-tag ran-0">你的发布</span>
				</c:if>
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
						src="${pageContext.request.contextPath}/static/img/avatar/avatar-${project.posterId%7}.jpg"/>
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
	

<%@ include  file="../modules/javascript.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/jquery.md5.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/form-validate.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#${field}").addClass("cute-btn-chose");
		})
	</script>

<%@ include  file="../modules/web-footer.jsp"%>