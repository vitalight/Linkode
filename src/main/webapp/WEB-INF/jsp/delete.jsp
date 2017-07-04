<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","删除项目"); %>
<%@ include  file="./modules/web-header.jsp"%>
<%@ include  file="./modules/header.jsp"%>
<div class="container" style="margin-top: 60px;margin-bottom: 20px;">
    <h1>Delete</h1>
    <h2>Are you sure you want to delete this?</h2>
    <h4>Project</h4>
    <hr>
    <dl class="dl-horizontal">
        <dt>Title</dt>
        <dd>${model.title}</dd>
        <dt>Requirement</dt>
        <dd>${model.requirement}</dd>
        <dt>Type</dt>
        <dd>${model.type}</dd>
        <dt>End Date</dt>
        <dd>${model.endDate}</dd>
        <dt>Money</dt>
        <dd>${model.money}</dd>
    </dl>
    <a href="${pageContext.request.contextPath}/project/deleteSubmit/${model.id}" class="btn btn-default">Delete</a> | <a href="${pageContext.request.contextPath}/project/explore">Back to List</a>
    <hr> &copy;2017 - Linkode
</div>
<%@ include  file="./modules/javascript.jsp"%>
<%@ include  file="./modules/web-footer.jsp"%>