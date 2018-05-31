/*
 *  默认排序
 *  
 *  ajax 动态加载数据
 *  
 *  新闻的编辑
 *  
 *  新闻的删除
 */

$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"pading":false,
	"lengthChange": false,
    "searching": false,
	"aoColumnDefs": [
	  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	  {"orderable":false,"aTargets":[0,1,2,3,4,5,6,7,8,9]}// 不参与排序的列
	]
});
