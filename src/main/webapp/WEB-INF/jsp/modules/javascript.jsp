<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/index.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	if (${headType == null}) {
		$("#head-login").addClass("nav-btn-chose");
	} else {
		$("#head-"+"${headType}").addClass("nav-btn-chose");
	}
}); 
</script>