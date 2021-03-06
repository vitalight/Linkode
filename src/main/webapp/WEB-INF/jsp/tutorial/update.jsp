<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","编辑教程"); %>
<% request.setAttribute("headType","tutorial"); %>
<%@ include file="../modules/web-header.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/explore.css">
</head>
<body>
<%@ include file="../modules/header.jsp"%>
	
	<div class="margin-top margin-bottom display-sheet">
		<div class="sheet-content">
			<form action="${pageContext.request.contextPath}/tutorial/update/${model.id}" method="post">
				<div class="row">
					<h1>
						教程编辑
						<button class="edit-btn">保存</button>
						<a class="edit-btn" href="${pageContext.request.contextPath}/tutorial/${model.id}">取消编辑</a>
					</h1>
				</div>
				<input name="id" value="${model.id}" hidden/>
				<h3 class="input-title">标题</h3>
				<input class="form-control my-input" name="type" value="${model.type}"/>
				<h3 class="input-title">正文</h3>
				<textarea class="form-control my-textarea" id="editor1" name="content">
${model.content}
				</textarea>
			</form>
			<ckeditor:replace replace="editor1" basePath="/ckeditor/" />
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