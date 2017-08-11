<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","发布帖子"); %>
<% request.setAttribute("headType","post"); %>
<%@ include file="../modules/web-header.jsp"%>
</head>
<body>
<%@ include file="../modules/header.jsp"%>
	<div class="margin-top margin-bottom display-sheet">
		<div class="sheet-content">
			<div class="row">
				<h1 class="special">${model.title}
				
				<c:if test="${LOGIN_USER_ROLE == 'admin' || LOGIN_USER_ID == model.userId}">
				<a class="edit-link" href="${pageContext.request.contextPath}/post/delete/${model.id}">删除帖子</a>
				</c:if>
				</h1>
			</div>
			<br/>
			
			<div class="row content-text">
				<div class="cmt-line post-special">
					<div class="row">
						<a class="img-a" href="${pageContext.request.contextPath}/user/${model.userId}">
						<img class="avatar col-sm-1" src="${pageContext.request.contextPath}/static/img/avatar/avatar-${model.userId%7}.jpg" />
						</a>
						<div class="col-sm-9">
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${model.time}" var="time" />
							
							
							<div class="cmt-name">
								<a href="${pageContext.request.contextPath}/user/${model.userId}">
									${model.username}
								</a>
								<span class="cmt-tag ran-2">楼主</span><span class="cmt-time">${time}</span>
							</div>
							<div class="cmt-content">${model.content}</div>
						</div>
					</div>
				</div>
				<c:forEach items="${cmts}" var="cmt">
				<div class="cmt-line post-special">
					<div class="row">
						
						<a class="img-a" href="${pageContext.request.contextPath}/user/${cmt.userId}">
						<img class="avatar col-sm-1" src="${pageContext.request.contextPath}/static/img/avatar/avatar-${cmt.userId%7}.jpg" />
						</a>
						<div class="col-sm-7">
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${cmt.time}" var="time" />
							<div class="cmt-name">
								<a href="${pageContext.request.contextPath}/user/${cmt.userId}">
									${cmt.username}
								</a>
								<span class="cmt-time">${time}</span>
							</div>
							<div class="cmt-content">${cmt.content}</div>
						</div>
						
						<c:if test="${LOGIN_USER_ROLE == 'admin' || LOGIN_USER_ID == cmt.userId}">
						<a class="col-sm-2 hollow-btn hollow-red" href="${pageContext.request.contextPath}/post/comment/delete/${cmt.id}">删除</a>
						</c:if>
						<a class="col-sm-2 hollow-btn cmt-btn" id="${cmt.id}">回复</a>
					</div>
					
					<div class="floor-cmt row">
						<c:forEach items="${cmtCmts[cmt.id]}" var="cmtCmt">
							<div class="cmt-line">
								<div class="row">
									<a class="img-a" href="${pageContext.request.contextPath}/user/${cmtCmt.userId}">
									<img class="avatar col-sm-1" src="${pageContext.request.contextPath}/static/img/avatar/avatar-${cmtCmt.userId%7 }.jpg" />
									</a>
									<div class="col-sm-11">
										<div class="cmt-name">
											
											<a class="img-a" href="${pageContext.request.contextPath}/user/${cmtCmt.userId}">
											${cmtCmt.username}
											</a>
											<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${cmtCmt.time}" var="time" />
											<span class="cmt-time">${time}</span>
											
											<c:if test="${LOGIN_USER_ROLE == 'admin' || LOGIN_USER_ID == cmtCmt.userId}">
											<a class="a-text" href="${pageContext.request.contextPath}/post/comment/delete/${cmtCmt.id}">删除</a>
											</c:if>
										</div>
										<div class="cmt-content">${cmtCmt.content}</div>
									</div>
								</div>
							</div>
						</c:forEach>
						<form id="form-${cmt.id}" action="${pageContext.request.contextPath}/post/comment/${cmt.id}/comment" method="post" style="display:none">
							<br/>
							<textarea name="content" class="form-control requirement" placeholder="评论" maxlength="90" required></textarea>
							<br/>
							<div class="row">
								<button class="blue-btn col-sm-2 col-sm-offset-5">发送评论</button>
							</div>
							<br/>
						</form>
					</div>
				</div>
				</c:forEach>
				
				<br/>
				<form action="${pageContext.request.contextPath}/post/${model.id}/comment" method="post">
					<textarea name="content" class="form-control requirement" placeholder="评论" maxlength="90" required></textarea>
					<br/>
					<div class="row">
						<button class="blue-btn col-sm-2 col-sm-offset-5">发送评论</button>
					</div>
				</form>
			</div>
		</div>
	</div>

<%@ include  file="../modules/javascript.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	$(".cmt-btn").click(function(){
		var id = $(this).attr("id");
		$("#form-"+id).slideToggle();
	});
}); 
</script>
<%@ include  file="../modules/web-footer.jsp"%>