<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","主页"); %>
<% request.setAttribute("headType","user"); %>
<%@ include file="../modules/web-header.jsp"%>
<%@ include file="../modules/header.jsp"%>
	
	<div class="margin-top margin-bottom display-sheet">
		<div class="sheet-content">
			<div class="row">
				<h1 class="special">用户信息</h1>
			</div>
			还没做
		</div>
	</div>
	
<%@ include  file="../modules/javascript.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/jquery.md5.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/form-validate.js"></script>
<%@ include  file="../modules/web-footer.jsp"%>
