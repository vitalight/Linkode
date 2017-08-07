<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
	request.setAttribute("title", "个人主页");
%>
<%
	request.setAttribute("headType", "user");
%>
<%@ include file="../modules/web-header.jsp"%>
</head>
<body>
	<%@ include file="../modules/header.jsp"%>
	<%@ include file="./userHeader.jsp" %>
	<div id="js-placeholder">
	<c:if test="${type=='info'}">
		<%@ include file="./info.jsp" %>
	</c:if>
	<c:if test="${type!='info'}">
		<%@ include file="./chatlog.jsp" %>
	</c:if>
	</div>
	<div class="info-tail">
		© 2017 Linkode
	</div>

<%@ include file="../modules/javascript.jsp"%>
<script
	src="${pageContext.request.contextPath}/static/js/jquery.md5.js"></script>
<script
	src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script
	src="${pageContext.request.contextPath}/static/js/form-validate.js"></script>
<script src="${pageContext.request.contextPath}/static/js/pintuer.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#${type}").addClass("cute-btn-chose");
	$(".js-trigger").click(function() {
		var type = $(this).attr("id");
		var targetUrl = "${pageContext.request.contextPath}/user/${id}/"+type;
		$("#js-placeholder").load(targetUrl, function() {
			$(".js-trigger").removeClass("cute-btn-chose");
			$("#"+type).addClass("cute-btn-chose");
		});
	});
});
</script>
<%@ include file="../modules/web-footer.jsp"%>