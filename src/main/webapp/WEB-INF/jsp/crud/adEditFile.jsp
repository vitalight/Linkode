<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","编辑广告"); %>
<% request.setAttribute("headType","admin"); %>
<%@ include file="../modules/web-header.jsp"%>
</head>
<body>
<%@ include file="../modules/header.jsp"%>
	
	<div class="margin-bottom display-sheet margin-top">
		<div class="sheet-content">
			<div class="row">
				<h1>编辑文件</h1>
			</div>
			<div class="row content-text">
				<img class="small-pic" src="${pageContext.request.contextPath}/file/ad/${id}" />
				<br/>
				<form action="${pageContext.request.contextPath}/ad/${id}/editFile" method="post" enctype="multipart/form-data">
					<input type="file" name="file" required/>
					<button type="submit" class="col-sm-2 col-sm-offset-10 contract-btn">提交修改</button>
				</form>
			</div>
		</div>
	</div>

<%@ include  file="../modules/javascript.jsp"%>
<%@ include  file="../modules/web-footer.jsp"%>