<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","作品浏览"); %>
<% request.setAttribute("headType","tutorial"); %>
<%@ include file="../modules/web-header.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/explore.css">
</head>
<body>
<%@ include file="../modules/header.jsp"%>
	
	<c:set var="cuteType" value="${id}" />
	<c:if test="${id!=0}">
		<c:set var="addUrl" value="/${id}" />
	</c:if>
	<div class="margin-top display-sheet">
		<div class="cute-list">
			<c:if test="${id!=0}">
				<a class="cute-btn" id="cute-${tutorial.id}" href="${pageContext.request.contextPath}/tutorial/updateNavigator${addUrl}/0">基准</a>
			</c:if>
			<c:forEach items="${model}" var="tutorial">
				<c:if test="${id==tutorial.id}">
					<a class="cute-btn" id="cute-${tutorial.id}" href="${pageContext.request.contextPath}/tutorial/updateNavigator">${tutorial.type}</a>
				</c:if>
				<c:if test="${id!=tutorial.id}">
					<a class="cute-btn" id="cute-${tutorial.id}" href="${pageContext.request.contextPath}/tutorial/updateNavigator${addUrl}/${tutorial.id}">${tutorial.type}</a>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<div class="margin-bottom display-sheet">
		<div class="sheet-content">
			<div class="row">
				<h1>小贴士</h1>
			</div>
			点击第一下选中要移动的目标，点击第二下将其移动到点击目标的后一格。
			<hr/>
			<a href="${pageContext.request.contextPath}/tutorial">取消编辑</a>
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