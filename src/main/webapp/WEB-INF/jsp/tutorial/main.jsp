<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","作品浏览"); %>
<% request.setAttribute("headType","tutorial"); %>
<%@ include file="../modules/web-header.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/explore.css">
</head>
<body>
<%@ include file="../modules/header.jsp"%>
	
	<div class="margin-top display-sheet">
		<div class="cute-list">
			<a class="cute-btn" href="">入门</a>
			<a class="cute-btn cute-btn-chose" href="">出家</a>
			<a class="cute-btn" href="">进阶</a>
			<a class="cute-btn" href="">高级</a>
			<a class="cute-btn" href="">实战</a>
			<a class="cute-btn" href="${pageContext.request.contextPath}/tutorial/edit">编辑导航</a>
		</div>
	</div>
	<div class="margin-bottom display-sheet">
		<div class="sheet-content">
			<div class="row">
				<h1>教程中心
				<a class="edit-link" href="${pageContext.request.contextPath}/tutorial/edit">新建教程</a>
				<a class="edit-link" href="${pageContext.request.contextPath}/tutorial/edit">编辑教程</a>
				</h1>
			</div>
			<div class="content-info row">
				<div class="info-left col-sm-2">
					平面
				</div>
				<div class="info-right col-sm-10">
					从入门到出家：如何画一个秃顶的JASON
				</div>
			</div>
			<div class="row content-text">
				威廉·莎士比亚（英语：William Shakespeare，1564年4月23日－1616年4月23日），华人社会常尊称为莎翁，清末民初鲁迅在《摩罗诗力说》
				（1908年2月）称莎翁为“狭斯丕尔”，是英国文学史上最杰出的戏剧家，也是欧洲文艺复兴时期最重要、最伟大的作家，全世界最卓越的文学家之一。
				莎士比亚在埃文河畔斯特拉特福出生长大，18岁时与安妮·海瑟薇结婚，两人共生育了三个孩子：苏珊娜、双胞胎哈姆尼特和朱迪思。16世纪末到17世
				纪初的20多年期间莎士比亚在伦敦开始了成功的职业生涯，他不仅是演员、剧作家，还是宫内大臣剧团的合伙人之一，后来改名为国王剧团。1613年
				左右，莎士比亚退休回到埃文河畔斯特拉特福，3年后逝世。1590年到1613年是莎士比亚的创作的黄金时代。他的早期剧本主要是喜剧和历史剧，在16
				世纪末期达到了深度和艺术性的高峰。接下来到1608年他主要创作悲剧，莎士比亚崇尚高尚情操，常常描写牺牲与复仇，包括《奥赛罗》、《哈姆雷特》
				、《李尔王》和《麦克白》，被认为属于英语最佳范例。在他人生最后阶段，他开始创作悲喜剧，又称为传奇剧。莎士比亚流传下来的作品包括38部戏剧
				、154首十四行诗、两首长叙事诗。他的戏剧有各种主要语言的译本，且表演次数远远超过其他任何戏剧家的作品。
				<h3>如何把刘和沇P到秃顶</h3>
				<img src="${pageContext.request.contextPath}/static/img/big-img.jpg" />
				他不仅是演员、剧作家，还是宫内大臣剧团的合伙人之一，后来改名为国王剧团。1613年
				左右，莎士比亚退休回到埃文河畔斯特拉特福，3年后逝世。1590年到1613年是莎士比亚的创作的黄金时代。他的早期剧本主要是喜剧和历史剧，在16
				世纪末期达到了深度和艺术性的高峰。接下来到1608年他主要创作悲剧，莎士比亚崇尚高尚情操，常常描写牺牲与复仇，包括《奥赛罗》、《哈姆雷特》
				、《李尔王》和《麦克白》，被认为属于英语最佳范例。在他人生最后阶段，他开始创作悲喜剧，又称为传奇剧。莎士比亚流传下来的作品包括38部戏剧
				、154首十四行诗、两首长叙事诗。他的戏剧有各种主要语言的译本，且表演次数远远超过其他任何戏剧家的作品。
				<hr />
				<a href="#">赞助Linkode</a>
				<a href="#">回到顶部</a>
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