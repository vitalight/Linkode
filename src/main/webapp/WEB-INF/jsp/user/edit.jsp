<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="display-info">
	<form action="${pageContext.request.contextPath}/user/${user.id}/edit" method="post">
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
						<fmt:formatNumber value="${user.ratingTotal/user.ratingNumber}" pattern="0.0">
						</fmt:formatNumber>
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
	<button class="hollow-btn">保存</button>
	</form>
</div>