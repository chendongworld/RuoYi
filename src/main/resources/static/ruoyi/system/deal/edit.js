
$("#form-role-edit").validate({
	rules:{

	},
	submitHandler:function(form){
		update();
	}
});


function update() {
    var dealId = $('#dealId').val();
    var userNames=[];
    var channelNames=[];
    var productNames=[];
    var merchantNames=[];
    userNames = $('#userName').val();
    channelNames = $('#channelName').val();
    productNames = $('#productName').val();
    merchantNames = $('#merchantName').val();
    var userName=userNames.shift();
    var channelName = channelNames.shift();
    var productName = productNames.shift();
    var merchantName = merchantNames.shift();
    var sumMoney = $('#sumMoney').val();
    var remark = $("input[name='remark']").val();
	$.ajax({
		cache : true,
		type : "POST",
		url : "/system/deal/save",
		data : {
            "dealId": dealId,
            "userName": userName,
            "channelName": channelName,
            "productName": productName,
            "merchantName": merchantName,
            "sumMoney": sumMoney,
            "remark": remark
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
