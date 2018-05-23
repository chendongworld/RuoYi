
$("#form-role-edit").validate({
	rules:{

	},
	submitHandler:function(form){
		update();
	}
});


function update() {
    var channelNames=[];
    channelNames = $('#channelName').val();
    var channelName = channelNames.shift();
	var productId = $("input[name='productId']").val();
	var productName = $("input[name='productName']").val();
    var channelCost = $('#channelCost').val();
    var productSort = $('#productSort').val();
    var productAttribute = $("input[name='productAttribute']").val();
    var remark = $("input[name='remark']").val();
	$.ajax({
		cache : true,
		type : "POST",
		url : "/system/product/save",
		data : {
			"productId": productId,
            "channelName": channelName,
			"productName": productName,
            "channelCost": channelCost,
			"productSort": productSort,
            "productAttribute": productAttribute,
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
