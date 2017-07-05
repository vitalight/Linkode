<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","我承包的项目"); %>
<% request.setAttribute("headType","project"); %>
<%@ include file="../modules/web-header.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/explore.css">
</head>
<body>
<%@ include file="../modules/header.jsp"%>
	<div class="type-list">
		<a class="type-btn " href="${pageContext.request.contextPath}/project/explore">所有项目</a>
		<a class="type-btn " href="${pageContext.request.contextPath}/project/myProject">我发布的项目</a>
		<a class="type-btn type-chose" href="${pageContext.request.contextPath}/project/myContract">我承包的项目</a>
		<a class="type-btn" href="${pageContext.request.contextPath}/project/publish">发布项目</a>
	</div>
	
	<div class="display">
		<c:forEach items="${model.data}" var="project">
			<c:if test="${LOGIN_USER_ID == project.contractorId }">
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
							<div class="col-sm-10 author">
							</div>
							<c:choose>
								<c:when test="${project.status=='unfinished'}">
									<form action="${pageContext.request.contextPath}/project/submit/${project.id}" method="get">
										<button class="col-sm-2 contract-btn" type="submit">提交作品</button>
									</form>
								</c:when>
								<c:when test="${project.status=='unconfirmed'}">
									<button class="col-sm-2 contract-btn" type="submit" disabled>待确定</button>
								</c:when>
								<c:otherwise>
									<button class="col-sm-2 contract-btn" type="submit" disabled>已完成</button>
								</c:otherwise>
							</c:choose>
						</div>
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