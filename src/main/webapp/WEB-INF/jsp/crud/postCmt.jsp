<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","postCmt"); %><% request.setAttribute("headType","admin"); %>
<%@ include file="../modules/web-header.jsp"%><%@ include file="../modules/crud-header.jsp" %>
</head><body><%@ include file="../modules/header.jsp"%>
<c:set var="type" value="postCmt"/><%@ include file="./crud-head.jsp" %>
<div class="panel panel-default display bigger">
<div class="panel-heading">
postCmt<button class="btn btn-default" type="button" id="add">
<i class="fa fa-plus"></i></button></div> <!-- /.panel-heading -->
<div class="panel-body"><div class="dataTable_wrapper">
<table class="table table-striped table-bordered table-hover" id="dataTables">
<thead><tr>
<th>id</th><th>postid</th><th>content</th><th>floor</th><th></th></tr></thead><tbody>
<c:forEach items="${model}" var="postCmt">
<tr>
<td>${postCmt.id}</td><td>${postCmt.postid}</td><td>${postCmt.content}</td><td>${postCmt.floor}</td><td><button class="btn btn-default delete" type="button" data-id="${postCmt.id}">
<i class="fa fa-trash"></i></button><button class="btn btn-default edit" type="button"
data-id="${postCmt.id}"
data-postid="${postCmt.postid}"
data-content="${postCmt.content}"
data-floor="${postCmt.floor}"
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
<label>postid</label><input class="form-control" type="number" step="1"  name="postid" /></div>
<div class="form-group">
<label>content</label><input class="form-control" name="content" /></div>
<div class="form-group">
<label>floor</label><input class="form-control" type="number" step="1"  name="floor" /></div>
</form></div></div></div><div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
<button type="button" class="btn btn-primary" id="save">保存</button>
</div></div></div></div>
<%@ include file="../modules/javascript.jsp"%>
<%@ include file="../modules/crud-footer.jsp" %>
<script src="${pageContext.request.contextPath}/static/js/crud/postCmt.js"></script>
<%@ include  file="../modules/web-footer.jsp"%>
