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
		<%@ include file="./edit.jsp" %>
	</div>
	<div class="info-tail">
		© 2017 Linkode
	</div>

<%@ include file="../modules/javascript.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	$(document).scrollTop($(document).height());
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