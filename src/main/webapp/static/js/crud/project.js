$(function() {
$("#save").click(function(e) {
var posterid = $("input[name='posterid']").val();
var contractorid = $("input[name='contractorid']").val();
var title = $("input[name='title']").val();
var requirement = $("input[name='requirement']").val();
var type = $("input[name='type']").val();
var startdate = $("input[name='startdate']").val();
var enddate = $("input[name='enddate']").val();
var status = $("input[name='status']").val();
var money = $("input[name='money']").val();
var dataset = e.currentTarget.dataset;
var id = dataset.id;
if (id != "") {
jQuery.ajax({
url : '/Linkode/admin/project/update',
processData : true,
dataType : "text",
data : {
id : id,
posterId : posterid,
contractorId : contractorid,
title : title,
requirement : requirement,
type : type,
startDate : startdate,
endDate : enddate,
status : status,
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
url : '/Linkode/admin/project/create',
processData : true,
dataType : "text",
data : {
id : id,
posterId : posterid,
contractorId : contractorid,
title : title,
requirement : requirement,
type : type,
startDate : startdate,
endDate : enddate,
status : status,
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
url : '/Linkode/admin/project/delete',
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
$("input[name='posterid']").val('');
$("input[name='contractorid']").val('');
$("input[name='title']").val('');
$("input[name='requirement']").val('');
$("input[name='type']").val('');
$("input[name='startdate']").val('');
$("input[name='enddate']").val('');
$("input[name='status']").val('');
$("input[name='money']").val('');
$("#save").attr("data-id", '');
$('#modal').modal('show');
});
$(".edit").click(function(e) {
$('#modalTitle').html("Edit");
var dataset = e.currentTarget.dataset;
var id = dataset.id;
$("input[name='posterid']").val(dataset.posterid);
$("input[name='contractorid']").val(dataset.contractorid);
$("input[name='title']").val(dataset.title);
$("input[name='requirement']").val(dataset.requirement);
$("input[name='type']").val(dataset.type);
$("input[name='startdate']").val(dataset.startdate);
$("input[name='enddate']").val(dataset.enddate);
$("input[name='status']").val(dataset.status);
$("input[name='money']").val(dataset.money);
$("#save").attr("data-id", dataset.id);
$('#modal').modal('show');
});
});

