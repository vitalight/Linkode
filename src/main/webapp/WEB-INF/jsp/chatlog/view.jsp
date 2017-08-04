<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","对话"); %>
<% request.setAttribute("headType","user"); %>
<%@ include file="../modules/web-header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/pintuer.css">

</head>
<body>
<%@ include file="../modules/header.jsp"%>
	
	<c:set var="field" value="${field}" />
	<div class="chat-panel">
        <div class="message-panel">
        	<div class="chat-entry" style="height:auto;border-bottom:none;">
                <span class="chatter-img"><img src="${pageContext.request.contextPath}/static/img/avatar/avatar-${model.senderId % 7}.jpg" class="radius-circle" width="50" height="50"/></span>
                <div class="chat-label">
                	<c:if test="${LOGIN_USER_ID != model.senderId}">
                    	<a href="${pageContext.request.contextPath}/user/${model.senderId}"><span class="chatter-name">${model.senderName}</span></a>
                    </c:if>
                    <c:if test="${LOGIN_USER_ID == model.senderId}">
                    	<a href="${pageContext.request.contextPath}/user/${model.senderId}"><span class="chatter-name" style="color:black;">我</span></a>
                    </c:if>
                    <span class="chat-time"><fmt:formatDate type="both" value="${model.time}"></fmt:formatDate></span>
                </div>
                <div class="chat-content" style="width:600px;">
                		${model.content}
                </div>
            </div>
            <div class="line-group">
				<hr class="bg-gray">
				<a href="${pageContext.request.contextPath}/chat/${LOGIN_USER_ID}/${id}"><span class="icon-reply line-icon"> 返回</span></a>
				<hr class="bg-gray">
			</div>
    	</div>
	</div>
	
	
	

<%@ include  file="../modules/javascript.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/jquery.md5.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/form-validate.js"></script>

<%@ include  file="../modules/web-footer.jsp"%>