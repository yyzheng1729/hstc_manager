$(function(){
	/*展示相关数据到页面*/
	var urls = "displayAllUser/"+1;
	$.ajax({
		type:"POST",
        url: urls, 
        dataType:"json",
        scriptCharset:"utf-8",
        success:function(data){ 
        	display_paging(data);
        },
        error:function() {
            alert("信息获取失败，显示不出来！");
        }
    });
});

function display_paging(data){
	display(data.tbuser);
	/*分页功能*/
	var totalPage=data.totalPage;/*总页数*/
	var totalData=data.totalData;/*总数据*/
    $('#box').paging({
        initPageNo: 1, // 初始页码
        totalPages: totalPage, //总页数
        totalCount: '合计' + totalData + '条数据', // 条目总数
        slideSpeed: 600, // 缓动速度。单位毫秒
        jump: true, //是否支持跳转
        callback: function(page) { // 回调函数
            console.log(page);
        }
    });
};

function display(data){
	var str = "";
	var tbody=window.document.getElementById("tbody"); 
	var uname;
	var sex;
	var age;
	var phoneNumber;
	var birthday;
	for(i in data){
		if(data[i].uname == null){
			uname = "";
		}else{
			uname = data[i].uname;
		}
		if(data[i].sex == null){
			sex = "";
		}else{
			sex =data[i].sex;
		}
		if(data[i].age == null){
			age = "";
		}else{
			age =data[i].age;
		}
		if(data[i].phoneNumber == null){
			phoneNumber = "";
		}else{
			phoneNumber =data[i].phoneNumber;
		}
		if(data[i].birthday == null){
			birthday = "";
		}else{
			birthday =data[i].birthday;
		}
		str += "<tr id='option"+data[i].uid+"'>" +
           "<td>"+data[i].uid+"</td>" +  
           "<td>" +uname + "</td>" +  
           "<td>" + sex+ "</td>" + 
           "<td>" + age+ "</td>" + 
           "<td>" + phoneNumber+ "</td>" +
           "<td>" + birthday+ "</td>" +
           "<td>"+
           "<div class='button-group'> <a class='button border-blue' data-toggle='modal' data-target='#editModal' onclick='findById("+data[i].uid+")' ><span class='icon-edit'></span> 编辑</a> </div>"+
           "<div class='button-group'> <a class='button border-red' onclick='delRow("+data[i].uid+")' ><span class='icon-trash-o'></span> 删除</a> </div>"+
           "</td>"+
           "</tr>";
	};
	tbody.innerHTML = str;
};

/*删除当前行的用户信息*/
function delRow(rowIndex){  
    var uid = $("#option"+rowIndex).find("td")[0].innerHTML;
    var urls = "deleteRowUser/"+uid;
    if(confirm("您确定要删除吗?")){
    	$.ajax({
    		type:"POST",
            url: urls, 
            dataType:"json",
            success:function(data){
            	refreshTable();
            },
            error:function(data) {
                alert("删除操作失败！");
            }
        });
    }
};

/*刷新当前表格*/
function refreshTable(){
	$.ajax({
		type:"POST",
        url: "displayAllUser/1", 
        dataType:"json",
        success:function(data){ 
        	display_paging(data);
        },
        error:function() {
            alert("刷新失败！");
        }
    });
};

function findById(uid){
	var urls = "findUser/"+uid;
	$.ajax({
		type:"POST",
		url:urls,
		dataType:"json",
		success:function(data){
			$("#hidden_uid").val(data.uid);
			$("#Eusername").val(data.uname);
			$("#Etelephone").val(data.phoneNumber);
			$("#Epassword").val(data.password);
			$("#Eflatpickr-tryme").val(data.birthday);
			$("#Eage").val(data.age);
			$("#Esex").val(data.sex);
		},
		error:function(){
			alert("编辑框信息获取失败！");
		}
	});
}