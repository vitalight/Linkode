<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","个人主页"); %>
<% request.setAttribute("headType","user"); %>
<%@ include file="../modules/web-header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/pintuer.css">
</head>
<body>
<%@ include file="../modules/header.jsp"%>
	<%@ include file="./userHeader.jsp" %>
	
	<div class="margin-bottom display-sheet sheet-special">
		<div class="sheet-content">
			<c:forEach items="${model}" var="chatlog">
        	<div class="chat-entry">
                <span class="chatter-img"><img src="${pageContext.request.contextPath}/static/img/avatar/avatar-${chatlog.senderId % 7}.jpg" class="radius-circle" width="50" height="50"/></span>
                <div class="chat-label">
                	<c:if test="${LOGIN_USER_ID != chatlog.senderId}">
                    	<a href="${pageContext.request.contextPath}/user/${chatlog.senderId}"><span class="chatter-name">${chatlog.senderName}</span></a>
                    </c:if>
                    <c:if test="${LOGIN_USER_ID == chatlog.senderId}">
                    	<a href="${pageContext.request.contextPath}/user/${chatlog.receiverId}"><span class="chatter-name" style="color:black;">${chatlog.receiverName}</span></a>
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
                	<c:if test="${LOGIN_USER_ID != chatlog.senderId}">
                		<span class="option-btn"><a href="${pageContext.request.contextPath}/chat/${LOGIN_USER_ID}/${chatlog.senderId}"><span class="icon-edit"> 查看</span></a></span>
                    	<span class="option-btn"><a href="${pageContext.request.contextPath}/user/${LOGIN_USER_ID}/chatlog/delete/${chatlog.senderId}"><span class="icon-trash-o"> 删除</span></a></span>
                    </c:if>
                    <c:if test="${LOGIN_USER_ID == chatlog.senderId}">
                		<span class="option-btn"><a href="${pageContext.request.contextPath}/chat/${LOGIN_USER_ID}/${chatlog.receiverId}"><span class="icon-edit"> 查看</span></a></span>
                    	<span class="option-btn"><a href="${pageContext.request.contextPath}/user/${LOGIN_USER_ID}/chatlog/delete/${chatlog.receiverId}"><span class="icon-trash-o"> 删除</span></a></span>
                    </c:if>
                </div>
            	</div>
        	</c:forEach>
		</div>
	</div>
	

<%@ include  file="../modules/javascript.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/jquery.md5.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/form-validate.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#chatlog").addClass("cute-btn-chose");
		})
	</script>

<%@ include  file="../modules/web-footer.jsp"%>