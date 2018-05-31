/**
 *  加载副文本编辑器 
 */
$(function(){
	KindEditor.ready(function(K) {
	    var editor1 = K.create('textarea[name="text"]', {           /* 统一的 textarea 的 name 值 */
	        cssPath:'/hstc_manage/lib/kindeditor/plugins/code/prettify.css',
	        filePostName: "file",                                   /* UploadController  MultipartFile file*/
	        uploadJson: '/hstc_manage/kindEditorUpload',
	        allowFileManager: false,
	        allowImageUpload: true,
	        //上传图片框本地上传的功能，false为隐藏，默认为true
	        allowImageRemote: false,
	        //上传图片框网络图片的功能，false为隐藏，默认为true
	        resizeType: 0,
	        afterCreate: function() {
	            var self = this;
	            this.sync();
	            K.ctrl(document, 13,
	            function() {
	                self.sync();
	                document.forms['myform'].submit();               /* 统一的 form 的 name 值 */
	            });
	            K.ctrl(self.edit.doc, 13,
	            function() {
	                self.sync();
	                document.forms['myform'].submit();
	            });
	        },
	        afterBlur: function() {
	            this.sync();
	        } //失去焦点后，将内容写入textarea中
	    });
	    prettyPrint();
	});
})