
$("#form-product-add").validate({

	rules:{
        userName:{
			required:true,
		},
        merchantName:{
            required:true,
        },
        merchantSort:{
            required:true,
        },
        merchantRate:{
            required:true,
        },
        royaltyRate:{
            required:true,
        },

	},
	submitHandler:function(form){
		add();
	}
});


function add() {
	// var userName = $("input[name='userName']").val();
	// var productSort = $("input[name='productSort']").val();
    var userNames=[];
    userNames = $('#userName').val();
    var userName=userNames.shift();
    var merchantName = $('#merchantName').val();
    var merchantSort = $('#merchantSort').val();
    var merchantRate = $('#merchantRate').val();
    var royaltyRate = $('#royaltyRate').val();
    var merchantAttribute = $('#merchantAttribute').val();
	var remark = $("input[name='remark']").val();
	$.ajax({
		cache : true,
		type : "POST",
		url : "save",
		data : {
			"userName": userName,
			"merchantName": merchantName,
            "merchantSort": merchantSort,
            "merchantRate": merchantRate,
            "royaltyRate": royaltyRate,
            "merchantAttribute": merchantAttribute,
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
