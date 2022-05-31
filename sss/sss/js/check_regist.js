var isUserRight = false;
var isPassRight = false;
var isPass2Right = false;
var isNameRight = false;
var isPhoneRight = false;
var isDormitoryRight = false;
var isRoomNumberRight = false;

function load(){
	checkAll();
	if($("#id").val()!="")
		check_user();
	if($("#pass").val()!="")
		check_pass();
	if($("#pass2").val()!="")
		checkPass2();
	if($("#name").val() != "")
		checkName();
	if($("#phone").val() != "")
		checkPhone();
	if($("#dormitory").val()!="")
		checkDormitory();
	if($("#roomnumber").val()!="")
		checkRoomnumber();
};

function checkUser(){
	var str = $("#id").val();
	var patt=/^\w+$/;
	if(str.length > 10 || str.length < 6 || !patt.test(str))
	{
		$(".tip").eq(0).html("×");
		$(".tip").eq(0).css({"color":"red"});
		$(".tip").eq(0).attr("title",'账号由6-10个英文字符、数字或"_"组成');
		isUserRight = false;
	}
	else{
		$(".tip").eq(0).html("√");
		$(".tip").eq(0).css({"color":"green"});
		isUserRight = true;
	}
	checkAll();
}
function checkPass(){
	var pass = $("#pass").val();
	var pass2 = $("#pass2").val();
	if(pass.length <= 5 || pass.length >= 11)
	{
		$(".tip").eq(1).html("×");
		$(".tip").eq(1).css({"color":"red"});
		$(".tip").eq(1).attr("title",'请设置6-10位字符的密码');
		isPassRight = false;
	}
	else {
		$(".tip").eq(1).html("√");
		$(".tip").eq(1).css({"color":"green"});
		$(".tip").eq(1).attr("title",'');
		isPassRight = true;
	}
	if(pass2.length != 0)
	{
		if(pass == pass2){
			$(".tip").eq(2).html("√");
			$(".tip").eq(2).attr("title",'');
			isPass2Right = true;
		}
		else
		{
			$(".tip").eq(2).html("×");
			$(".tip").eq(2).css({"color":"red"});
			$(".tip").eq(2).attr("title",'两次输入密码不一致');
			isPass2Right = false;
		}
	}
	checkAll();
}

function checkPass2(){
	if($(".tip").eq(1).html() == "√"){
		var pass = $("#pass").val();
		var pass2 = $("#pass2").val();
		if(pass == pass2){
			$(".tip").eq(2).html("√");
			$(".tip").eq(2).css({"color":"green"});
			$(".tip").eq(2).attr("title",'');
			isPass2Right = true;
		}
		else
		{
			$(".tip").eq(2).html("×");
			$(".tip").eq(2).css({"color":"red"});
			$(".tip").eq(2).attr("title",'两次输入密码不一致');
			isPass2Right = false;
		}
	}
	checkAll();
}

function checkName(){
	if($("#name").val() == ""){
		$(".tip").eq(4).html("×");
		$(".tip").eq(4).css({"color":"red"});
		$(".tip").eq(4).attr("title",'昵称不能为空');
		isNameRight = false;
	}
	else{
		$(".tip").eq(4).html("√");
		$(".tip").eq(4).css({"color":"green"});
		$(".tip").eq(4).attr("title",'');
		isNameRight = true;
	}
	checkAll();
}
function checkPhone(){
	var str = $("#phone").val();
	var patt = /^1[3|4|5|8][0-9]\d{4,8}$/;
	if(!patt.test(str))
	{
		$(".tip").eq(5).html("×");
		$(".tip").eq(5).css({"color":"red"});
		$(".tip").eq(5).attr("title",'手机号码格式不正确');
		isPhoneRight = false;
	}
	else{
		$(".tip").eq(5).html("√");
		$(".tip").eq(5).css({"color":"green"});
		isPhoneRight = true;
	}
	checkAll();
}

function checkDormitory(){
	var num = parseInt($("#dormitory").val());
	if(!num){
		$(".tip").eq(6).html("×");
		$(".tip").eq(6).css({"color":"red"});
		isDormitoryRight = false;
		$(".tip").eq(6).attr("title",'楼号不能为空');
	}else if(num > 25 || num <1){
		$(".tip").eq(6).html("×");
		isDormitoryRight = false;
		$(".tip").eq(6).css({"color":"red"});
		$(".tip").eq(6).attr("title",'没有此号楼');
	}else{
		$(".tip").eq(6).html("√");
		$(".tip").eq(6).css({"color":"green"});
		isDormitoryRight = true;
		$(".tip").eq(6).attr("title",'');
	}
	checkAll();
}
function checkRoomnumber(){
	var num = parseInt($("#roomnumber").val());
	if(!num){
		$(".tip").eq(7).html("×");
		isDormitoryRight = false;
		$(".tip").eq(7).css({"color":"red"});
		$(".tip").eq(7).attr("title",'宿舍号不能为空');
	}else if(num > 700 || num <1){
		$(".tip").eq(7).html("×");
		isRoomNumberRight = false;
		$(".tip").eq(7).css({"color":"red"});
		$(".tip").eq(7).attr("title",'没有此号宿舍');
	}else{
		$(".tip").eq(7).html("√");
		isRoomNumberRight = true;
		$(".tip").eq(7).css({"color":"green"});
		$(".tip").eq(7).attr("title",'');
	}
	checkAll();
}

function checkAll(){
	//alert(a.html());
	var flag = isUserRight + isPass2Right + isPassRight + isNameRight + isPhoneRight + isDormitoryRight + isRoomNumberRight;
	//document.getElementById("test").innerHTML = flag;
	//alert(flag);
	if(flag == 7){
		$("#regBtn").removeAttr("disabled")
		//alert(flag);
	}else {
		$("#regBtn").attr("disabled","disabled");
		//alert($("#regBtn").attr("disabled"));
	}
}
