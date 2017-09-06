<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","对话"); %>
<% request.setAttribute("headType","user"); %>
<%@ include file="../modules/web-header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body>
<%@ include file="../modules/header.jsp"%>

	<div class="margin-top display-sheet chat">
		<div class="sheet-content ">
			
			<div class="row">
				<h1>与${user.username}聊天
				<a class="edit-link" href="${pageContext.request.contextPath}/user/${id1}?type=chatlog">返回私信箱</a>
				</h1>
			</div>
			
			<div class="cmt-line row chat-window" id="js-placeholder">
			</div>
			
			<br/>
			
			<div class="content-text">
				<form action="${pageContext.request.contextPath}/chat/${id1}/${id2}" method="post">
					<c:if test="${id2!=0}">
					<textarea name="message" class="form-control requirement" maxlength="90" name="requirement" required></textarea>
					<br/>
					<div class="row">
						<button class="blue-btn col-sm-2 col-sm-offset-5">发送</button>
					</div>
					</c:if>
					
					
					<c:if test="${id2==0}">
					<textarea name="message" class="form-control requirement" maxlength="90" name="requirement" disabled></textarea>
					<br/>
					<div class="row">
						<button class="blue-btn col-sm-2 col-sm-offset-5" disabled>发送</button>
					</div>
					</c:if>
					
				</form>
			</div>
		</div>
	</div>

<%@ include  file="../modules/javascript.jsp"%>
<script>
$(document).ready(function() {
	// 每2秒自动刷新一次 实现即时聊天
	refresh();
	setInterval(refresh,2000);
	function refresh(){
		var height = $('.chat-window')[0].scrollHeight;
		$("#js-placeholder").load("${pageContext.request.contextPath}/chat/content/${id1}/${id2}", function() {
			if (height < $('.chat-window')[0].scrollHeight) {
				$('.chat-window').scrollTop($('.chat-window')[0].scrollHeight);
			}
		});
	};
});
</script>
<%@ include  file="../modules/web-footer.jsp"%>