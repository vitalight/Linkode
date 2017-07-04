<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","项目浏览"); %>
<% request.setAttribute("headType","project"); %>
<%@ include file="../modules/web-header.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/explore.css">
</head>
<body>
<%@ include file="../modules/header.jsp"%>
	<%  
	String type = request.getParameter("type");
	String randomClass="", latestClass="", popularClass="";
	if (type==null) {
		randomClass="type-chose";
	} else if (type.equals("latest")) {
		latestClass="type-chose";
	} else if (type.equals("popular")) {
		popularClass="type-chose";
	} else {
		randomClass = "type-chose";
	}
	%>
	<div class="type-list">
		<a class="type-btn <%=randomClass %>" href="${pageContext.request.contextPath}/project/explore?type=random">Random</a>
		<a class="type-btn <%=latestClass %>" href="${pageContext.request.contextPath}/project/explore?type=latest">Latest</a>
		<a class="type-btn <%=popularClass %>" href="${pageContext.request.contextPath}/project/explore?type=popular">Popular</a>
	</div>
	
	<div class="display">
		<%
		for (int i=0;i<20;i++) { %>
		<div class="display-card">
			<a href="">
				<img class="display-img" src="${pageContext.request.contextPath}/static/img/pic-<%=i%10+1%>.png"/>
				<p class="card-name">NewYork.jpg</p>
				<p class="card-info">20 minutes ago</p>
			</a>
		</div>
		<% } %>
	</div>

<%@ include  file="../modules/javascript.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/jquery.md5.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/form-validate.js"></script>
<%@ include  file="../modules/web-footer.jsp"%>