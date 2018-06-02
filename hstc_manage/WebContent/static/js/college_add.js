$(function(){
	$('.skin-minimal input').iCheck({
	    checkboxClass: 'icheckbox-blue',
	    radioClass: 'iradio-blue',
	    increaseArea: '20%'
	});
	$("#form-college-add").validate({
	    rules: {
	       /* author: {
	            required: true,
	        }*/
	    },
	    onkeyup: false,
	    focusCleanup: true,
	    success: "valid",
	    submitHandler: function(form) {
	        $(form).ajaxSubmit({
	            type: 'post',
	            url: "/hstc_manage/uploadImage?url=college_add",
	            success: function(data) {
	            	if(data == "true"){
	            		layer.msg('添加学院信息成功!', {
		                    icon: 1,
		                    time: 3000
		                });
	            	}
	            },
	            error: function(XmlHttpRequest, textStatus, errorThrown) {
	                layer.msg('没有选择图片或者上传图片error!', {
	                    icon: 1,
	                    time: 1000
	                });
	            }
	        });
	    }
	});
});