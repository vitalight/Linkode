<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
	request.setAttribute("title", "个人主页");
%>
<%
	request.setAttribute("headType", "user");
%>
<%@ include file="../modules/web-header.jsp"%>
<%--link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/pintuer.css"--%>
</head>
<body>
	<%@ include file="../modules/header.jsp"%>
	<%@ include file="./userHeader.jsp" %>
	<div class="display-info">
		<table class="info-table">
			<tbody>
				<tr>
					<th>用户名</th>
					<td>${user.username}</td>
				</tr>
				<tr>
					<th>邮箱</th>
					<td>
						${user.email}
					</td>
				</tr>
				<tr>
					<th>评分</th>
					<td>
						<fmt:formatNumber value="${user.ratingTotal/user.ratingNumber}" pattern="0.0">
						</fmt:formatNumber>
					</td>
				</tr>
				<tr>
					<th>性别</th>
					<td>${user.sex}</td>
				</tr>
				<tr>
					<th>生日</th>
					<td>
						<fmt:formatDate type="Date" value="${user.birthday}"></fmt:formatDate>
					</td>
				</tr>
				<tr>
					<th>介绍</th>
					<td>${user.intro}</td>
				</tr>
			</tbody>
		</table>
		<a class="hollow-btn">修改资料</a>
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