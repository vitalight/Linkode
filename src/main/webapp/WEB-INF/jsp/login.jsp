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
			<h1>Login now</h1>
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
					<p>Enjoy the world of the art.</p>
				</c:otherwise>
			</c:choose>

			<form id="login-form" action="${pageContext.request.contextPath}/login" method="post">
				<input placeholder="Email" class="login-input account"
					id="email" name="email" /><br />
				<input placeholder="Password" type="password"
					class="login-input password" id="password" name="password" /><br /><br/>
				<input type="submit" class="blue-green-bottom" value="Log in" />
			</form>
			<p>
				Don't have a login? <a href="${pageContext.request.contextPath}/register" class="link">Register</a>
			</p>
		</div>
	</div>
    
</div>
<%@ include  file="./modules/javascript.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/jquery.md5.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/form-validate.js"></script>
<%@ include  file="./modules/web-footer.jsp"%>
