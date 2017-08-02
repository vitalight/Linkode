<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","项目信息"); %>
<% request.setAttribute("headType","project"); %>
<%@ include file="../modules/web-header.jsp"%>
</head>
<body>
<%@ include file="../modules/header.jsp"%>
	
	<div class="margin-bottom margin-top display-sheet">
		<div class="sheet-content">
			<div class="row">
				<h1>${model.title}
				<a class="edit-link" href="${pageContext.request.contextPath}/project/delete/${model.id}">删除项目</a>
				<a class="edit-link" href="${pageContext.request.contextPath}/project/update/${model.id}">编辑项目</a>
				</h1>
			</div>
			
			<div class="content-info row">
				<div class="info-left col-sm-2">
					发布者
				</div>
				<div class="info-right col-sm-10">
					${model.username}
				</div>
			</div>
			
			<div class="row content-text">
				
				${model.requirement }
				
				<h3>报名(${apps.size()})</h3>
				<c:if test="${ hasApplied==0 }">
				<form action="${pageContext.request.contextPath}/project/${model.id}/application" method="post">
					<textarea name="content" class="form-control requirement" placeholder="正文" maxlength="90" name="content" required></textarea>
					<br/>
					<div class="row">
						<button class="blue-btn col-sm-2 col-sm-offset-5">发送申请</button>
					</div>
				</form>
				<br/>
				</c:if>
				<c:forEach items="${apps}" var="app">
				<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${app.time}" var="time" />
				
				<div class="cmt-line row">
					<img class="avatar col-sm-1" src="${pageContext.request.contextPath}/static/img/avatar/avatar-${app.applicantId%7}.jpg" />
					<div class="col-sm-7">
						<div class="cmt-name">${app.username}<span class="cmt-time">${time}</span></div>
						<div class="cmt-content">${app.content }</div>
					</div>
					<c:choose>
						<c:when test="${app.result!=null}">
						<a class="col-sm-offset-2 col-sm-2 hollow-btn hollow-grey">被拒绝</a>
						</c:when>
						<c:when test="${LOGIN_USER_ID==app.applicantId}">
						<a class="col-sm-offset-2 col-sm-2 hollow-btn hollow-red" href="${pageContext.request.contextPath}/project/apply/${app.id}/delete">取消申请</a>
						<a class="col-sm-offset-2 col-sm-2 hollow-btn">待处理</a>
						</c:when>
						<c:when test="${LOGIN_USER_ID==model.posterId}">
						<a class="col-sm-2 hollow-btn" href="${pageContext.request.contextPath}/project/apply/${app.id}/accept">通过</a>
						<a class="col-sm-2 hollow-btn hollow-red" href="${pageContext.request.contextPath}/project/apply/${app.id}/reject">拒绝</a>
						</c:when>
					</c:choose>
				</div>
				</c:forEach>
			</div>
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