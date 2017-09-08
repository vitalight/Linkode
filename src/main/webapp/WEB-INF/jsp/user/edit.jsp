<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="display-info">
	<form action="${pageContext.request.contextPath}/user/${user.id}/edit" class="edit-info" method="post">
		<table class="info-table">
			<tbody>
				<tr>
					<th>用户名</th>
					<td><input class="form-control" name="username" value="${user.username}" required/></td>
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
					<%-- 评分显示数据准备, 当分母为0时的做特殊处理 --%>
					<c:set var="ratingNumber" value="${user.ratingNumber}" />
					<c:if test="${ratingNumber==0}">
						<c:set var="ratingNumber" value="1" />
					</c:if>
					<%-- ratingInt是rating的下取整，用于计算显示评分星星的长度 --%>
					<fmt:formatNumber value="${(user.ratingTotal/ratingNumber-0.5)}" pattern="0" var="ratingInt" />
					<fmt:formatNumber value="${user.ratingTotal/ratingNumber}" pattern="0.0" var="rating" />
					<fmt:formatNumber value="${user.ratingTotal/ratingNumber*0.92+0.29*ratingInt}" pattern="0.00" var="width" />
					<fmt:formatNumber value="${6-width }" pattern="0.00" var="margin" />
					
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
					
					<c:if test="${user.ratingTotal!=0 }">
						<span class="rating-number">(${rating}分)</span>
					</c:if>
					<c:if test="${user.ratingTotal==0 }">
						<span class="rating-number">(暂无评分)</span>
					</c:if>
				</td>
				</tr>
				<tr>
					<th>性别</th>
					<td>
					<select name="sex" class="form-control">
					
					<c:if test="${user.sex=='secret'}">
					<option value="secret" id="secret" selected>保密</option>
					<option value="female" id="female">女</option>
					<option value="male" id="male">男</option>
					</c:if>
					
					<c:if test="${user.sex=='female'}">
					<option value="secret" id="secret">保密</option>
					<option value="female" id="female" selected>女</option>
					<option value="male" id="male">男</option>
					</c:if>
					
					
					<c:if test="${user.sex=='male'}">
					<option value="secret" id="secret">保密</option>
					<option value="female" id="female">女</option>
					<option value="male" id="male" selected>男</option>
					</c:if>
					
					</select>
					</td>
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
<td><textarea name="intro" class="form-control higher" autocomplete="off">${user.intro}</textarea></td>
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