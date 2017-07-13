<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","作品浏览"); %>
<% request.setAttribute("headType","portfolio"); %>
<%@ include file="../modules/web-header.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/explore.css">
</head>
<body>
<%@ include file="../modules/header.jsp"%>
	
	<div class="margin-bottom margin-top display-sheet">
		<div class="sheet-content">
			<div class="row">
				<h1>春</h1>
			</div>
			<div class="content-info row">
				<div class="info-left col-sm-2">
					平面
				</div>
				<div class="info-right col-sm-10">
					春天来了，又到了万物复苏的季节。
				</div>
			</div>
			<div class="row content-text">
				盼望着，盼望着，东风来了，春天的脚步近了。 
				一切都像刚睡醒的样子，欣欣然张开了眼。山朗润起来了，水涨起来了，太阳的脸红起来了。 
				小草偷偷地从土地里钻出来，嫩嫩的，绿绿的。园子里，田野里，瞧去，一大片一大片满是的。
				坐着，躺着，打两个滚，踢几脚球，赛几趟跑，捉几回迷藏。风轻俏俏的，草软绵绵的。 
				桃树，杏树，梨树，你不让我，我不让你，都开满了花赶趟儿。红的像火，粉的像霞，白的像雪。
				花里带着甜味；闭了眼，树上仿佛已经满是桃儿，杏儿，梨儿。花下成千成百的蜜蜂嗡嗡的闹着，
				大小的蝴蝶飞来飞去。野花遍地是：杂样儿，有名字的，没名字的，散在草丛里像眼睛像星星，还眨呀眨。 
				“吹面不寒杨柳风”，不错的，像母亲的手抚摸着你，风里带着些心翻的泥土的气息，混着青草味儿，
				还有各种花的香，都在微微润湿的空气里酝酿。鸟儿将巢安在繁花嫩叶当中，高兴起来，呼朋引伴的卖弄清脆的歌喉，
				唱出婉转的曲子，跟清风流水应和着。牛背上牧童的短笛，这时候也成天嘹亮的响着。 
				雨是最寻常的，一下就是三两天。可别恼。看，像牛牦，像花针，像细丝，密密的斜织着，人家屋顶上全笼着一层薄烟。
				树叶却绿得发亮，小草也青得逼你的眼。傍晚时候，上灯了，一点点黄晕的光，烘托出一片安静而和平的夜。
				在乡下，小路上，石桥边，有撑着伞慢慢走着的人，地里还有工作的农民，披着所戴着笠。他们的房屋稀稀疏疏的，在雨里静默着。 
				天上的风筝渐渐多了，地上的孩子也多了。城里乡下，家家户户，老老小小，也赶趟似的，一个个都出来了。
				舒活舒活筋骨，抖擞抖擞精神，各做各的一份事儿去。“一年之计在于春”，刚起头儿，有的是功夫，有的是希望 
				春天像刚落地的娃娃，从头到脚都是新的，它生长着。 
				春天像小姑娘，花枝招展的笑着走着。 
				春天像健壮的青年，有铁一般的胳膊和腰脚，领着我们向前去。
				<h3>评论(5)</h3>
				<% for (int i=0; i<5; i++) { %>
				<div class="cmt-line row">
					<img class="avatar col-sm-1" src="${pageContext.request.contextPath}/static/img/avatar-<%=i+1%>.jpg" />
					<div class="col-sm-11">
						<div class="cmt-name">刘和沇<span class="cmt-time">30分钟前</span></div>
						<div class="cmt-content">
				一切都像刚睡醒的样子，欣欣然张开了眼。山朗润起来了，水涨起来了，太阳的脸红起来了。 
				小草偷偷地从土地里钻出来，嫩嫩的，绿绿的。园子里，田野里，瞧去，一大片一大片满是的。</div>
					</div>
				</div>
				<% } %>
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