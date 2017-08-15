<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","项目"); %>
<% request.setAttribute("headType","project"); %>
<%@ include file="../modules/web-header.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/explore.css">
</head>
<body>
<%@ include file="../modules/header.jsp"%>
	<div class="type-list">
		<a class="type-btn" id="all" href="${pageContext.request.contextPath}/project">可接项目</a>
		<a class="type-btn" id="myProject" href="${pageContext.request.contextPath}/project/myProject">我发布的项目</a>
		<a class="type-btn" id="myContract" href="${pageContext.request.contextPath}/project/myContract">我承包的项目</a>
		<a class="type-btn" id="myApplication" href="${pageContext.request.contextPath}/project/myApplication">我申请的项目</a>
		<a class="type-btn type-chose" href="${pageContext.request.contextPath}/project/create">发布项目</a>
	</div>
	
	<div class="display">
		<form action="${pageContext.request.contextPath}/project/create" method="post">
			<div class="display-bar more-padding create-bar">
				<div class="row">
						<div class="col-sm-4">
							项目名称：<input class="form-control" type="text" name="title" required/>
						</div>
						<div class="col-sm-4 col-sm-offset-1">
							项目类别:
							<select class="form-control" name="type" required>
								<option value=""></option>
								<option value="image">平面</option>
								<option value="video">视频</option>
								<option value="music">音乐</option>
								<option value="literature">文学</option>
							</select>
						</div>
				</div><br/>
				<div class="row">
					<div class="col-sm-4" >
						酬金：<input class="form-control" type="number" step="1" name="money" required/>
					</div>
					<div class="col-sm-4 col-sm-offset-1">
						截止日期:<input class="form-control" type="date" name="endDate" required/>
					</div>
				</div><br/><br/>
				<div class="row">
					<div class="col-sm-12">
						具体要求：<textarea class="form-control requirement" maxlength="190" name="requirement" required></textarea>
					</div>
				</div>
				<br/>
				<button type="submit" class="col-sm-2 col-sm-offset-10 contract-btn">发布项目</button>
			</div>
		</form>
	</div>

<%@ include  file="../modules/javascript.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/jquery.md5.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/form-validate.js"></script>
<%@ include  file="../modules/web-footer.jsp"%>