<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","项目浏览"); %>
<% request.setAttribute("headType","project"); %>
<%@ include file="../modules/web-header.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/explore.css">
</head>
<body>
<%@ include file="../modules/header.jsp"%>
	<div class="type-list">
		<a class="type-btn" id="all" href="${pageContext.request.contextPath}/project">可接项目</a>
		<a class="type-btn" id="myProject" href="${pageContext.request.contextPath}/project/myProject">我发布的项目</a>
		<a class="type-btn" id="myContract" href="${pageContext.request.contextPath}/project/myContract">我承包的项目</a>
		<a class="type-btn" id="myApplication" href="${pageContext.request.contextPath}/project/myApplication">我申请的项目</a>
		<a class="type-btn" href="${pageContext.request.contextPath}/project/create">发布项目</a>
	</div>
	
	<div class="display">
		<c:forEach items="${model}" var="project" >
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
$(document).ready(function() {
	if (${type == null}) {
		$("#all").addClass("type-chose");
	}
	else {
		$("#${type}").addClass("type-chose");
	}
}); 
</script>
<%@ include  file="../modules/web-footer.jsp"%>