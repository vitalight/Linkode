<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","我发布的项目"); %>
<% request.setAttribute("headType","project"); %>
<%@ include file="../modules/web-header.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/explore.css">
</head>
<body>
<%@ include file="../modules/header.jsp"%>
	<div class="type-list">
		<a class="type-btn" href="${pageContext.request.contextPath}/project/explore">所有项目</a>
		<a class="type-btn type-chose" href="${pageContext.request.contextPath}/project/myProject">我发布的项目</a>
		<a class="type-btn" href="${pageContext.request.contextPath}/project/myContract">我承包的项目</a>
		<a class="type-btn" href="${pageContext.request.contextPath}/project/publish">发布项目</a>
	</div>
	
	<div class="display">
		<c:forEach items="${model.data}" var="project">
			<c:if test="${LOGIN_USER_ID == project.posterId }">
				<div class="display-bar">
					<div class="row">
						<div class="col-sm-3">
							<img class="display-bar-img" src="${pageContext.request.contextPath}/static/img/pic-${project.id%10+1}.png"/>
						</div>
						<div class="col-sm-9">
							<h3>${project.title }<span class="type-tag ran-${project.id%3}">${project.type}</span></h3>
							<div class="row bar-info">
								<span class="col-sm-3 no-padding"><strong>酬金：</strong>￥${project.money }</span>
								<span class="col-sm-4 no-padding"><strong>开始日期：</strong>
									<fmt:formatDate type="date" value="${project.startDate}" />
								</span>
								<span class="col-sm-4 no-padding"><strong>截止日期：</strong>
									<fmt:formatDate type="date" value="${project.endDate}" />
								</span>
							</div>
							<div class="row bar-content">
								${project.requirement}
							</div>
								<div class="col-sm-7"></div>
								<button class="col-sm-2 contract-btn">修改项目</button>
								<button class="col-sm-2 col-sm-offset-1 contract-btn">删除项目</button>
						</div>
					</div>
						<hr />
						<div class="row some-margin">
							<div class="col-sm-1">
								<img class="request-img" src="${pageContext.request.contextPath}/static/img/avatar.png" />
							</div>
							<div class="col-sm-8 request">
								<div class="row request-name">${project.contractorId}</div>
								<div class="row request-time">1 minutes ago</div>
							</div>
							<c:choose>
								<c:when test="${project.status=='uncontracted'}">
									<button class="col-sm-2 col-sm-offset-1 contract-btn yellow-bg center">未被承包</button>
								</c:when>
								<c:when test="${project.status=='unfinished' }">
									<button class="col-sm-2 col-sm-offset-1 contract-btn yellow-bg center">未提交</button>
								</c:when>
								<c:when test="${project.status=='unconfirmed'}">
									<form action="${pageContext.request.contextPath}/project/confirm/${project.id}" method="get">
										<button class="col-sm-2 col-sm-offset-1 contract-btn yellow-bg center">通过提交</button>
									</form>
								</c:when>
								<c:otherwise>
									<button class="col-sm-2 col-sm-offset-1 contract-btn yellow-bg center" disabled>已完成</button>
								</c:otherwise>
							</c:choose>
						</div>
				</div>
			</c:if>
		</c:forEach>
	</div>

<%@ include  file="../modules/javascript.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/jquery.md5.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/form-validate.js"></script>
<%@ include  file="../modules/web-footer.jsp"%>