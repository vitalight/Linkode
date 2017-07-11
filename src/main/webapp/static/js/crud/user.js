$(function() {
	$("#save").click(function(e) {
		var username = $("input[name='username']").val();
		var password = $("input[name='password']").val();
		var email = $("input[name='email']").val();
		var ratingnumber = $("input[name='ratingnumber']").val();
		var ratingtotal = $("input[name='ratingtotal']").val();
		var sex = $("input[name='sex']").val();
		var birthday = $("input[name='birthday']").val();
		var role = $("input[name='role']").val();
		var money = $("input[name='money']").val();
		var dataset = e.currentTarget.dataset;
		var id = dataset.id;
		if (id != "") {
			jQuery.ajax({
				url : '/Linkode/admin/user/update',
				processData : true,
				dataType : "text",
				data : {
					id : id,
					username : username,
					password : password,
					email : email,
					ratingNumber : ratingnumber,
					ratingTotal : ratingtotal,
					sex : sex,
					birthday : birthday,
					role : role,
					money : money,
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
				url : '/Linkode/admin/user/create',
				processData : true,
				dataType : "text",
				data : {
					id : id,
					username : username,
					password : password,
					email : email,
					ratingNumber : ratingnumber,
					ratingTotal : ratingtotal,
					sex : sex,
					birthday : birthday,
					role : role,
					money : money,
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
						url : '/Linkode/admin/user/delete',
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
		$("input[name='username']").val('');
		$("input[name='password']").val('');
		$("input[name='email']").val('');
		$("input[name='ratingnumber']").val('');
		$("input[name='ratingtotal']").val('');
		$("input[name='sex']").val('');
		$("input[name='birthday']").val('');
		$("input[name='role']").val('');
		$("input[name='money']").val('');
		$("#save").attr("data-id", '');
		$('#modal').modal('show');
	});
	$(".edit").click(function(e) {
		$('#modalTitle').html("Edit");
		var dataset = e.currentTarget.dataset;
		var id = dataset.id;
		$("input[name='username']").val(dataset.username);
		$("input[name='password']").val(dataset.password);
		$("input[name='email']").val(dataset.email);
		$("input[name='ratingnumber']").val(dataset.ratingnumber);
		$("input[name='ratingtotal']").val(dataset.ratingtotal);
		$("input[name='sex']").val(dataset.sex);
		$("input[name='birthday']").val(dataset.birthday);
		$("input[name='role']").val(dataset.role);
		$("input[name='money']").val(dataset.money);
		$("#save").attr("data-id", dataset.id);
		$('#modal').modal('show');
	});
});
