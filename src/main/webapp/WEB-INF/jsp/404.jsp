<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<% request.setAttribute("title","404"); %>
<%@ include file="./modules/web-header.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/404.css">
</head>
<body>
	<div class="middle">
		Opss! This page is eaten by Jason.<br/>
		<form action="${pageContext.request.contextPath}/home">
			<button class="login-btn">主页</button>
		</form>
	</div>
</body>
