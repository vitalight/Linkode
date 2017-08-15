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
			${nav.content}
			<c:if test="${LOGIN_USER_ROLE == 'admin'}">
			<a class="cute-btn" href="${pageContext.request.contextPath}/tutorial/update/6">编辑导航</a>
			</c:if>
		</div>
	</div>
	<div class="margin-bottom display-sheet">
		<div class="sheet-content">
			<div class="row">
				<h1>教程中心
				
				<c:if test="${LOGIN_USER_ROLE == 'admin'}">
				<a class="edit-link" href="${pageContext.request.contextPath}/tutorial/delete/${model.id}">删除教程</a>
				<a class="edit-link" href="${pageContext.request.contextPath}/tutorial/create">新建教程</a>
				<a class="edit-link" href="${pageContext.request.contextPath}/tutorial/update/${model.id}">编辑教程</a>
				</c:if>
				</h1>
			</div>
			${model.content}	
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