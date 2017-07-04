<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","项目浏览"); %>
<% request.setAttribute("headType","project"); %>
<%@ include file="../modules/web-header.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/explore.css">
</head>
<body>
<%@ include file="../modules/header.jsp"%>
	<%  
	String typeStr = request.getParameter("type");
	String[] classes = {"", "", ""};
	if (typeStr!=null) {
		int type = Integer.parseInt(typeStr);
		classes[type]="type-chose";
	} else {
		classes[0]="type-chose";
	}
	%>
	<div class="type-list">
		<a class="type-btn <%=classes[0] %>" href="${pageContext.request.contextPath}/project/explore?type=0">所有项目</a>
		<a class="type-btn <%=classes[1] %>" href="${pageContext.request.contextPath}/project/explore?type=1">我发布的项目</a>
		<a class="type-btn <%=classes[2] %>" href="${pageContext.request.contextPath}/project/explore?type=2">我承包的项目</a>
	</div>
	
	<div class="display">
		<%
		String[] strs = {"摄影","平面", "音乐"};
		for (int i=0;i<12;i++) { %>
		<div class="display-bar">
			<div class="col-sm-3">
				<img class="display-bar-img" src="${pageContext.request.contextPath}/static/img/pic-<%=i%10+1%>.png"/>
			</div>
			<div class="col-sm-9">
				<a class="bar-text" href="">
					<h3><%=strs[i%3] %>师招募<span class="type-tag ran-<%=i%3%>"><%=strs[i%3] %></span></h3>
					<p class="bar-info">
						<span class="col-sm-4 no-padding"><strong>酬金：</strong>￥1000</span>
						<span class="col-sm-4 no-padding"><strong>开始日期：</strong>2017年6月1日 </span>
						<span class="col-sm-4 no-padding"><strong>截止日期：</strong>2017年9月1日</span>
					</p>
					<p class="bar-content">
						莎士比亚在埃文河畔斯特拉特福出生长大，18岁时与安妮·海瑟薇结婚，两人共生育了三个孩子：
						苏珊娜、双胞胎哈姆尼特和朱迪思。
						16世纪末到17世纪初的20多年期间莎士比亚在伦敦开始了成功的职业生涯，
						他不仅是演员、剧作家，还是宫内大臣剧团的合伙人之一...
					</p>
				</a>
					<div class="col-sm-10 author">
						<img class="bar-avatar" 
							src="${pageContext.request.contextPath}/static/img/avatar-google.jpg"/>
						Google
					</div>
					<button class="col-sm-2 contract-btn">承包</button>
			</div>
		</div>
		<% } %>
	</div>

<%@ include  file="../modules/javascript.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/jquery.md5.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/form-validate.js"></script>
<%@ include  file="../modules/web-footer.jsp"%>