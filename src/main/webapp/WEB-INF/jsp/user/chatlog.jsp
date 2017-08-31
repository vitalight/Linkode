<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="margin-top display-sheet chatlog">
	<div class="sheet-content chatlog">
		<c:forEach items="${model}" var="chatlog">
		<fmt:formatDate pattern="M月d日 H:m" value="${chatlog.time}" var="time" />
		
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
	             	<c:if test="${fn:length(chatlog.content)>40}">
	             		${fn:substring(chatlog.content,0,20)}...
	             	</c:if>
	             	<c:if test="${fn:length(chatlog.content)<=40}">
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
		
		<c:if test="${model==null || model.size()==0}">
			<img class="middle-img" src="${pageContext.request.contextPath}/static/img/empty.png" />
			<div class="empty-text">空空如也...</div>
		</c:if>
	</div>
</div>
