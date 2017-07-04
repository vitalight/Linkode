<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","电影"); %>
<%@ include  file="./modules/web-header.jsp"%>
<%@ include  file="./modules/header.jsp"%>
<div class="container" style="margin-top: 60px;margin-bottom: 20px;">
    <h1>List</h1>
    <a href="${pageContext.request.contextPath}/project/publish">Publish Project</a>
    <table class="table table-hover">
        <thead>
        <th>Id</th>
        <th>PosterID</th>
        <th>Title</th>
        <th>Requirement</th>
        <th>Money</th>
        <th></th>
        </thead>
        <tbody>
        <c:forEach items="${model.data}" var="project">
            <tr>
                <td>${project.id}</td>
                <td>${project.posterId}</td>
                <td>${project.title}</td>
                <td>${project.requirement}</td>
                <td>${project.money}</td>
                <th><a href="${pageContext.request.contextPath}/project/details/${project.id}">Check</a> | <a href="${pageContext.request.contextPath}/project/delete/${project.id}">Delete</a></th>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%@ include  file="./modules/page-toolkit.jsp"%>
    <hr> &copy;2017 - Linkode
</div>
<%@ include  file="./modules/javascript.jsp"%>
<%@ include  file="./modules/web-footer.jsp"%>