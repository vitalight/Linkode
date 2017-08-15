<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","发帖"); %>
<% request.setAttribute("headType","post"); %>
<%@ include file="../modules/web-header.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/explore.css">
</head>
<body>
<%@ include file="../modules/header.jsp"%>
	
	<div class="margin-top margin-bottom display-sheet">
		<form action="${pageContext.request.contextPath}/post/create" method="post">
			<div class="sheet-content">
				<div class="row">
					<h1 class="special">讨论区</h1>
				</div>
				<div class="type-list special">
					<a class="type-btn" id="all" href="${pageContext.request.contextPath}/post">所有帖子</a>
					<a class="type-btn" id="mine" href="${pageContext.request.contextPath}/post/mine">我的帖子</a>
					<a class="type-btn" id="myComment" href="${pageContext.request.contextPath}/post/myComment">我回复的帖子</a>
					<a class="type-btn type-chose" id="create" href="${pageContext.request.contextPath}/post/create">发布帖子</a>
				</div>
				<br/>
				<div class="row">
					<div class="col-sm-4">
						帖子标题：<input class="form-control" type="text" name="title" required/>
					</div>
				</div><br/><br/>
				<div class="row">
					<div class="col-sm-12">
						帖子内容：<textarea name="content" class="form-control requirement" maxlength="50" name="requirement" required></textarea>
					</div>
				</div>
				<br/>
				<button type="submit" class="col-sm-2 col-sm-offset-10 contract-btn">发贴</button>
				<br/>
			</div>
		</form>
	</div>

<%@ include  file="../modules/javascript.jsp"%>
<%@ include  file="../modules/web-footer.jsp"%>