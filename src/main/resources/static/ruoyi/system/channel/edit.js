
$("#form-role-edit").validate({
	rules:{

	},
	submitHandler:function(form){
		update();
	}
});


function update() {
	var channelId = $("input[name='channelId']").val();
	var channelName = $("input[name='channelName']").val();
    var channelSort = $('#channelSort').val();
    var channelAttribute = $("input[name='channelAttribute']").val();
    var remark = $("input[name='remark']").val();
	$.ajax({
		cache : true,
		type : "POST",
		url : "/system/channel/save",
		data : {
			"channelId": channelId,
			"channelName": channelName,
			"channelSort": channelSort,
            "channelAttribute": channelAttribute,
			"remark": remark,
		},
		async : false,
		error : function(request) {
			$.modalAlert("系统错误", "error");
		},
		success : function(data) {
			if (data.code == 0) {
				parent.layer.msg("修改成功,正在刷新数据请稍后……",{icon:1,time: 500,shade: [0.1,'#fff']},function(){
					$.parentReload();
				});
			} else {
				$.modalAlert(data.msg, "error");
			}

		}
	});
}
