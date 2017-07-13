$(function() {
$("#save").click(function(e) {
var postid = $("input[name='postid']").val();
var content = $("input[name='content']").val();
var floor = $("input[name='floor']").val();
var dataset = e.currentTarget.dataset;
var id = dataset.id;
if (id != "") {
jQuery.ajax({
url : '/Linkode/admin/postCmt/update',
processData : true,
dataType : "text",
data : {
id : id,
postid : postid,
content : content,
floor : floor,
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
url : '/Linkode/admin/postCmt/create',
processData : true,
dataType : "text",
data : {
id : id,
postid : postid,
content : content,
floor : floor,
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
url : '/Linkode/admin/postCmt/delete',
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
$("input[name='postid']").val('');
$("input[name='content']").val('');
$("input[name='floor']").val('');
$("#save").attr("data-id", '');
$('#modal').modal('show');
});
$(".edit").click(function(e) {
$('#modalTitle').html("Edit");
var dataset = e.currentTarget.dataset;
var id = dataset.id;
$("input[name='postid']").val(dataset.postid);
$("input[name='content']").val(dataset.content);
$("input[name='floor']").val(dataset.floor);
$("#save").attr("data-id", dataset.id);
$('#modal').modal('show');
});
});

