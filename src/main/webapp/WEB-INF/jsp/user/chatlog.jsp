<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","个人主页"); %>
<% request.setAttribute("headType","user"); %>
<%@ include file="../modules/web-header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body>
<%@ include file="../modules/header.jsp"%>
	<%@ include file="./userHeader.jsp" %>
	
	<div class="margin-bottom margin-top display-sheet chatlog">
		<div class="sheet-content">
			<c:forEach items="${model}" var="chatlog">
			<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${chatlog.time}" var="time" />
			
			<div class="cmt-line row">
			    <c:if test="${LOGIN_USER_ID != chatlog.senderId}">
				<img class="avatar col-sm-1" src="${pageContext.request.contextPath}/static/img/avatar/avatar-${chatlog.senderId%7}.jpg" />
				</c:if>
			    
			    <c:if test="${LOGIN_USER_ID == chatlog.senderId}">
				<img class="avatar col-sm-1" src="${pageContext.request.contextPath}/static/img/avatar/avatar-${chatlog.receiverId%7}.jpg" />
			    </c:if>
				<div class="col-sm-7">
			    	<c:if test="${LOGIN_USER_ID != chatlog.senderId}">
					<div class="cmt-name">${chatlog.senderName}
					<span class="cmt-time">${time}</span></div>
					</c:if>
			           <c:if test="${LOGIN_USER_ID == chatlog.senderId}">
					<div class="cmt-name">${chatlog.receiverName}
					<span class="cmt-time">${time}</span></div>
					</c:if>
					<div class="cmt-content">
		             	<c:if test="${fn:length(chatlog.content)>20}">
		             		${fn:substring(chatlog.content,0,20)}...
		             	</c:if>
		             	<c:if test="${fn:length(chatlog.content)<=20}">
		             		${chatlog.content}
		             	</c:if>
					</div>
				</div>
			    <c:if test="${LOGIN_USER_ID == chatlog.senderId}">
				<a class="col-sm-offset-2 col-sm-2 hollow-btn" href="${pageContext.request.contextPath}/chat/${LOGIN_USER_ID}/${chatlog.receiverId}">查看</a>
				</c:if>
			    <c:if test="${LOGIN_USER_ID != chatlog.senderId}">
				<a class="col-sm-offset-2 col-sm-2 hollow-btn" href="${pageContext.request.contextPath}/chat/${LOGIN_USER_ID}/${chatlog.senderId}">查看</a>
				</c:if>
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
