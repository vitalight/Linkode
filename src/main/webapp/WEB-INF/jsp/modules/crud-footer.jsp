<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="${pageContext.request.contextPath}/static/js/crud/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/crud/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/crud/bootbox.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	if (${type == null}) {
		$("#all").addClass("type-chose");
	}
	else {
		$("#${type}").addClass("type-chose");
	}
}); 
</script>
<script>
	$(document).ready(function() {
		$('#dataTables').DataTable({
			responsive : true
		});
	});
</script>