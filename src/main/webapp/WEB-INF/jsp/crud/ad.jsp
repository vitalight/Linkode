<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
	request.setAttribute("title", "ad");
%>
<%@ include file="../modules/web-header.jsp"%><%@ include
	file="../modules/crud-header.jsp"%>
</head>
<body><%@ include file="../modules/header.jsp"%>
	<c:set var="type" value="ad" />
	<c:set var="headType" value="admin" /><%@ include
		file="./crud-head.jsp"%>
	
	<div class="display-container">
		<div class="display-ad">
			<div class="img-text">发布广告</div>
			<a class="card-over" href="${pageContext.request.contextPath}/ad/create"></a>
		</div>
		<br/>
		<c:forEach items="${model}" var="ad">
		<div class="display-ad">
			<img src="${pageContext.request.contextPath}/file/ad/${ad.id}" />
			<a class="card-over" href="${pageContext.request.contextPath}/ad/${ad.id}/edit"></a>
		</div>
		<br/>
		</c:forEach>
	</div>
	
	<%@ include file="../modules/javascript.jsp"%>
	<%@ include file="../modules/crud-footer.jsp"%>
	<script src="${pageContext.request.contextPath}/static/js/crud/ad.js"></script>
	<%@ include file="../modules/web-footer.jsp"%>