<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","电影详情"); %>
<%@ include  file="./modules/web-header.jsp"%>
<%@ include  file="./modules/header.jsp"%>
<div class="container" style="margin-top: 60px;margin-bottom: 20px;">
    <h1>Details</h1>
    <h4>Movie</h4>
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
    <c:choose>
        <c:when test="${LOGIN_USER_ID==model.posterId }">
            <a href="${pageContext.request.contextPath}/project/edit/${model.id}">Edit</a>
        </c:when>
        <c:when test="${LOGIN_USER_ID!=model.posterId }">
            <a href="${pageContext.request.contextPath}/project/contract/${model.id}">Contract</a>
        </c:when>
    </c:choose>
    <a href="${pageContext.request.contextPath}/project/explore">Back to List</a>
    <hr> &copy;2017 - Linkode
</div>
<%@ include  file="./modules/javascript.jsp"%>
<%@ include  file="./modules/web-footer.jsp"%>