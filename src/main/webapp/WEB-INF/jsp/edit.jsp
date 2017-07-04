<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","修改电影"); %>
<%@ include  file="./modules/web-header.jsp"%>
<%@ include  file="./modules/header.jsp"%>
<div class="container" style="margin-top: 60px;margin-bottom: 20px;">
    <h1>Edit</h1>
    <h4>Project</h4>
    <hr>
    <div class="row">
        <form id="movie-edit-form" class="form-horizontal col-md-6" action="${pageContext.request.contextPath}/project/edit" method="post">
            <input type="hidden" id="id" name="id" value="${model.id}">
            <input type="hidden" id="posterId" name="posterId" value="${model.posterId}">
            <input type="hidden" id="status" name="status" value="${model.status}">
            <div class="form-group">
                <label for="Title" class="col-sm-2 control-label">Title</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="title" name="title" value="${model.title}" placeholder="Title">
                    <span class="text-danger">${errors.title}</span>
                </div>
            </div>
            <div class="form-group">
                <label for="Requirement" class="col-sm-2 control-label">Requirement</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="requirement" name="requirement" value="${model.requirement}" placeholder="Requirement">
                    <span class="text-danger">${errors.requirement}</span>
                </div>
            </div>
            <div class="form-group">
                <label for="Type" class="col-sm-2 control-label">Type</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="type" name="type" value="${model.type}" placeholder="Type">
                    <span class="text-danger">${errors.type}</span>
                </div>
            </div>
            <div class="form-group">
                <label for="endDate" class="col-sm-2 control-label">End Date</label>
                <div class="col-sm-10">
                    <input type="date" class="form-control" id="time" name="time" value="${model.endDate}">
                    <span class="text-danger">${errors.endDate}</span>
                </div>
            </div>
            <div class="form-group">
                <label for="Money" class="col-sm-2 control-label">Money</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="money" name="money" value="${model.money}" placeholder="Money">
                    <span class="text-danger">${errors.money}</span>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">Edit</button>
                </div>
            </div>
        </form>
    </div>
    <a href="${pageContext.request.contextPath}/movie/list">Back to List</a>
    <hr> &copy;2017 - Linkode
</div>
<%@ include  file="./modules/javascript.jsp"%>
<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/form-validate.js"></script>
<%@ include  file="./modules/web-footer.jsp"%>