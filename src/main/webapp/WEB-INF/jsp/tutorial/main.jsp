<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","作品浏览"); %>
<% request.setAttribute("headType","tutorial"); %>
<%@ include file="../modules/web-header.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/explore.css">
</head>
<body>
<%@ include file="../modules/header.jsp"%>
	<c:set var="cuteType" value="${id}" />
	<div class="margin-top display-sheet">
		<div class="cute-list">
			<c:forEach items="${model.tutorials}" var="tutorial">
				<a class="cute-btn" id="cute-${tutorial.id}" href="${pageContext.request.contextPath}/tutorial/${tutorial.id}">${tutorial.type}</a>
			</c:forEach>
			<a class="cute-btn" href="${pageContext.request.contextPath}/tutorial/updateNavigator">编辑导航</a>
		</div>
	</div>
	<div class="margin-bottom display-sheet">
		<div class="sheet-content">
			<div class="row">
				<h1>教程中心
				<a class="edit-link" href="${pageContext.request.contextPath}/tutorial/delete/${model.tutorial.id}">删除教程</a>
				<a class="edit-link" href="${pageContext.request.contextPath}/tutorial/create">新建教程</a>
				<a class="edit-link" href="${pageContext.request.contextPath}/tutorial/update/${model.tutorial.id}">编辑教程</a>
				</h1>
			</div>
			${model.tutorial.content}	
		</div>
	</div>

<%@ include  file="../modules/javascript.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/jquery.md5.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/form-validate.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	if (${type == null}) {
		$("#all").addClass("type-chose");
	}
	else {
		$("#${type}").addClass("type-chose");
	}
	$("#cute-${cuteType}").addClass("cute-btn-chose");
}); 
</script>
<%@ include  file="../modules/web-footer.jsp"%>