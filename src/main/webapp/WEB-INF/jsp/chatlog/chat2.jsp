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
		<div class="input-field">
        	<form action="${pageContext.request.contextPath}/chat/${id1}/${id2}" method="post">
            	<textarea class="input" cols="80" id="message" name="message" required></textarea>
                <div class="form-button">
                    <button type="submit" class="button">发送</button>
                </div>
            </form>
        </div>
        <hr class="divide-line">
        <div class="message-panel">
        	<!-- 这是第一种私聊模式，回帖式 -->
        	<!--
        	<c:forEach items="${model}" var="chatlog">
        		<div class="chat-entry">
                	<span class="chatter-img"><img src="${pageContext.request.contextPath}/static/img/face-${chatlog.senderId % 4}.jpg" class="radius-circle" width="50" height="50"/></span>
                	<div class="chat-label">
                		<c:if test="${LOGIN_USER_ID != chatlog.senderId}">
                    		<a href="${pageContext.request.contextPath}/user/${chatlog.senderId}"><span class="chatter-name">${chatlog.senderName}</span></a>
                    	</c:if>
                    	<c:if test="${LOGIN_USER_ID == chatlog.senderId}">
                    		<a href="${pageContext.request.contextPath}/user/${chatlog.senderId}"><span class="chatter-name" style="color:black;">我</span></a>
                    	</c:if>
                    	<span class="chat-time"><fmt:formatDate type="both" value="${chatlog.time}"></fmt:formatDate></span>
                	</div>
                	<div class="chat-content">
                		<c:if test="${fn:length(chatlog.content)>35}">
                		${fn:substring(chatlog.content,0,35)}...
                		</c:if>
                		<c:if test="${fn:length(chatlog.content)<=35}">
                			${chatlog.content}
                		</c:if>
                	</div>
                	<div class="chat-option">
                		<span class="option-btn"><a href="${pageContext.request.contextPath}/chat/view/${LOGIN_USER_ID}/${chatlog.id}"><span class="icon-edit"> 查看</span></a></span>
                    	<span class="option-btn"><a href="${pageContext.request.contextPath}/chat/delete/${LOGIN_USER_ID}/${chatlog.id}"><span class="icon-trash-o"> 删除</span></a></span>
                	</div>
            	</div>
        	</c:forEach>
        	-->
        	
        	
        	<!-- 这是第二种私聊模式，QQ式 -->
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
                	<a href="${pageContext.request.contextPath}/chat/delete/${LOGIN_USER_ID}/${chat.id}"><span class="icon-trash-o"> 删除</span></a>
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
                	<a href=""><span class="icon-trash-o"> 删除</span></a>
                </div>
            </div>
            </c:if>
        </c:forEach>
    	</div>
	</div>
	
	
	

<%@ include  file="../modules/javascript.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/jquery.md5.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/form-validate.js"></script>

<%@ include  file="../modules/web-footer.jsp"%>