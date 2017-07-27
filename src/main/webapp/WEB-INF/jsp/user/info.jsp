<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
	request.setAttribute("title", "个人主页");
%>
<%
	request.setAttribute("headType", "user");
%>
<%@ include file="../modules/web-header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/pintuer.css">
</head>
<body>
	<%@ include file="../modules/header.jsp"%>
	<%@ include file="./userHeader.jsp" %>

	<div class="margin-bottom display-sheet">
		<div class="info-panel">
			<br/>
			<br/>
			<div class="line-group">
				<hr class="bg-gray">
				<span class="icon-calendar-o line-icon"> 基本信息</span>
				<hr class="bg-gray">
			</div>
			<div class="info-item">
				<span class="info-key">ID</span> <span class="info-value">${user.id}</span>
			</div>
			<div class="info-item">
				<span class="info-key">昵称</span> <span class="info-value">${user.username}</span>
			</div>
			<div class="info-item">
				<span class="info-key">邮箱</span> <span class="info-value">${user.email}</span>
			</div>
			<div class="info-item">
				<span class="info-key">生日</span> <span class="info-value"><fmt:formatDate
						type="Date" value="${user.birthday}"></fmt:formatDate></span>
			</div>
			<div class="info-item">
				<span class="info-key">评价</span>
				<c:if test="${user.ratingNumber != 0}">
					<span class="info-value"><fmt:formatNumber
							value="${user.ratingTotal/user.ratingNumber}" pattern="0.0"></fmt:formatNumber></span>
				</c:if>
				<c:if test="${user.ratingNumber == 0}">
					<span class="info-value">暂无评价</span>
				</c:if>
			</div>
			<div class="info-item">
				<span class="info-key">简介</span> <span class="info-value">${user.intro}</span>
			</div>
			<br/>
			<br/>
			<br/>

			<c:if test="${LOGIN_USER_ID == id}">
				<div class="line-group">
					<hr class="bg-gray">
					<a href="${pageContext.request.contextPath}/user/${id}/info/edit"><span
						class="icon-edit line-icon"> 编辑信息</span></a>
					<hr class="bg-gray">
				</div>
			</c:if>


		</div>
	</div>


	<%@ include file="../modules/javascript.jsp"%>
	<script
		src="${pageContext.request.contextPath}/static/js/jquery.md5.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/js/form-validate.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/pintuer.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#info").addClass("cute-btn-chose");
		})
	</script>
	<%@ include file="../modules/web-footer.jsp"%>