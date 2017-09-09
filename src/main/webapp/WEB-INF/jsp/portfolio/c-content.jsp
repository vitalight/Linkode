<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${LOGIN_USER_ID !=0 }">
<c:forEach items="${model}" var="chat">
    <c:if test="${LOGIN_USER_ID != chat.senderId}">
	<div class="chat-left">
		<img src="${pageContext.request.contextPath}/static/img/avatar/avatar-${chat.senderId % 7}.jpg" />
		<div class="detail">
			<div class="time">
				<fmt:formatDate pattern="M月d日 H:mm"  value="${chat.time}"></fmt:formatDate>
			</div>
			<div class="triangle-left"></div>
			<div class="bubble">
				${chat.content} 
				<br>
			</div>
		</div>
		<div class="fill"></div>
	</div>
	<br/>
	</c:if>
	
       <c:if test="${LOGIN_USER_ID == chat.senderId}">
	<div class="chat-right">
		<img src="${pageContext.request.contextPath}/static/img/avatar/avatar-${LOGIN_USER_ID % 7}.jpg" />
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
</c:if>
<c:if test="${LOGIN_USER_ID ==0 }">
<c:forEach items="${reports}" var="report">
   <c:if test="${report.result=='undone'}">
	<div class="chat-left">
		<img src="${pageContext.request.contextPath}/static/img/avatar/avatar-${report.userId % 7}.jpg" />
		<div class="detail">
			<div class="time">
				<fmt:formatDate pattern="M月d日 H:mm"  value="${report.time}"></fmt:formatDate>
			</div>
			<div class="triangle-left"></div>
			<div class="bubble">
			<a href="/Linkode/portfolio/${report.portfolioId}">作品链接</a><br>			
				举报理由:${report.type} 
				<br>
				详细原因:${report.content }
				<br>
				
						<form action="${pageContext.request.contextPath}/report/decide/${report.portfolioId}/${report.userId}" method="post">
							<input type="hidden" name="decision" value="reject">
							<button type="submit" class="col-sm-2 contract-btn" >拒绝 </button>
							</form>
					
					   <br><br>
						<form action="${pageContext.request.contextPath}/report/decide/${report.portfolioId}/${report.userId}" method="post">
							<input type="hidden" name="decision" value="pass">
							<button type="submit" class="col-sm-2 contract-btn" >同意</button>
							</form>
			</div>
		</div>
		<div class="fill"></div>
	</div>
	<br/>
	</c:if>
	</c:forEach>
</c:if>