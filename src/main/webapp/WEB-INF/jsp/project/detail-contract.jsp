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
				
				<c:if test="${LOGIN_USER_ROLE == 'admin' || LOGIN_USER_ID == model.posterId}">
				<a class="edit-link" href="${pageContext.request.contextPath}/project/delete/${model.id}">删除项目</a>
				<a class="edit-link" href="${pageContext.request.contextPath}/project/update/${model.id}">编辑项目</a>
				</c:if>
				</h1>
			</div>
			
			<!-- 蓝色信息栏 -->
			<div class="content-info row">
				<div class="info-left col-sm-2">
					信息
				</div>
				<div class="info-right col-sm-10">
					<fmt:formatDate pattern="yyyy年MM月dd日" value="${model.startDate}" var="time"/>
					<a href="${pageContext.request.contextPath}/user/${model.posterId}">
					<img class="avatar size-mid" src="${pageContext.request.contextPath}/static/img/avatar/avatar-${model.posterId%7}.jpg" />
					${model.username}</a> 发布于 ${time}，已被
					<a href="${pageContext.request.contextPath}/user/${user.id}">
					<img class="avatar size-mid" src="${pageContext.request.contextPath}/static/img/avatar/avatar-${user.id%7}.jpg" />
					${user.username}</a>承包。
				</div>
			</div>
			
			<div class="row content-text">
				${model.requirement }
				<!-- 项目状态按钮 -->
				<c:if test="${model.status=='confirm' }">
					<br/>
					<a class="grey-btn col-sm-2 col-sm-offset-5">项目已完结</a>
					<br/>
					<br/>
				</c:if>
				
				<c:if test="${LOGIN_USER_ID==model.posterId}">
					<br/>
					<c:if test="${model.status!='confirm' }">
							<button id="confirm" class="blue-btn col-sm-2 col-sm-offset-5" href="javascript:;">确认完成</button>
						<br/>
						<br/>
					</c:if>
				</c:if>
				
				<!-- 完结后的甲方评价 -->
				<c:if test="${model.status=='confirm'}">
				<h3>甲方评价</h3>
				<div class="cmt-line row">
					<img class="avatar col-sm-1" src="${pageContext.request.contextPath}/static/img/avatar/avatar-${model.posterId%7}.jpg" />
					<div class="col-sm-7">
						<div class="cmt-name">${model.username}
							<span class="cmt-time">
								<c:forEach begin="1" end="${rating.rating}" var="i">
									<i class="fa fa-star" aria-hidden="true"></i>
								</c:forEach>
								
								<c:forEach begin="${rating.rating}" end="4" var="i">
									<i class="fa fa-star-o" aria-hidden="true"></i>
								</c:forEach>
							</span>
						</div>
						<div class="cmt-content">
							<c:if test="${rating == null}">
							暂无评价
							</c:if>
							${rating.content }
						</div>
					</div>
				</div>
				</c:if>
				
				<!-- 项目成果提交 -->
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
				<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${commit.time}" var="time" />
				
				<!-- 提交历史记录 -->
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
	
	<div class="modal fade" id="modal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
					</button>
					<h4 class="modal-title" id="modalTitle">项目完结</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-12">
							<form role="form" id="form-rate">
								<div class="form-group">
									<label>评分</label><span id="rating-error" hidden="hidden">(评分需为0-5之间整数)</span>
									<input class="form-control" name="rating" type="number" min="0" max="5" step="1"/>
									<label>评价</label>
									<input name="content" class="form-control" placeholder="(选填)" maxlength="90" />
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
<script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#confirm").click(function(e) {
		$("#rating-error").hide();
		$('#modal').modal('show');
	});
	
	$("#save").click(function(e) {
		var rating = $("input[name='rating']").val();
		var content = $("input[name='content']").val();
		var url= "/Linkode/project/${model.id}/confirm";
		var ex = /^\d+$/;// 检验整数
		if (rating<0 | rating>5 | rating=="" | !ex.test(rating)) {
			$("#rating-error").show();
			return false;
		}
		
		jQuery.ajax({
			type:"POST",
		    url:url,
			processData : true,
			dataType : "text",
			data : {
				rating : rating,
				content : content,
			},
			complete : function(data) {
				bootbox.alert({
					message : '项目已完成',
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