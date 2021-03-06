<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:forEach items="${model}" var="chat">
    <c:if test="${LOGIN_USER_ID != chat.senderId}">
	<div class="chat-left">
		<img src="${pageContext.request.contextPath}/file/user/${chat.senderId}" />
		<div class="detail">
			<div class="time">
				<fmt:formatDate pattern="M月d日 H:mm"  value="${chat.time}"></fmt:formatDate>
			</div>
			<div class="triangle-left"></div>
			<div class="bubble">
				${chat.content}
			</div>
		</div>
		<div class="fill"></div>
	</div>
	<br/>
	</c:if>
	
       <c:if test="${LOGIN_USER_ID == chat.senderId}">
	<div class="chat-right">
		<img src="${pageContext.request.contextPath}/file/user/${LOGIN_USER_ID}" />
		<div class="detail">
			<div class="time">
				<fmt:formatDate pattern="M月d日 H:mm"  value="${chat.time}"></fmt:formatDate>
			</div>
			<div class="triangle-right"></div>
			<div class="bubble">
				${chat.content}
			</div>
		</div>
		<div class="fill"></div>
	</div>
	<br/>
	</c:if>
	
</c:forEach>