<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","电影"); %>
<% request.setAttribute("headType","project"); %>
<%@ include  file="./modules/web-header.jsp"%>
<%@ include  file="./modules/header.jsp"%>
<div class="container" style="margin-top: 60px;margin-bottom: 20px;">
    <h1>List</h1>
    <a href="${pageContext.request.contextPath}/project/publish">Publish Project</a>
    <table class="table table-hover">
        <thead>
        <th>Id</th>
        <th>Poster</th>
        <th>Title</th>
        <th>Requirement</th>
        <th>Money</th>
        <th></th>
        </thead>
        <tbody>
        <c:forEach items="${model.data}" var="project">
            <c:if test="${project.status=='uncontracted' }">
                <tr>
                    <td>${project.id}</td>
                    <td>${project.username}</td>
                    <td>${project.title}</td>
                    <td>${project.requirement}</td>
                    <td>${project.money}</td>
                    <th><a href="${pageContext.request.contextPath}/project/details/${project.id}">Check</a>
                    <c:choose>
                    <c:when test="${LOGIN_USER_ID==project.posterId}">
                     | <a href="${pageContext.request.contextPath}/project/delete/${project.id}">Delete</a></th>
                    </c:when>
                    <c:otherwise>
                     | <a href="${pageContext.request.contextPath}/project/contract/${project.id}">Contract</a></th>
                    </c:otherwise>
                    </c:choose>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
    <%@ include  file="./modules/page-toolkit.jsp"%>
    <hr> &copy;2017 - Linkode
</div>
<%@ include  file="./modules/javascript.jsp"%>
<%@ include  file="./modules/web-footer.jsp"%>