<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","项目信息"); %>
<% request.setAttribute("headType","project"); %>
<%@ include file="../modules/web-header.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/explore.css">
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
				
				
				<c:if test="${model.status=='confirm' }">
					<br/>
					<a class="blue-btn col-sm-2 col-sm-offset-5">项目已完结</a>
					<br/>
					<br/>
				</c:if>
				
				<c:if test="${LOGIN_USER_ID==model.posterId}">
					<br/>
					<c:if test="${model.status!='confirm' }">
						<a class="blue-btn col-sm-2 col-sm-offset-5" href="${pageContext.request.contextPath}/project/${model.id}/confirm">确认完成</a>	
						<br/>
						<br/>
					</c:if>
				</c:if>
				
				<h3>提交(${commits.size()})</h3>
				<c:if test="${ model.status!='confirm' && LOGIN_USER_ID!=model.posterId}">
				<form action="${pageContext.request.contextPath}/project/${model.id}/commit" method="post">
					<textarea name="content" class="form-control requirement" placeholder="正文" maxlength="90" name="content" required></textarea>
					<br/>
					<div class="row">
						<button class="blue-btn col-sm-2 col-sm-offset-5">提交</button>
					</div>
				</form>
				<br/>
				</c:if>
				
				<c:forEach items="${commits}" var="commit">
				<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${commit.time}" var="time" />
				
				<div class="cmt-line row">
					<img class="avatar col-sm-1" src="${pageContext.request.contextPath}/static/img/avatar/avatar-${user.id%7}.jpg" />
					<div class="col-sm-7">
						<div class="cmt-name">${user.username}<span class="cmt-time">${time}</span></div>
						<div class="cmt-content">${commit.content }</div>
					</div>
					<c:choose>
						<c:when test="${LOGIN_USER_ID==user.id}">
							<c:choose>
							<c:when test="${commit.result==null}">
								<a class="col-sm-offset-2 col-sm-2 hollow-btn hollow-grey">
									待处理
								</a>
							</c:when>
							<c:when test="${commit.result=='accept' }">
								<a class="col-sm-offset-2 col-sm-2 hollow-btn">
									审核通过
								</a>
							</c:when>
							<c:otherwise>
								<a class="col-sm-offset-2 col-sm-2 hollow-btn hollow-red">
									审核失败
								</a>
							</c:otherwise>
							</c:choose>
						</c:when>
						<c:when test="${LOGIN_USER_ID==model.posterId}">
						<c:choose>
							<c:when test="${commit.result==null}">
								<a class="col-sm-2 hollow-btn" href="${pageContext.request.contextPath}/project/commit/${commit.id}/accept">通过</a>
								<a class="col-sm-2 hollow-btn hollow-red" href="${pageContext.request.contextPath}/project/commit/${commit.id}/reject">拒绝</a>
							</c:when>
							<c:when test="${commit.result=='accept'}">
								<a class="col-sm-offset-2 col-sm-2 hollow-btn">审核通过</a>
							</c:when>
							<c:otherwise>
								<a class="col-sm-offset-2 col-sm-2 hollow-btn hollow-red">审核失败</a>
							</c:otherwise>
						</c:choose>
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