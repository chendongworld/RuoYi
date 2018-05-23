var prefix = "/system/deal"

$(function() {
	var columns = [{
            checkbox: true
        },
        {
            field: 'dealId',
            title: '交易编号'
        },
        {
            field: 'userName',
            title: '业务员'
        },
        {
            field: 'channelName',
            title: '渠道名称'
        },
        {
            field: 'productName',
            title: '产品名称'
        },
        {
            field: 'merchantName',
            title: '商户名称'
        },
        {
            field: 'sumMoney',
            title: '交易金额'
        },
        {
            field: 'sumProfit',
            title: '利润'
        },
        {
            field: 'userProfit',
            title: '业务提成'
        },
        {
            field: 'createBy',
            title: '创建者'
        },
        {
            field: 'createTime',
            title: '创建时间'
        },
        {
            field: 'updateTime',
            title: '修改时间'
        },
        {
            field: 'remark',
            title: '备注'
        },
        {
            title: '操作',
            align: 'center',
            formatter: function(value, row, index) {
            	var actions = [];
				actions.push('<a class="btn btn-primary btn-sm ' + editFlag + '" href="#" title="编辑" mce_href="#" onclick="edit( \'' + row.dealId + '\')"><i class="fa fa-edit"></i></a> ');
				actions.push('<a class="btn btn-warning btn-sm ' + removeFlag + '" href="#" title="删除" onclick="remove(\'' + row.dealId + '\')"><i class="fa fa-remove"></i></a>');
				return actions.join('');
            }
        }];
	var url = prefix + "/list";
	$.initTable(columns, url);
});

/*角色管理-新增*/
function add() {
    var url = prefix + '/add';
    layer_show("新增交易", url, '800', '550');
}

/*角色管理-修改*/
function edit(dealId) {
    var url = prefix + '/edit/' + dealId;
    layer_show("修改交易", url, '800', '550');
}

// 单条删除
function remove(id) {
	$.modalConfirm("确定要删除选中交易吗？", function(r) {
		_ajax(prefix + "/remove/" + id, "", "post", r);
    })
}

// 批量删除
function batchRemove() {
	var rows = $.getSelections("dealId");
	alert(rows)
	if (rows.length == 0) {
		$.modalMsg("请选择要删除的数据", "warning");
		return;
	}
	$.modalConfirm("确认要删除选中的" + rows.length + "条数据吗?", function(r) {
		_ajax(prefix + '/batchRemove', { "ids": rows }, "post", r);
	});
}
