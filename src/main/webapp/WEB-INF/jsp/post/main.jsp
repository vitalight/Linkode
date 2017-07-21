<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","作品浏览"); %>
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
				<a class="type-btn type-chose" href="">所有帖子</a>
				<a class="type-btn" href="">我的帖子</a>
				<a class="type-btn" href="">我回复的帖子</a>
				<a class="type-btn" href="">发布帖子</a>
				
			</div>
			<br/>
			<% for (int i=0; i<2; i++) {%>
			<div class="row post-line">
				<div class="col-sm-8">
					<span class="tag ran-0">精品</span>怎么写小学作文?
				</div>
				<div class="col-sm-2 poster-info">
					<span class="glyphicon glyphicon-user"></span>
					LadygaGa &nbsp &nbsp
				</div>
				<div class="col-sm-2 poster-info">
					<span class="glyphicon glyphicon-comment"></span>
					200
				</div>
				<a class="card-over" href="${pageContext.request.contextPath}/post/1"></a>
			</div>
			<%} %>
			
			<% for (int i=0; i<5; i++) {%>
			<div class="row post-line">
				<div class="col-sm-8">
					怎么写毕业论文
				</div>
				<div class="col-sm-2 poster-info">
					<span class="glyphicon glyphicon-user"></span>
					Alien &nbsp &nbsp
				</div>
				<div class="col-sm-2 poster-info">
					<span class="glyphicon glyphicon-comment"></span>
					5
				</div>
				<a class="card-over" href="${pageContext.request.contextPath}/post/1"></a>
			</div>
			<%} %>
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