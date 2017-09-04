<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="display-info">
	<form action="${pageContext.request.contextPath}/user/${user.id}/edit" class="edit-info" method="post">
		<table class="info-table">
			<tbody>
				<tr>
					<th>用户名</th>
					<td><input class="form-control" name="username" value="${user.username}"/></td>
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
					<fmt:formatNumber value="${(user.ratingTotal+0.5)/user.ratingNumber-1}" pattern="0" var="ratingInt" />
					<fmt:formatNumber value="${user.ratingTotal/user.ratingNumber}" pattern="0.0" var="rating" />
					<c:set var="width" value="${user.ratingTotal/user.ratingNumber+0.2*ratingInt}" />
					<c:set var="margin" value="${6-width }" />
					<span class="rate-star">
						<i class="fa fa-star-o" aria-hidden="true"></i>
						<i class="fa fa-star-o" aria-hidden="true"></i>
						<i class="fa fa-star-o" aria-hidden="true"></i>
						<i class="fa fa-star-o" aria-hidden="true"></i>
						<i class="fa fa-star-o" aria-hidden="true"></i>
					</span>
					<span style="width:${width}em; margin-right:${margin}em" class="rate-star-out">
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
					<td><input name="sex" class="form-control" value="${user.sex}"/></td>
				</tr>
				<tr>
					<th>生日</th>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd" value='${user.birthday}' var="birthday"/>
						<input type="date" class="form-control" name="birthday" value="${birthday}"/>
					</td>
				</tr>
				<tr>
					<th>介绍</th>
					<td><input name="intro" class="form-control" value="${user.intro}"/></td>
				</tr>
			</tbody>
		</table>
	<br/>
	<div class="middle">
		<button class="hollow-btn">保存</button>
		<a class="hollow-btn" href="${pageContext.request.contextPath}/user/${user.id}">取消编辑</a>
	</div>
	</form>
</div>