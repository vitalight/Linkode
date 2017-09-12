<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="margin-top display-sheet chatlog">
	<div class="sheet-content chatlog">
	<c:forEach items="${model}" var="rating">
	<div class="cmt-line row">
		<a href="${pageContext.request.contextPath}/user/${rating.posterId}">
		<img class="avatar col-sm-1" src="${pageContext.request.contextPath}/file/user/${rating.posterId}" />
		</a>
		<div class="col-sm-7">
			<div class="cmt-name">
				<a href="${pageContext.request.contextPath}/user/${rating.posterId}">${rating.posterName}</a>
				<span class="cmt-time">
					在项目
					<a href="${pageContext.request.contextPath}/project/${rating.projectId}">[${rating.projectName }]</a>
					中评价
					<span class=" rate-star">
					<c:forEach begin="1" end="${rating.rating}" var="i">
						<i class="fa fa-star" aria-hidden="true"></i>
					</c:forEach>
					
					<c:forEach begin="${rating.rating}" end="4" var="i">
						<i class="fa fa-star-o" aria-hidden="true"></i>
					</c:forEach>
					</span>
				</span>
			</div>
			<div class="cmt-content">
				<c:if test="${rating == null}">
				暂无评价
				</c:if>
				${rating.content }
			</div>
		</div>
	</div>
	</c:forEach>
	</div>
</div>