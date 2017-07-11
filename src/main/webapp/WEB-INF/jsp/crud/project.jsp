<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","project"); %><% request.setAttribute("headType","admin"); %>
<%@ include file="../modules/web-header.jsp"%><%@ include file="../modules/crud-header.jsp" %>
</head><body><%@ include file="../modules/header.jsp"%>
<c:set var="type" value="project"/><%@ include file="./crud-head.jsp" %>
<div class="panel panel-default display bigger">
<div class="panel-heading">
project<button class="btn btn-default" type="button" id="add">
<i class="fa fa-plus"></i></button></div> <!-- /.panel-heading -->
<div class="panel-body"><div class="dataTable_wrapper">
<table class="table table-striped table-bordered table-hover" id="dataTables">
<thead><tr>
<th>id</th><th>posterId</th><th>contractorId</th><th>title</th><th>requirement</th><th>type</th><th>startDate</th><th>endDate</th><th>status</th><th>money</th><th></th></tr></thead><tbody>
<c:forEach items="${model}" var="project">
<fmt:formatDate pattern="yyyy-MM-dd" value="${project.startDate}" var="startDate"/>
<fmt:formatDate pattern="yyyy-MM-dd" value="${project.endDate}" var="endDate"/>
<tr>
<td>${project.id}</td><td>${project.posterId}</td><td>${project.contractorId}</td><td>${project.title}</td><td>${project.requirement}</td><td>${project.type}</td><td>${startDate}</td>
<td>${endDate}</td>
<td>${project.status}</td><td>${project.money}</td><td><button class="btn btn-default delete" type="button" data-id="${project.id}">
<i class="fa fa-trash"></i></button><button class="btn btn-default edit" type="button"
data-id="${project.id}"
data-posterid="${project.posterId}"
data-contractorid="${project.contractorId}"
data-title="${project.title}"
data-requirement="${project.requirement}"
data-type="${project.type}"
data-startdate="${startDate}"
data-enddate="${endDate}"
data-status="${project.status}"
data-money="${project.money}"
><i class="fa fa-edit"></i></button></td></tr></c:forEach></tbody></table></div></div> <!-- /.panel-body --></div> <!-- panel --><div class="modal fade" id="modal" tabindex="-1" role="dialog"
aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal">
<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
</button>
<h4 class="modal-title" id="modalTitle"></h4>
</div>
<div class="modal-body"><div class="row"><div class="col-lg-12"><form role="form">
<div class="form-group">
<label>posterId</label><input class="form-control" type="number" step="1"  name="posterid" /></div>
<div class="form-group">
<label>contractorId</label><input class="form-control" type="number" step="1"  name="contractorid" /></div>
<div class="form-group">
<label>title</label><input class="form-control" name="title" /></div>
<div class="form-group">
<label>requirement</label><input class="form-control" name="requirement" /></div>
<div class="form-group">
<label>type</label><input class="form-control" name="type" /></div>
<div class="form-group">
<label>startDate</label><input class="form-control" type="date"  name="startdate" /></div>
<div class="form-group">
<label>endDate</label><input class="form-control" type="date"  name="enddate" /></div>
<div class="form-group">
<label>status</label><input class="form-control" name="status" /></div>
<div class="form-group">
<label>money</label><input class="form-control" type="number" step="1"  name="money" /></div>
</form></div></div></div><div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
<button type="button" class="btn btn-primary" id="save">保存</button>
</div></div></div></div>
<%@ include file="../modules/javascript.jsp"%>
<%@ include file="../modules/crud-footer.jsp" %>
<script src="${pageContext.request.contextPath}/static/js/crud/project.js"></script>
<%@ include  file="../modules/web-footer.jsp"%>
