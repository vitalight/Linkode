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
	<%@ include file="./userHeader.jsp"%>

	<div class="display-container">

		<c:forEach items="${portfolios}" end="7" var="portfolio">
			<div class="display-item">
				<img class="item-img"
					src="${pageContext.request.contextPath}/static/img/pic/pic-${portfolio.id%13}.png" />
				<img class="user-avatar"
					src="${pageContext.request.contextPath}/static/img/avatar/avatar-${portfolio.userId%7}.jpg" />
				<div class="item-title">${portfolio.title}</div>
				<div class="item-intro">${portfolio.content }</div>
				<a class="card-over"
					href="${pageContext.request.contextPath}/portfolio/${portfolio.id}"></a>
			</div>
		</c:forEach>
	</div>


	<%@ include file="../modules/javascript.jsp"%>
	<script
		src="${pageContext.request.contextPath}/static/js/jquery.md5.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/js/form-validate.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#${field}").addClass("cute-btn-chose");
		})
	</script>

	<%@ include file="../modules/web-footer.jsp"%>