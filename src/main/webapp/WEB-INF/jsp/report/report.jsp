<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","对话"); %>
<% request.setAttribute("headType","user"); %>
<%@ include file="../modules/web-header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body>
<%@ include file="../modules/header.jsp"%>

	<div class="margin-top display-sheet chat">
		<div class="sheet-content ">
			
			<div class="row">
				<h1>举报审核
				<a class="edit-link" href="${pageContext.request.contextPath}/user/${id1}?type=chatlog">返回私信箱</a>
				</h1>
			</div>
			
			<div class="cmt-line row chat-window" id="js-placeholder">
				<c:forEach items="${model}" var="report">
					<div class="chat-left">
						<img src="${pageContext.request.contextPath}/file/user/0" />
						<div class="detail">
							<div class="time">
								<fmt:formatDate pattern="M月d日 H:mm"  value="${report.time}"></fmt:formatDate>
							</div>
							<div class="triangle-left"></div>
							<div class="bubble">
								作品id：<a target="_blank" href="${pageContext.request.contextPath}/portfolio/${report.portfolioId}">${report.portfolioId}</a><br/>
								举报类型：${report.type}<br/>
								详细理由：${report.content}<br/>	
								
								<div class="js-${report.portfolioId}">
									<a class="hollow-btn js-pass" href="javascirpt:;" report="${report.id}">通过</a>
									<a class="hollow-btn js-fail" href="javascirpt:;" report="${report.id}">否决</a>
								</div>
							</div>
						</div>
						<div class="fill"></div>
					</div>
					<br/>
				</c:forEach>
			</div>
			
			<br/>
			
			<div class="content-text">
				<textarea name="message" class="form-control requirement" maxlength="90" name="requirement" disabled></textarea>
				<br/>
			</div>
		</div>
	</div>

<%@ include  file="../modules/javascript.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	$(".js-pass").click(function() {
		var reportId = $(this).attr("report");
		var targetUrl = "${pageContext.request.contextPath}/report/"+reportId+"/pass";
		$.get(targetUrl,function(data,status){
			$(".js-"+reportId).html("<a class='hollow-btn'>已通过</a>")
		});
	});
	$(".js-fail").click(function() {
		var reportId = $(this).attr("report");
		var targetUrl = "${pageContext.request.contextPath}/report/"+reportId+"/fail";
		$.get(targetUrl,function(data,status){
			$(".js-"+reportId).html("<a class='hollow-btn'>已否决</a>")
		});
		
	});
	
	
});
</script>
<%@ include  file="../modules/web-footer.jsp"%>