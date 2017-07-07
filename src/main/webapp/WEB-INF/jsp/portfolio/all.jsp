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
		<a class="type-btn more-margin-left" id="my" href="${pageContext.request.contextPath}/portfolio?type=my">我的作品</a>
		<a class="type-btn" id="create" href="${pageContext.request.contextPath}/portfolio?type=create">发布作品</a>
	</div>
	
	<div class="display bigger">
		<%for (int i=0;i<3;i++) {%>
		<div class="display-card">
			<div class=" ran-<%=i%3%> display-text">
				少年听雨歌楼上，红烛昏罗帐。壮年听雨客舟中，江阔云低，断雁叫西风。
				而今听雨僧庐下，鬓已星星也。悲欢离合总无情，一任阶前，点滴到天明。
			</div>
			<p class="card-name">文章示范</p>
			<span class="card-info">
				达芬奇
			</span>
		</div>
		<%}
		for (int i=0;i<20;i++) { %>
		<div class="display-card">
			<img class="display-img" src="${pageContext.request.contextPath}/static/img/pic-<%=i%10+1%>.png"/>
			<p class="card-name">苟利国家</p>
			<p class="card-info">某位学长</p>
		</div>
		<% } %>
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