<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","作品浏览"); %>
<% request.setAttribute("headType","portfolio"); %>
<%@ include file="../modules/web-header.jsp"%>
</head>
<body>
<%@ include file="../modules/header.jsp"%>
	
	<div class="margin-bottom margin-top display-sheet">
		<div class="sheet-content">
			<div class="row">
				<h1>${model.title}
				<span class="likes">
					<a id="js-like" class="${like}" href="javascript:;"><i class="fa fa-heart" aria-hidden="true"></i></a>
					<span id="number">${model.likes}</span>人觉得很赞
				</span>
				
				<c:if test="${LOGIN_USER_ID != model.userId}">
				<a class="edit-link" href="javascript:;" id="report">举报</a>
				</c:if>
				<c:if test="${LOGIN_USER_ID == model.userId || LOGIN_USER_ROLE == 'admin'}">
				<a class="edit-link" href="${pageContext.request.contextPath}/portfolio/delete/${model.id}">删除</a>
				<a class="edit-link" href="${pageContext.request.contextPath}/portfolio/update/${model.id}">编辑</a>
				</c:if>
				</h1>
			</div>
			<div class="content-info row">
				<div class="info-left col-sm-2">
					信息
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
				<img src="${pageContext.request.contextPath}/file/portfolio/${model.id}" />
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
						<div class="cmt-name">
							<a href="${pageContext.request.contextPath}/user/${cmt.userId}">
								${cmt.username}
							</a>
							<span class="cmt-time">${time}</span>
						</div>
						<div class="cmt-content">${cmt.content }</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<%-- 举报框 --%>
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
							<form role="form" id="form-rate">
								<div class="form-group">
									<label>举报类型</label>
									<select class="form-control" name="type" required>
										<option value="政治">政治</option>
										<option value="色情">色情</option>
										<option value="侮辱">侮辱</option>
										<option value="广告">广告</option>
									</select>
									<label>详细原因</label>
									<input name="content" class="form-control" placeholder="选填" maxlength="90" />
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
<script src="${pageContext.request.contextPath}/static/js/crud/bootbox.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#js-like").click(function() {
		var targetUrl = "${pageContext.request.contextPath}/portfolio/${model.id}/like";
		$.get(targetUrl,function(data,status){
			$("#js-like").toggleClass("hasLiked");
			$("#number").text(data);
		});
	});
	$("#report").click(function(e) {
		$('#modal').modal('show');
	});
	
	$("#save").click(function(e) {
		var type = $("select[name='type']").val();
		var content = $("input[name='content']").val();
		var url= "/Linkode/portfolio/report/${model.id}";
		
		jQuery.ajax({
			type:"POST",
		    url:url,
			processData : true,
			dataType : "text",
			data : {
				type : type,
				content : content,
			},
			complete : function(data) {
				bootbox.alert({
					message : '举报成功',
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