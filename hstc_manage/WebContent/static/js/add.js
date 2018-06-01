$(function(){
	$('.skin-minimal input').iCheck({
	    checkboxClass: 'icheckbox-blue',
	    radioClass: 'iradio-blue',
	    increaseArea: '20%'
	});
	$("#form-admin-add").validate({
	    rules: {
	    	title: {
	            required: true,
	            minlength: 4,
	            maxlength: 20
	        },
	        author: {
	            required: true,
	        },
	        litimg: {
	            required: true,
	        }
	    },
	    onkeyup: false,
	    focusCleanup: true,
	    success: "valid",
	    submitHandler: function(form) {
	        $(form).ajaxSubmit({
	            type: 'post',
	            url: "/hstc_manage/uploadImage?url=add",
	            success: function(data) {
	            	if(data == "true"){
	            		layer.msg('添加成功!', {
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
})