<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","我承包的项目"); %>
<% request.setAttribute("headType","project"); %>
<%@ include file="../modules/web-header.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/explore.css">
</head>
<body>
<%@ include file="../modules/header.jsp"%>
	<%  
	String typeStr = request.getParameter("type");
	String[] classes = {"", "", "", ""};
	if (typeStr!=null) {
		int type = Integer.parseInt(typeStr);
		classes[type]="type-chose";
	} else {
		classes[0]="type-chose";
	}
	%>
	<div class="type-list">
		<a class="type-btn " href="${pageContext.request.contextPath}/project/explore">所有项目</a>
		<a class="type-btn " href="${pageContext.request.contextPath}/project/myProject">我发布的项目</a>
		<a class="type-btn " href="${pageContext.request.contextPath}/project/myContract">我承包的项目</a>
		<a class="type-btn type-chose" href="${pageContext.request.contextPath}/project/publish">发布项目</a>
	</div>
	
	
	<div class="display">
		<form action="${pageContext.request.contextPath}/project/publish" method="post">
			<div class="display-bar more-padding">
				<div class="row">
						<input type="hidden" name="posterId" value="${LOGIN_USER_ID}"/>
						<div class="col-sm-4">
							项目名称：<input class="form-control" type="text" name="title"/>
						</div>
						<div class="col-sm-4 col-sm-offset-1">
							项目类别:
							<select class="form-control" name="type">
								<option value=""></option>
								<option value="image">平面</option>
								<option value="video">视频</option>
								<option value="music">音乐</option>
							</select>
						</div>
				</div><br/>
				<div class="row">
					<div class="col-sm-4">
						酬金：<input class="form-control" type="text" name="money"/>
					</div>
					<div class="col-sm-4 col-sm-offset-1">
						截止日期:<input class="form-control" type="date" name="time"/>
					</div>
				</div><br/><br/>
				<div class="row">
					<div class="col-sm-12">
						具体要求：<textarea class="form-control requirement" name="requirement"></textarea>
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