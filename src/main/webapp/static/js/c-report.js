$(function() {
	$("#save").click(function(e) {
		var senderId = $("input[name='senderId']").val();
		var content = "作品id: " + $("input[name='itemId']").val() + "<br/>举报理由: " +$("input[name='content']").val();
		var dataset = e.currentTarget.dataset;
		var rurl="/Linkode/chat/"+ $("input[name='senderId']").val()+"/0";
		
			jQuery.ajax({
				type:"POST",
			    url:rurl,
				processData : true,
				dataType : "text",
				data : {
					message : content,
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
		$('#modal').modal('show');
	});

	
});