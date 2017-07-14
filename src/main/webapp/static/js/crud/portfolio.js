$(function() {
$("#save").click(function(e) {
var userid = $("input[name='userid']").val();
var title = $("input[name='title']").val();
var content = $("input[name='content']").val();
var type = $("input[name='type']").val();
var likes = $("input[name='likes']").val();
var dataset = e.currentTarget.dataset;
var id = dataset.id;
if (id != "") {
jQuery.ajax({
url : '/Linkode/admin/portfolio/update',
processData : true,
dataType : "text",
data : {
id : id,
userId : userid,
title : title,
content : content,
type : type,
likes : likes,
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
url : '/Linkode/admin/portfolio/create',
processData : true,
dataType : "text",
data : {
id : id,
userId : userid,
title : title,
content : content,
type : type,
likes : likes,
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
url : '/Linkode/admin/portfolio/delete',
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
$("input[name='userid']").val('');
$("input[name='title']").val('');
$("input[name='content']").val('');
$("input[name='type']").val('');
$("input[name='likes']").val('');
$("#save").attr("data-id", '');
$('#modal').modal('show');
});
$(".edit").click(function(e) {
$('#modalTitle').html("Edit");
var dataset = e.currentTarget.dataset;
var id = dataset.id;
$("input[name='userid']").val(dataset.userid);
$("input[name='title']").val(dataset.title);
$("input[name='content']").val(dataset.content);
$("input[name='type']").val(dataset.type);
$("input[name='likes']").val(dataset.likes);
$("#save").attr("data-id", dataset.id);
$('#modal').modal('show');
});
});

