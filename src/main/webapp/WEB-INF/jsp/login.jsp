<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","登录"); %>
<% request.setAttribute("headType","login"); %>
<%@ include file="./modules/web-header.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css">
</head>
<body>
<%@ include file="./modules/header.jsp"%>
	
    <div class="wrapper">
		<img src="${pageContext.request.contextPath}/static/img/login-dec.gif" class="login-pic" />
		<div class="login-form">
			<br />
			<h1>用户登录</h1>
			<c:choose>
				<c:when test="${!empty errormsg }">
					<p class="show-error">${errormsg }</p>
				</c:when>
				<c:when test="${!empty errors.email }">
					<p class="show-error">${errors.email }</p>
				</c:when>
				<c:when test="${!empty errors.password }">
					<p class="show-error">${errors.password }</p>
				</c:when>
				<c:otherwise>
					<p>享受世界顶尖的艺术盛宴</p>
				</c:otherwise>
			</c:choose>

			<form id="login-form" action="${pageContext.request.contextPath}/login" method="post">
				<input placeholder="邮箱" class="login-input account"
					id="email" name="email" autofocus/><br />
				<input placeholder="密码" type="password"
					class="login-input password" id="password" name="password" /><br /><br/>
				<input type="submit" class="blue-green-bottom" value="登录" />
			</form>
			<p>
				还没有账号？ <a href="${pageContext.request.contextPath}/register" class="link">注册</a>
			</p>
		</div>
	</div>
    
</div>
<%@ include  file="./modules/javascript.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/jquery.md5.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/form-validate.js"></script>
<%@ include  file="./modules/web-footer.jsp"%>
