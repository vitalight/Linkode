<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!--
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
            <span class="sr-only">切换导航</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/list">SSM-Demo</a>
        </div>
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="#">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <shiro:authenticated>
                    <li><a href="${pageContext.request.contextPath}/logout">Log out</a></li>
                </shiro:authenticated>
                <shiro:notAuthenticated>
                    <li><a href="${pageContext.request.contextPath}/register">Register</a></li>
                    <li><a href="${pageContext.request.contextPath}/login">Log in</a></li>
                </shiro:notAuthenticated>
            </ul>
        </div>
    </div>
</nav> 
 -->
<nav class="white-nav navbar-fixed-top">
		<ul>
			<li><a class="logo-btn" href=""><img class="nav-logo" src="${pageContext.request.contextPath}/static/img/LK.png"/></a></li>
			<li><a class="nav-btn" href="">CRUD</a></li>
			<li><a class="nav-btn" href="${pageContext.request.contextPath}/explore">Home</a></li>
			<li><a class="nav-btn" href="">Project</a></li>
			<shiro:authenticated>
				<li><a class="nav-btn nav-btn-chose" href="${pageContext.request.contextPath}/logout">Logout</a></li>
			</shiro:authenticated>
			<shiro:notAuthenticated>
				<li><a class="nav-btn nav-btn-chose" href="${pageContext.request.contextPath}/login">Login</a></li>
			</shiro:notAuthenticated>
		</ul>
		<form>
			<input type="text" class="form-control search" placeholder="Search..."/>
		</form>
		<img class="user-btn avatar" src="${pageContext.request.contextPath}/static/img/avatar.png"/>
		<a class="nav-btn user-btn" href="">Hi, Admin<span class="glyphicon glyphicon glyphicon-chevron-down myicon"></span></a>
	</nav>