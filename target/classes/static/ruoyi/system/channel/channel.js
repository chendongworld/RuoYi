var prefix = "/system/channel"

$(function() {
	var columns = [{
            checkbox: true
        },
        {
            field: 'channelId',
            title: '渠道编号'
        },
        {
            field: 'channelName',
            title: '渠道名称'
        },
        {
            field: 'channelAttribute',
            title: '渠道属性'
        },
        {
            field: 'channelSort',
            title: '显示顺序'
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
				actions.push('<a class="btn btn-primary btn-sm ' + editFlag + '" href="#" title="编辑" mce_href="#" onclick="edit( \'' + row.channelId + '\')"><i class="fa fa-edit"></i></a> ');
				actions.push('<a class="btn btn-warning btn-sm ' + removeFlag + '" href="#" title="删除" onclick="remove(\'' + row.channelId + '\')"><i class="fa fa-remove"></i></a>');
				return actions.join('');
            }
        }];
	var url = prefix + "/list";
	$.initTable(columns, url);
});

/*角色管理-新增*/
function add() {
    var url = prefix + '/add';
    layer_show("新增渠道", url, '800', '550');
}

/*角色管理-修改*/
function edit(channelId) {
    var url = prefix + '/edit/' + channelId;
    layer_show("修改渠道", url, '800', '550');
}

// 单条删除
function remove(id) {
	$.modalConfirm("确定要删除选中角色吗？", function(r) {
		_ajax(prefix + "/remove/" + id, "", "post", r);
    })
}

// 批量删除
function batchRemove() {
	var rows = $.getSelections("channelId");
	alert(rows)
	if (rows.length == 0) {
		$.modalMsg("请选择要删除的数据", "warning");
		return;
	}
	$.modalConfirm("确认要删除选中的" + rows.length + "条数据吗?", function(r) {
		_ajax(prefix + '/batchRemove', { "ids": rows }, "post", r);
	});
}
