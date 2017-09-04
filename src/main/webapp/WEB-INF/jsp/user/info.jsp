<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="display-info">
	<table class="info-table">
		<tbody>
			<tr>
				<th>用户名</th>
				<td>${user.username}</td>
			</tr>
			<tr>
				<th>邮箱</th>
				<td>
					${user.email}
				</td>
			</tr>
			<tr>
				<th>评分</th>
				<td>
					<fmt:formatNumber value="${user.ratingTotal/user.ratingNumber}" pattern="0.0" var="rating" />
					<span class="rate-star">
						<i class="fa fa-star-o" aria-hidden="true"></i>
						<i class="fa fa-star-o" aria-hidden="true"></i>
						<i class="fa fa-star-o" aria-hidden="true"></i>
						<i class="fa fa-star-o" aria-hidden="true"></i>
						<i class="fa fa-star-o" aria-hidden="true"></i>
					</span>
					<span style="width:${user.ratingTotal*1.2/user.ratingNumber}em; margin-right:${6-user.ratingTotal*1.2/user.ratingNumber}em" class="rate-star-out">
						<span class="rate-star-in">
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star" aria-hidden="true"></i>
						</span>
					</span>
					<span class="rating-number">(${rating}分)</span>
				</td>
			</tr>
			<tr>
				<th>性别</th>
				<td>${user.sex}</td>
			</tr>
			<tr>
				<th>生日</th>
				<td>
					<fmt:formatDate type="Date" value="${user.birthday}"></fmt:formatDate>
				</td>
			</tr>
			<tr>
				<th>介绍</th>
				<td>${user.intro}</td>
			</tr>
		</tbody>
	</table>
	<br/>
	<c:if test="${LOGIN_USER_ID == id}">
	<a class="hollow-btn" href="${pageContext.request.contextPath}/user/${user.id}?type=edit">修改资料</a>
	</c:if>
</div>