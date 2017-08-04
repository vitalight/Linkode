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
	<%@ include file="./info.jsp" %>
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
	$("#info").addClass("cute-btn-chose");
	$(".js-trigger").click(function() {
		var type = $(this).attr("id");
		var targetUrl = "${pageContext.request.contextPath}/user/${id}/"+type;
		$("#js-placeholder").load(targetUrl);
		$(".js-trigger").removeClass("cute-btn-chose");
		$(this).addClass("cute-btn-chose");
	});
});
</script>
<%@ include file="../modules/web-footer.jsp"%>