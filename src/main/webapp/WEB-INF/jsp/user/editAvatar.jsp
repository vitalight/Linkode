<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="display-info">
	<form action="${pageContext.request.contextPath}/user/${user.id}/editAvatar" class="edit-info" method="post"  enctype="multipart/form-data">
		<table class="info-table">
			<tbody>
				<tr>
					<th>选择图片</th>
					<td><input type="file" name="file" required/></td>
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