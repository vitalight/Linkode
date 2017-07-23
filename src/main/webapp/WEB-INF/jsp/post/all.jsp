<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","讨论区"); %>
<% request.setAttribute("headType","post"); %>
<%@ include file="../modules/web-header.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/explore.css">
</head>
<body>
<%@ include file="../modules/header.jsp"%>
	<div class="margin-top margin-bottom display-sheet">
		<div class="sheet-content">
			<div class="row">
				<h1 class="special">讨论区</h1>
			</div>
			<div class="type-list special">
				<a class="type-btn" id="all" href="${pageContext.request.contextPath}/post">所有帖子</a>
				<a class="type-btn" id="mine" href="${pageContext.request.contextPath}/post/mine">我的帖子</a>
				<a class="type-btn" id="myComment" href="${pageContext.request.contextPath}/post/myComment">我回复的帖子</a>
				<a class="type-btn" id="create" href="${pageContext.request.contextPath}/post/create">发布帖子</a>
			</div>
			<br/>
			
			<c:forEach items="${model}" var="post">
			<div class="row post-line">
				<div class="col-sm-8">
					<span class="tag ran-0">精品</span>${post.title}
				</div>
				<div class="col-sm-2 poster-info">
					<span class="glyphicon glyphicon-user"></span>
					${post.username} &nbsp &nbsp
				</div>
				<div class="col-sm-2 poster-info">
					<span class="glyphicon glyphicon-comment"></span>
					?
				</div>
				<a class="card-over" href="${pageContext.request.contextPath}/post/${post.id}"></a>
			</div>
			</c:forEach>
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
}); 
</script>
<%@ include  file="../modules/web-footer.jsp"%>