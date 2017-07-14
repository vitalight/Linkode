<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","作品浏览"); %>
<% request.setAttribute("headType","portfolio"); %>
<%@ include file="../modules/web-header.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/explore.css">
</head>
<body>
<%@ include file="../modules/header.jsp"%>
	<div class="type-list">
		<a class="type-btn" id="all" href="${pageContext.request.contextPath}/portfolio">所有作品</a>
		<a class="type-btn" id="literature" href="${pageContext.request.contextPath}/portfolio?type=literature">文章</a>
		<a class="type-btn" id="image" href="${pageContext.request.contextPath}/portfolio?type=image">平面</a>
		<a class="type-btn" id="video" href="${pageContext.request.contextPath}/portfolio?type=video">视频</a>
		<a class="type-btn more-margin-left" id="my" href="${pageContext.request.contextPath}/portfolio/mine">我的作品</a>
		<a class="type-btn" id="create" href="${pageContext.request.contextPath}/portfolio/create">发布作品</a>
	</div>
	
	<div class="display bigger">
		<c:forEach items="${model}" var="pvm">
		<div class="display-card">
		
			<c:if test="${pvm.type == 'literature'}">
			<div class=" ran-${pvm.id%3} display-text">
				${pvm.content}
			</div>
			</c:if>
			<c:if test="${pvm.type != 'literature'}">
			<img class="display-img" src="${pageContext.request.contextPath}/static/img/pic-${pvm.id%10+1}.png"/>
			</c:if>
			
			<p class="card-name">${pvm.title}</p>
			<span class="card-info">
				<img class="avatar size-15" class="avatar" src="${pageContext.request.contextPath}/static/img/avatar-${pvm.userId%6+1}.jpg" />
				${pvm.username}
			</span>
			<a class="card-over" href="${pageContext.request.contextPath}/portfolio/${pvm.id}"></a>
		</div>
		</c:forEach>
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
}); 
</script>
<%@ include  file="../modules/web-footer.jsp"%>