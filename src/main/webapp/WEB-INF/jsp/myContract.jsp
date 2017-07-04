<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("title","电影"); %>
<% request.setAttribute("headType","crud"); %>
<%@ include  file="./modules/web-header.jsp"%>
<%@ include  file="./modules/header.jsp"%>
<div class="container" style="margin-top: 60px;margin-bottom: 20px;">
    <h1>List</h1>
    <a href="${pageContext.request.contextPath}/project/publish">Publish Project</a>
    <table class="table table-hover">
        <thead>
        <th>Id</th>
        <th>Status</th>
        <th>Title</th>
        <th>Requirement</th>
        <th>Money</th>
        <th></th>
        </thead>
        <tbody>
        <c:forEach items="${model.data}" var="project">
        	<c:if test="${project.contractorId==LOGIN_USER_ID}">
                <tr>
                    <td>${project.id}</td>
                    <c:choose>
                    <c:when test="${project.status=='finished'}">
                    	<td><font color="green">${project.status}</font></td>
                    </c:when>
                    <c:when test="${project.status=='uncontracted'}">
                    	<td><font color="orange">${project.status}</font></td>
                    </c:when>
                    <c:when test="${project.status=='unconfirmed'}">
                    	<td><font color="red">${project.status}</font></td>
                    </c:when>
                    <c:otherwise>
                    	<td><font color="blue">${project.status}</font></td>
                    </c:otherwise>
                    </c:choose>
                    <td>${project.title}</td>
                    <td>${project.requirement}</td>
                    <td>${project.money}</td>
                    <th><a href="${pageContext.request.contextPath}/project/details/${project.id}">Check</a>
                    <c:if test="${project.status=='unfinished' }">
                     | <a href="${pageContext.request.contextPath}/project/submit/${project.id}">Submit</a></th>
                    </c:if>
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