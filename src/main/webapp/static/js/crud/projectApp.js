$(function() {
	$("#save").click(function(e) {
		var projectid = $("input[name='projectid']").val();
		var applicantid = $("input[name='applicantid']").val();
		var content = $("input[name='content']").val();
		var time = $("input[name='time']").val();
		var dataset = e.currentTarget.dataset;
		var id = dataset.id;
		if (id != "") {
			jQuery.ajax({
				url : '/Linkode/admin/projectApp/update',
				processData : true,
				dataType : "text",
				data : {
					id : id,
					projectId : projectid,
					applicantId : applicantid,
					content : content,
					time : time,
				},
				complete : function(data) {
					bootbox.alert({
						message : '修改成功~',
						callback : function() {
							location.reload();
						}
					});
				}
			});
		} else { // Add
			jQuery.ajax({
				url : '/Linkode/admin/projectApp/create',
				processData : true,
				dataType : "text",
				data : {
					id : id,
					projectId : projectid,
					applicantId : applicantid,
					content : content,
					time : time,
				},
				complete : function(data) {
					bootbox.alert({
						message : '插入成功~',
						callback : function() {
							location.reload();
						}
					});
				}
			})
		}
		$('#modal').modal('hide');
	});
	$(".delete").click(function(e) {
		bootbox.confirm({
			buttons : {
				confirm : {
					label : '删除'
				},
				cancel : {
					label : '取消'
				}
			},
			message : '确定删除？',
			callback : function(result) {
				if (result) {
					var dataset = e.currentTarget.dataset;
					var id = dataset.id;
					jQuery.ajax({
						url : '/Linkode/admin/projectApp/delete',
						processData : true,
						dataType : "text",
						data : {
							id : id,
						},
						complete : function(data) {
							console.log(id);
							bootbox.alert({
								message : '成功删除',
								callback : function() {
									location.reload();
								}
							});
						}
					});
				}
			}
		});
	});
	$("#add").click(function(e) {
		$('#modalTitle').html("Add");
		$("input[name='projectid']").val('');
		$("input[name='applicantid']").val('');
		$("input[name='content']").val('');
		$("input[name='time']").val('');
		$("#save").attr("data-id", '');
		$('#modal').modal('show');
	});
	$(".edit").click(function(e) {
		$('#modalTitle').html("Edit");
		var dataset = e.currentTarget.dataset;
		var id = dataset.id;
		$("input[name='projectid']").val(dataset.projectid);
		$("input[name='applicantid']").val(dataset.applicantid);
		$("input[name='content']").val(dataset.content);
		$("input[name='time']").val(dataset.time);
		$("#save").attr("data-id", dataset.id);
		$('#modal').modal('show');
	});
});
