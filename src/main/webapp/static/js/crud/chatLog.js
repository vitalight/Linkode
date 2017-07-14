$(function() {
$("#save").click(function(e) {
var senderid = $("input[name='senderid']").val();
var receiverid = $("input[name='receiverid']").val();
var time = $("input[name='time']").val();
var content = $("input[name='content']").val();
var dataset = e.currentTarget.dataset;
var id = dataset.id;
if (id != "") {
jQuery.ajax({
url : '/Linkode/admin/chatLog/update',
processData : true,
dataType : "text",
data : {
id : id,
senderId : senderid,
receiverId : receiverid,
time : time,
content : content,
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
url : '/Linkode/admin/chatLog/create',
processData : true,
dataType : "text",
data : {
id : id,
senderId : senderid,
receiverId : receiverid,
time : time,
content : content,
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
url : '/Linkode/admin/chatLog/delete',
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
$("input[name='senderid']").val('');
$("input[name='receiverid']").val('');
$("input[name='time']").val('');
$("input[name='content']").val('');
$("#save").attr("data-id", '');
$('#modal').modal('show');
});
$(".edit").click(function(e) {
$('#modalTitle').html("Edit");
var dataset = e.currentTarget.dataset;
var id = dataset.id;
$("input[name='senderid']").val(dataset.senderid);
$("input[name='receiverid']").val(dataset.receiverid);
$("input[name='time']").val(dataset.time);
$("input[name='content']").val(dataset.content);
$("#save").attr("data-id", dataset.id);
$('#modal').modal('show');
});
});

