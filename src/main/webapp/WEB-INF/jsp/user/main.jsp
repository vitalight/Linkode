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
	<div id="js-placeholder" name="content">
	<c:if test="${type=='info'}">
		<%@ include file="./info.jsp" %>
	</c:if>
	<c:if test="${type=='chatlog'}">
		<%@ include file="./chatlog.jsp" %>
	</c:if>
	<c:if test="${type=='edit'}">
		<%@ include file="./edit.jsp" %>
	</c:if>
	
	<c:if test="${type=='editAvatar'}">
		<%@ include file="./editAvatar.jsp" %>
	</c:if>
	</div>
	<div class="info-tail">
		© 2017 Linkode
	</div>

<%@ include file="../modules/javascript.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	if ("${type}"!="info") {
		$(document).scrollTop($(document).height());
	}
	$("#${type}").addClass("cute-btn-chose");
	$(".js-trigger").click(function() {
		var type = $(this).attr("id");
		var targetUrl = "${pageContext.request.contextPath}/user/${id}/"+type;
		$("#js-placeholder").load(targetUrl, function() {
			$(".js-trigger").removeClass("cute-btn-chose");
			$("#"+type).addClass("cute-btn-chose");
		});	
	});
	
	$("#js-like").click(function() {
		var targetUrl = "${pageContext.request.contextPath}/user/${id}/like";
		$.get(targetUrl,function(data,status){
			if($("#js-like").text()=="关注") {
				$("#js-like").text("取消关注");
			} else {
				$("#js-like").text("关注");
			}
		});
	});
});
</script>
<%@ include file="../modules/web-footer.jsp"%>