<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","编辑广告"); %>
<% request.setAttribute("headType","admin"); %>
<%@ include file="../modules/web-header.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/explore.css">
</head>
<body>
<%@ include file="../modules/header.jsp"%>
	
	<div class="display margin-top">
		<form action="${pageContext.request.contextPath}/ad/${id}/edit" method="post">
			<div class="display-bar more-padding create-bar">
				<div class="row">
					<input class="form-control" name="id" value="${model.id}" type="hidden" />
					<div class="col-sm-4">
						广告标题：<input class="form-control" type="text" name="title" value="${model.title}" required/>
					</div>
					<div class="col-sm-4 col-sm-offset-2">
						广告网站：<input class="form-control" type="text" name="content" value="${model.content}" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4">
						<fmt:formatDate pattern="yyyy-MM-dd" value='${model.startDate}' var="time"/>
						开始日期：<input class="form-control" type="date" name="startDate" value="${time}" required/>
					</div>
					<div class="col-sm-4 col-sm-offset-2">
						<fmt:formatDate pattern="yyyy-MM-dd" value='${model.endDate}' var="time"/>
						截止日期：<input class="form-control" type="date" name="endDate" value="${time}" required/>
					</div>		
				</div>
				<br/>
				
				<a class="col-sm-4 col-sm-offset-1 contract-btn" href="${pageContext.request.contextPath}/admin">返回</a>
				<a class="col-sm-4 col-sm-offset-1 contract-btn" href="${pageContext.request.contextPath}/ad/${id}/delete">删除</a>
				<a class="col-sm-4 col-sm-offset-1 contract-btn" href="${pageContext.request.contextPath}/ad/${id}/editFile">修改图片</a>
				<button type="submit" class="col-sm-4 col-sm-offset-1 contract-btn">保存修改</button>
			</div>
		</form>
	</div>

<%@ include  file="../modules/javascript.jsp"%>
<%@ include  file="../modules/web-footer.jsp"%>