
$("#form-product-add").validate({

	rules:{
        channelName:{
            required:true,
        },
        productName:{
			required:true,
		},
        productSort:{
			required:true,
		},
        channelCost:{
            required:true,
        },
	},
	submitHandler:function(form){
		add();
	}
});


function add() {
    var channelNames=[];
    channelNames = $('#channelName').val();
    var channelName = channelNames.shift();
	var productName = $("input[name='productName']").val();
    var channelCost = $('#channelCost').val();
    var productSort = $('#productSort').val();
    var productAttribute = $("input[name='productAttribute']").val();
	var remark = $("input[name='remark']").val();

	$.ajax({
		cache : true,
		type : "POST",
		url : "save",
		data : {
			"channelName": channelName,
            "productName": productName,
			"productSort": productSort,
            "channelCost": channelCost,
            "productAttribute": productAttribute,
			"remark": remark
			// "menuIds": menuIds
		},
		async : false,
		error : function(request) {
			$.modalAlert("系统错误", "error");
		},
		success : function(data) {
			if (data.code == 0) {
				parent.layer.msg("新增成功,正在刷新数据请稍后……",{icon:1,time: 500,shade: [0.1,'#fff']},function(){
					$.parentReload();
				});
			} else {
				$.modalAlert(data.msg, "error");
			}

		}
	});
}
