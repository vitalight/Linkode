<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","发帖"); %>
<% request.setAttribute("headType","portfolio"); %>
<%@ include file="../modules/web-header.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/explore.css">
</head>
<body>
<%@ include file="../modules/header.jsp"%>
	
	<div class="margin-top margin-bottom display">
		<form action="${pageContext.request.contextPath}/post/create" method="post">
			<div class="display-bar more-padding create-bar">
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
			</div>
		</form>
	</div>

<%@ include  file="../modules/javascript.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/jquery.md5.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/form-validate.js"></script>
<%@ include  file="../modules/web-footer.jsp"%>