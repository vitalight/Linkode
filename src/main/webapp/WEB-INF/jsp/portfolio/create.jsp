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
		<a class="type-btn type-chose" id="create" href="${pageContext.request.contextPath}/portfolio/create">发布作品</a>
	</div>
	
	<div class="display">
		<form action="${pageContext.request.contextPath}/portfolio/create" method="post" enctype="multipart/form-data">
			<div class="display-bar more-padding auto-height">
				<div class="row">
						<div class="col-sm-4">
							作品名称：<input class="form-control" type="text" name="title" required/>
						</div>
						<div class="col-sm-4 col-sm-offset-1">
							作品类别:
							<select class="form-control" name="type" required>
								<option value=""></option>
								<option value="image">平面</option>
								<option value="video">视频</option>
								<option value="literature">文学</option>
							</select>
						</div>
				</div><br/><br/>
				<div class="row">
					<div class="col-sm-12">
						作品介绍：<textarea name="content" class="form-control requirement" maxlength="290" name="requirement" required></textarea>
					</div>
				</div>
				<br/>
				<input type="file" name="file" required/>
				<button type="submit" class="col-sm-2 col-sm-offset-10 contract-btn">发布项目</button>
			</div>
		</form>
	</div>

<%@ include  file="../modules/javascript.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/jquery.md5.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/form-validate.js"></script>
<%@ include  file="../modules/web-footer.jsp"%>