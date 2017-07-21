<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","作品浏览"); %>
<% request.setAttribute("headType","post"); %>
<%@ include file="../modules/web-header.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/explore.css">
</head>
<body>
<%@ include file="../modules/header.jsp"%>
	<div class="margin-top margin-bottom display-sheet">
		<div class="sheet-content">
			<div class="row">
				<h1 class="special">怎么写小学生作文</h1>
			</div>
			<br/>
			
			<div class="row content-text">
				<div class="cmt-line">
					<div class="row">
						<img class="avatar col-sm-1" src="${pageContext.request.contextPath}/static/img/avatar/avatar-0.jpg" />
						<div class="col-sm-9">
							<div class="cmt-name">Angle<span class="cmt-tag ran-2">楼主</span><span class="cmt-time">1个小时前</span></div>
							<div class="cmt-content">16世纪末到17世纪初的20多年期间莎士比亚在伦敦开始了成功的职业生涯，他不仅是演员、剧作家，
							还是宫内大臣剧团的合伙人之一，后来改名为国王剧团。</div>
						</div>
						<a class="col-sm-2 hollow-btn">回复</a>
					</div>
					<div class="floor-cmt row">
						<%for (int j=0;j<3;j++) {%>
							<div class="cmt-line">
								<div class="row">
									<img class="avatar col-sm-1" src="${pageContext.request.contextPath}/static/img/avatar/avatar-<%=(6-j)%7%>.jpg" />
									<div class="col-sm-11">
										<div class="cmt-name">
											Tom
											<span class="cmt-time">2天前</span>
											<a class="a-text" href="">回复</a>
										</div>
										<div class="cmt-content">16世纪末到17世纪初的20多年期间莎士比亚在伦敦开始了成功的职业生涯，他不仅是演员、剧作家，
										还是宫内大臣剧团的合伙人之一，后来改名为国王剧团。</div>
									</div>
								</div>
							</div>
						<%} %>
					</div>
				</div>
				
				<% for (int i=1; i<5; i++)  {%>
				<div class="cmt-line">
					<div class="row">
						<img class="avatar col-sm-1" src="${pageContext.request.contextPath}/static/img/avatar/avatar-<%=i%7 %>.jpg" />
						<div class="col-sm-9">
							<div class="cmt-name">Sombody<span class="cmt-time">30分钟前</span></div>
							<div class="cmt-content">本篇教程教大家如何使用高低频修肤方法，高低频磨皮是一种什么常用的磨皮方法，而且难度不大，
							大家认真学习一下，记着要点即可使用。其实不管是产品修图还是人像修图都没有想象中那么难哦，只要大家掌握了要领，就可以
							把图修得美美哒!大家赶紧get这个技能吧。</div>
						</div>
						<a class="col-sm-2 hollow-btn">回复</a>
					</div>
				</div>
				<%} %>
				<br/>
				<form action="${pageContext.request.contextPath}/project/${model.id}/application" method="post">
					<textarea name="content" class="form-control requirement" placeholder="正文" maxlength="90" name="content" required></textarea>
					<br/>
					<div class="row">
						<button class="blue-btn col-sm-2 col-sm-offset-5">发送申请</button>
					</div>
				</form>
			</div>
		</div>
	</div>

<%@ include  file="../modules/javascript.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/jquery.md5.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/form-validate.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	if (${type == null}) {
		$("#all").addClass("type-chose");
	}
	else {
		$("#${type}").addClass("type-chose");
	}
}); 
</script>
<%@ include  file="../modules/web-footer.jsp"%>