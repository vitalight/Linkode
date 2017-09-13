<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
	request.setAttribute("title", "user");
%>
<%@ include file="../modules/web-header.jsp"%><%@ include
	file="../modules/crud-header.jsp"%>
</head>
<body><%@ include file="../modules/header.jsp"%>
	<c:set var="type" value="user" />
	<c:set var="headType" value="admin" /><%@ include
		file="./crud-head.jsp"%>
	<div class="panel panel-default display bigger">
		<div class="panel-heading">
			user
			<button class="btn btn-default" type="button" id="add">
				<i class="fa fa-plus"></i>
			</button>
		</div>
		<!-- /.panel-heading -->
		<div class="panel-body">
			<div class="dataTable_wrapper">
				<table class="table table-striped table-bordered table-hover"
					id="dataTables">
					<thead>
						<tr>
							<th>id</th>
							<th>username</th>
							<th>password</th>
							<th>email</th>
							<th>ratingNumber</th>
							<th>ratingTotal</th>
							<th>sex</th>
							<th>birthday</th>
							<th>role</th>
							<th>money</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${model}" var="user">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${user.birthday}"
								var="birthday" />
							<tr>
								<td>${user.id}</td>
								<td>${user.username}</td>
								<td>${user.password}</td>
								<td>${user.email}</td>
								<td>${user.ratingNumber}</td>
								<td>${user.ratingTotal}</td>
								<td>${user.sex}</td>
								<td>${birthday}</td>
								<td>${user.role}</td>
								<td>${user.money}</td>
								<td><button class="btn btn-default delete" type="button"
										data-id="${user.id}">
										<i class="fa fa-trash"></i>
									</button>
									<button class="btn btn-default edit" type="button"
										data-id="${user.id}" data-username="${user.username}"
										data-password="${user.password}" data-email="${user.email}"
										data-ratingnumber="${user.ratingNumber}"
										data-ratingtotal="${user.ratingTotal}" data-sex="${user.sex}"
										data-birthday="${birthday}" data-role="${user.role}"
										data-money="${user.money}">
										<i class="fa fa-edit"></i>
									</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!-- /.panel-body -->
	</div>
	<!-- panel -->
	<div class="modal fade" id="modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
					</button>
					<h4 class="modal-title" id="modalTitle"></h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-12">
							<form role="form">
								<div class="form-group">
									<label>username</label><input class="form-control"
										name="username" />
								</div>
								<div class="form-group">
									<label>password</label><input class="form-control"
										name="password" />
								</div>
								<div class="form-group">
									<label>email</label><input class="form-control" name="email" />
								</div>
								<div class="form-group">
									<label>ratingNumber</label><input class="form-control"
										type="number" step="1" name="ratingnumber" />
								</div>
								<div class="form-group">
									<label>ratingTotal</label><input class="form-control"
										type="number" step="1" name="ratingtotal" />
								</div>
								<div class="form-group">
									<label>sex</label><input class="form-control" name="sex" />
								</div>
								<div class="form-group">
									<label>birthday</label><input class="form-control" type="date"
										name="birthday" />
								</div>
								<div class="form-group">
									<label>role</label><input class="form-control" name="role" />
								</div>
								<div class="form-group">
									<label>money</label><input class="form-control" type="number"
										step="1" name="money" />
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="save">保存</button>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../modules/javascript.jsp"%>
	<%@ include file="../modules/crud-footer.jsp"%>
	<script src="${pageContext.request.contextPath}/static/js/crud/user.js"></script>
	<%@ include file="../modules/web-footer.jsp"%>