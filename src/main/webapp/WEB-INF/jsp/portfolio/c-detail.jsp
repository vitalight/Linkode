<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","作品浏览"); %>
<% request.setAttribute("headType","portfolio"); %>
<%@ include file="../modules/web-header.jsp"%>
<%@ include file="../modules/crud-header.jsp"%>
</head>
<body>
    <%@ include file="../modules/header.jsp"%>
	<c:set var="type" value="ad" />
	<div class="margin-bottom margin-top display-sheet">
		<div class="sheet-content">
			<div class="row">
				<h1>${model.title}
				
				<c:if test="${LOGIN_USER_ID == model.userId || LOGIN_USER_ROLE == 'admin'}">
				<a class="edit-link" href="${pageContext.request.contextPath}/portfolio/delete/${model.id}">删除作品</a>
				<a class="edit-link" href="${pageContext.request.contextPath}/portfolio/update/${model.id}">编辑作品</a>
				</c:if>
				<c:if test="${LOGIN_USER_ID !=model.userId && LOGIN_USER_ROLE != 'admin' }">
				<button class="btn btn-default" type="button" id="report">举报
				<i class="fa fa-plus"></i>
			    </button>
				</c:if>
				</h1>
			</div>
			<div class="content-info row">
				<div class="info-left col-sm-2">
					信息  ${LOGIN_USER_ID}
				</div>
				<div class="info-right col-sm-10">
					<fmt:formatDate pattern="yyyy年MM月dd日" value="${model.time}" var="time"/>
					<a href="${pageContext.request.contextPath}/user/${model.userId}">
					<img class="avatar size-mid" src="${pageContext.request.contextPath}/static/img/avatar/avatar-${model.userId}.jpg" />
					${model.username}</a> 发布于 ${time}
				</div>
			</div>
			<div class="row content-text">
			
				${model.content }
				<c:if test="${model.type!='literature'}">
				<img src="../static/img/pic/pic-${model.id%13}.png" />
				</c:if>
				
				<h3>评论(${model.comments})</h3>
				<form action="${pageContext.request.contextPath}/portfolio/${model.id}/comment" method="post">
					<textarea name="content" class="form-control requirement" placeholder="正文" maxlength="90" name="requirement" required></textarea>
					<br/>
					<div class="row">
						<button class="blue-btn col-sm-2 col-sm-offset-5">发送评论</button>
					</div>
				</form>
				<br/>
				<c:forEach items="${cmts}" var="cmt">
				<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${cmt.time}" var="time" />
				<div class="cmt-line row">
					<img class="avatar col-sm-1" src="${pageContext.request.contextPath}/static/img/avatar/avatar-${cmt.userId%7}.jpg" />
					<div class="col-sm-11">
						<div class="cmt-name">${cmt.username}<span class="cmt-time">${time}</span></div>
						<div class="cmt-content">${cmt.content }</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
   	<div class="modal fade" id="modal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
					</button>
					<h4 class="modal-title" id="modalTitle">举报</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-12">
							<form role="form">
								<input type="hidden" class="form-control" name="senderId" value="${LOGIN_USER_ID}" />
								<input type="hidden" class="form-control" name="itemId" value="${model.id}" />
								<input type="hidden" class="form-control" name="itemType" value="portfolio" />
								<div class="form-group">
									<label>举报理由</label>
									<input class="form-control" name="content" />
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="save">确定</button>
				</div>
			</div>
		</div>
	</div>

<%@ include  file="../modules/javascript.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/jquery.md5.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/form-validate.js"></script>
<%@ include file="../modules/crud-footer.jsp"%>

<script type="text/javascript">
$(function() {
	$("#report").click(function(e) {
		$('#modal').modal('show');
	});
	
	$("#save").click(function(e) {
		var senderId = $("input[name='senderId']").val();
		var content = "作品id: " + $("input[name='itemId']").val() + "<br/>举报理由: " +$("input[name='content']").val();
		var dataset = e.currentTarget.dataset;
		var rurl="/Linkode/chat/"+ $("input[name='senderId']").val()+"/0";
		
			jQuery.ajax({
				type:"POST",
			    url:rurl,
				processData : true,
				dataType : "text",
				data : {
					message : content,
				},
				complete : function(data) {
					bootbox.alert({
						message : '举报成功~',
						callback : function() {
							location.reload();
						}
					});
				}
			})
		$('#modal').modal('hide');
	});
});
</script>
<%@ include  file="../modules/web-footer.jsp"%>