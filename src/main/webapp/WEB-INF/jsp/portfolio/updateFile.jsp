<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","发布作品"); %>
<% request.setAttribute("headType","portfolio"); %>
<%@ include file="../modules/web-header.jsp"%>
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
	
	<div class="margin-bottom display-sheet">
		<div class="sheet-content">
			<div class="row">
				<h1>编辑文件</h1>
			</div>
			<div class="row content-text">
				<img class="small-pic" src="${pageContext.request.contextPath}/file/portfolio/${id}" />
				<form action="${pageContext.request.contextPath}/portfolio/update/${id}/file" method="post" enctype="multipart/form-data">
					<input type="file" name="file" required/>
					<button type="submit" class="col-sm-2 col-sm-offset-10 contract-btn">提交修改</button>
				</form>
			</div>
		</div>
	</div>

<%@ include  file="../modules/javascript.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/jquery.md5.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/form-validate.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#update-${model.type}").attr("selected","selected"); 
}); 
</script>
<%@ include  file="../modules/web-footer.jsp"%>