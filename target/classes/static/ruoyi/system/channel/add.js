
$("#form-product-add").validate({

	rules:{
        channelName:{
			required:true,
		},
        channelSort:{
			required:true,
		},
	},
	submitHandler:function(form){
		add();
	}
});


function add() {
	var channelName = $("input[name='channelName']").val();
	// var productSort = $("input[name='productSort']").val();
    var channelSort = $('#channelSort').val();
    var channelAttribute = $("input[name='channelAttribute']").val();
	var remark = $("input[name='remark']").val();
	// var menuIds = getCheckeds();

	$.ajax({
		cache : true,
		type : "POST",
		url : "save",
		data : {
			"channelName": channelName,
			"channelSort": channelSort,
            "channelAttribute": channelAttribute,
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
