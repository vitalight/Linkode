<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
	request.setAttribute("title", "个人主页");
%>
<%
	request.setAttribute("headType", "user");
%>
<%@ include file="../modules/web-header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/pintuer.css">
</head>
<body>
	<%@ include file="../modules/header.jsp"%>
	<%@ include file="./userHeader.jsp" %>
	
	<div class="margin-bottom display-sheet">
		<div class="info-panel">
			<br><br>
			<div class="line-group">
				<hr class="bg-gray">
				<span class="icon-calendar-o line-icon"> 基本信息</span>
				<hr class="bg-gray">
			</div>
			<br>
			<form action="${pageContext.request.contextPath}/user/${id}/info/edit" method="post">
				<div class="form-group">
					<div class="label">
						<label for="id">ID</label>
					</div>
					<div class="field">
						<input type="text" class="input" id="id" name="id" value="${model.id}" disabled>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="username">昵称</label>
					</div>
					<div class="field">
						<input type="text" class="input" id="username" name="username" value="${model.username}">
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="email">邮箱</label>
					</div>
					<div class="field">
						<input type="text" class="input" id="email" name="email" value="${model.email}" disabled>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="email">密码</label>
					</div>
					<div class="field" id="edit-pwd">
						<span class="icon-pencil" > 点击修改密码</span>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="date">生日</label>
					</div>
					<div class="field">
						<input type="date" class="input" id="date" name="date">
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="sex">性别</label>
					</div>
					<div class="field">
						<select class="input select-btn" name="sex" id="sex">
							<option value="male" id="male">男</option>
							<option value="female" id="female">女</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label for="intro">简介</label>
					</div>
					<div class="field">
						<textarea rows="7" class="input" id="intro" name="intro" style="font-size:18px;line-height:40px;">${model.intro}</textarea>
					</div>
				</div>
				<br><br>
				<div class="form-button">
					<button class="button" type="submit">保存</button>
					<button class="button" type="button" id="cancel">取消</button>
				</div>
			</form>
		</div>
			
			
	</div>
	

<%@ include  file="../modules/javascript.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/jquery.md5.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/form-validate.js"></script>
<script src="${pageContext.request.contextPath}/static/js/pintuer.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#info").addClass("cute-btn-chose");
			t = new Date("${model.birthday}");
			var year = t.getFullYear();
			var m = t.getMonth() + 1;
			var month = m >= 10 ? m : "0" + m;
			var d = t.getDate();
			var day = d >= 10 ? d : "0" + d;
			var date = year + "-" + month + "-" + day;
			document.getElementById("date").value = date;
			$(".select-btn").val("${model.sex}");
			$("#cancel").click(function(){
				window.location.href = "/Linkode/user/" + ${id} + "/info";
			})
			$(".form-group .icon-pencil").click(function(){
				document.getElementById("edit-pwd").style.paddingTop = 0;
				document.getElementById("edit-pwd").style.paddingLeft = 0;
				document.getElementById("edit-pwd").innerHTML = 
					'<input type="password" class="input" id="password" name="password" placeholder="输入新密码..." required>';
			})
		})
	</script>

<%@ include  file="../modules/web-footer.jsp"%>