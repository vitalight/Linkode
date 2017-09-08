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
					<%-- 评分显示数据准备, 当分母为0时的做特殊处理 --%>
					<c:set var="ratingNumber" value="${user.ratingNumber}" />
					<c:if test="${ratingNumber==0}">
						<c:set var="ratingNumber" value="1" />
					</c:if>
					<%-- ratingInt是rating的下取整，用于计算显示评分星星的长度 --%>
					<fmt:formatNumber value="${(user.ratingTotal/ratingNumber-0.5)}" pattern="0" var="ratingInt" />
					<fmt:formatNumber value="${user.ratingTotal/ratingNumber}" pattern="0.0" var="rating" />
					<fmt:formatNumber value="${rating*0.92+0.29*ratingInt}" pattern="0.00" var="width" />
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
					<c:if test="${user.ratingTotal==0}">
						<span class="rating-number">(暂无评分)</span>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>性别</th>
				<td>
				<c:if test="${user.sex!=null && user.sex!=''}">
				<fmt:setBundle basename="messages" var="lang"/>
				<fmt:message bundle="${lang}" key="${user.sex}"/>
				</c:if>
				
				<c:if test="${user.sex==null || user.sex==''}">
				保密
				</c:if>
				</td>
			</tr>
			<tr>
				<th>生日</th>
				<td>
				<c:if test="${user.birthday!=null}">
				<fmt:formatDate pattern="YYYY年M月d日 " value="${user.birthday}"></fmt:formatDate>
				</c:if>
				
				<c:if test="${user.birthday==null}">
				保密
				</c:if>
				</td>
			</tr>
			<tr>
				<th>介绍</th>
				<td class="higher">
				<c:if test="${user.intro!=null && user.intro!=''}">
				${user.intro}
				</c:if>
				
				<c:if test="${user.intro==null || user.intro==''}">
				暂无
				</c:if>
				</td>
			</tr>
			
			<c:if test="${LOGIN_USER_ID == id}">
			<tr>
				<th>余额</th>
				<td>
				${user.money}元
				</td>
			</tr>
			</c:if>
		</tbody>
	</table>
	<br/>
	<c:if test="${LOGIN_USER_ID == id}">
	<div class="middle">
		<a class="hollow-btn" href="${pageContext.request.contextPath}/user/${user.id}?type=edit">修改资料</a>
	</div>
	</c:if>
</div>