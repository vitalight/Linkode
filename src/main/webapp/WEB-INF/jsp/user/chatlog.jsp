<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="margin-top display-sheet chatlog">
	<div class="sheet-content chatlog">
		<%-- 管理员审核举报 --%>
		<c:if test="${report!=null}">
		<div class="cmt-line row">
			<fmt:formatDate pattern="M月d日 H:m" value="${report.time}" var="time" />
			<img class="avatar col-sm-1" src="${pageContext.request.contextPath}/file/user/0" />
			<c:if test="${report.messages!=0}">
			<span class="red-number">${report.messages}</span>
			</c:if>
			<div class="col-sm-7">
				<div class="cmt-name">
					举报审核
					<span class="cmt-time">${time}</span>
				</div>
				<div class="cmt-content">
					${fn:escapeXml(report.content)}
				</div>
			</div>
			<a class="col-sm-offset-2 col-sm-2 hollow-btn" href="${pageContext.request.contextPath}/report">查看</a>
		</div>
		</c:if> 
		
		<c:forEach items="${model}" var="chatlog">
		<fmt:formatDate pattern="M月d日 H:m" value="${chatlog.time}" var="time" />
		
		<div class="cmt-line row">
			<c:choose>
				<c:when test="${chatlog.senderId == 0 || chatlog.receiverId == 0}">
					<img class="avatar col-sm-1" src="${pageContext.request.contextPath}/file/user/0" />
				</c:when>
				
				<c:when test="${LOGIN_USER_ID != chatlog.senderId}">
				<a href="${pageContext.request.contextPath}/user/${chatlog.senderId}">
					<img class="avatar col-sm-1" src="${pageContext.request.contextPath}/file/user/${chatlog.senderId}" />
			    </a>
				</c:when>
				
				<c:when test="${LOGIN_USER_ID == chatlog.senderId}">
				<a href="${pageContext.request.contextPath}/user/${chatlog.receiverId}">
				<img class="avatar col-sm-1" src="${pageContext.request.contextPath}/file/user/${chatlog.receiverId}" />
				</a>
				</c:when>
				
			</c:choose>
			
			<c:if test="${chatlog.messages!=0}">
			<span class="red-number">${chatlog.messages}</span>
		    </c:if>
		    
			<div class="col-sm-7">
				<c:choose>
					<c:when test="${chatlog.senderId == 0 || chatlog.receiverId == 0}">
					<div class="cmt-name">
						系统通知
						<span class="cmt-time">${time}</span>
					</div>
					</c:when>
					
					<c:when test="${LOGIN_USER_ID != chatlog.senderId}">
					<div class="cmt-name">
						<a href="${pageContext.request.contextPath}/user/${chatlog.senderId}">${chatlog.senderName}</a>
						<span class="cmt-time">${time}</span>
					</div>
					</c:when>
					
					<c:when test="${LOGIN_USER_ID == chatlog.senderId}">
					<div class="cmt-name">
						<a href="${pageContext.request.contextPath}/user/${chatlog.receiverId}">${chatlog.receiverName}</a>
						<span class="cmt-time">${time}</span>
					</div>
					</c:when>
				</c:choose>
				
				<div class="cmt-content">
					${chatlog.content }
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
