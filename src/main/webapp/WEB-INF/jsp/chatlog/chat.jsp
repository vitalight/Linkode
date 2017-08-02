<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","对话"); %>
<% request.setAttribute("headType","user"); %>
<%@ include file="../modules/web-header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/pintuer.css">
</head>
<body>
<%@ include file="../modules/header.jsp"%>

	<div class="margin-top display-sheet">
		<div class="sheet-content">
			<div class="row">
				<h1>与${user.username}聊天</h1>
			</div>
			<div class="content-text">
				<form action="${pageContext.request.contextPath}" method="post">
					<textarea name="content" class="form-control requirement" maxlength="90" name="requirement" required></textarea>
					<br/>
					<div class="row">
						<button class="blue-btn col-sm-2 col-sm-offset-5">发送</button>
					</div>
				</form>
			</div>
			<br/>
			<div class="cmt-line row">
				<c:forEach items="${model}" var="chat">
		        	<c:if test="${LOGIN_USER_ID != chat.senderId}">
		        	<div class="left-frame">
		                <div class="left-img"><img src="${pageContext.request.contextPath}/static/img/avatar/avatar-${chat.senderId % 7}.jpg" class="radius-circle" width="30" height="30"></div>
		            	<div class="left-group">
		                	<div class="chat-arrow"></div>
		                	<div class="sup-arrow"></div>
		            	</div>
		            	<div class="frame">
		                	<span style="color:red;">${chat.senderName}：</span>${chat.content}
		            	</div>
		                <div class="row">
		                	<span class="chat-time"><fmt:formatDate type="both" value="${chat.time}"></fmt:formatDate></span>
		                </div>
		            </div>
		            </c:if>
		            <c:if test="${LOGIN_USER_ID == chat.senderId}">
		            <div class="right-frame">
		                <div class="right-img"><img src="${pageContext.request.contextPath}/static/img/avatar/avatar-${chat.senderId % 7}.jpg" class="radius-circle" width="30" height="30"></div>
		            	<div class="right-group">
		                	<div class="chat-arrow"></div>
		                	<div class="sup-arrow"></div>
		            	</div>
		            	<div class="frame">
		                	<span style="color:red;">${chat.senderName}：</span>${chat.content}
		            		</div>
		                <div class="row">
		                	<span class="chat-time"><fmt:formatDate type="both" value="${chat.time}"></fmt:formatDate></span>
		                </div>
		            </div>
		            </c:if>
		        </c:forEach>
				
			</div>
		</div>
	</div>

<%@ include  file="../modules/javascript.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/jquery.md5.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/form-validate.js"></script>

<%@ include  file="../modules/web-footer.jsp"%>