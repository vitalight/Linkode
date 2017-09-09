$(function() {
	$("#save").click(function(e) {
		var senderId = $("input[name='senderId']").val();
		var content = $("input[name='content']").val();
		var itemId = $("input[name='itemId']").val();
		var type = $("select[name='type']").val();
		var dataset = e.currentTarget.dataset;
		var id = dataset.id;
			jQuery.ajax({
				type:"POST",
			    url:"/Linkode/report/add",
				processData : true,
				dataType : "text",
				data : {
					id :id,
					portfolioId :itemId,
					type :type,
					userId :senderId,
					content :content,
				},
				complete : function(data) {
					bootbox.alert({
						message : '举报成功~',
						callback : function() {
							location.reload();
						}
					});
				}
			})
	

		$('#modal').modal('hide');
	});
	
	$("#report").click(function(e) {
		$('#modalTitle').html("举报");
		
		$("#save").attr("data-id", "");
		$('#modal').modal('show');
	});

	
});