$(function() {
$("#save").click(function(e) {
var portfolioid = $("input[name='portfolioid']").val();
var content = $("input[name='content']").val();
var userid = $("input[name='userid']").val();
var time = $("input[name='time']").val();
var dataset = e.currentTarget.dataset;
var id = dataset.id;
if (id != "") {
jQuery.ajax({
url : '/Linkode/admin/portfolioCmt/update',
processData : true,
dataType : "text",
data : {
id : id,
portfolioId : portfolioid,
content : content,
userId : userid,
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
url : '/Linkode/admin/portfolioCmt/create',
processData : true,
dataType : "text",
data : {
id : id,
portfolioId : portfolioid,
content : content,
userId : userid,
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
url : '/Linkode/admin/portfolioCmt/delete',
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
$("input[name='portfolioid']").val('');
$("input[name='content']").val('');
$("input[name='userid']").val('');
$("input[name='time']").val('');
$("#save").attr("data-id", '');
$('#modal').modal('show');
});
$(".edit").click(function(e) {
$('#modalTitle').html("Edit");
var dataset = e.currentTarget.dataset;
var id = dataset.id;
$("input[name='portfolioid']").val(dataset.portfolioid);
$("input[name='content']").val(dataset.content);
$("input[name='userid']").val(dataset.userid);
$("input[name='time']").val(dataset.time);
$("#save").attr("data-id", dataset.id);
$('#modal').modal('show');
});
});

