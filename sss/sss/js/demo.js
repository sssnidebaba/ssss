function load()			//加载主页
{
	setInterval(nextImage,4000);			//设置定时器，图片自动轮播
	
	/*******鼠标滑过焦点图，显示切换按钮*******/
	var img = document.getElementById("focus_img");
	var L = document.getElementById("switchL_img");
	var R = document.getElementById("switchR_img");
	R.onmouseover = L.onmouseover = img.onmouseover = (function(){
		L.style.display = "block";
		R.style.display = "block";
	});
	
	/*******鼠标移出，隐藏按钮*******/
	R.onmouseout = L.onmouseout = img.onmouseout = (function(){
		L.style.display = "none";
		R.style.display = "none";
	});
	L.onclick = lastImage;			//点击更换为上一张
	R.onclick = nextImage;			//点击更换为下一张
}

/*******切换为上一张图片******/
function lastImage()		
{
	var N = 3;		//图片张数，可修改
	var img = document.getElementById("focus_img");
	var imgName = img.src;
	var index = imgName.substr(imgName.length - 5,1);
	if(--index == 0)
		index = N;
	$("#focus_img").fadeOut("slow",function(){
		$(this).attr("src","img/chief_" + index + ".jpg");
		$(this).fadeIn("slow");
	});
}
/*******切换下上一张图片******/
function nextImage()
{
	var N = 3;		//图片张数，可修改
	var img = document.getElementById("focus_img");
	var imgName = img.src;
	var index = imgName.substr(imgName.length - 5,1);
	if(++index == N + 1)
		index = 1;
	$("#focus_img").fadeOut("quick",function(){
		$(this).attr("src","img/chief_" + index + ".jpg");
		$(this).fadeIn("quick");
	});
}

//加载验证码
function reloadImage(){ 
	document.getElementById("randImage").src = "image.jsp?"+Math.random(); 
} 
//检查用户名
var isPassRight = false;
var isUserRight = false;
function check_user(){
	var user=document.getElementById("user");
	var pass=document.getElementById("password");
	var tip=document.getElementById("tip");
	var patt=/^\w+$/;
	if (user.value=="") {
		tip.innerHTML="用户名不能为空！";
		document.getElementById("login_button").disabled=true;
		isUserRight = false;
	} else if(!patt.test(user.value)){
		tip.innerHTML="用户名只能由字母、数字和下划线组成";
		document.getElementById("login_button").disabled=true;
		isUserRight = false;
	} else if(user.value.length < 6 || user.value.length > 10){
		tip.innerHTML="用户名为6-10位";
		document.getElementById("login_button").disabled=true;
		isUserRight = false;
	}
	else{
		tip.innerHTML="用户名格式正确√";
		if(isPassRight)
			document.getElementById("login_button").disabled=false;
		isUserRight = true;
	}
}
//检查密码
function check_pass(){
	var pass=document.getElementById("password").value;
	var tip=document.getElementById("tip2");
	if(pass.length > 5 && pass.length < 11)
	{
		if(isUserRight)
			document.getElementById("login_button").disabled=false;
		tip.innerHTML="密码格式正确√";
		isPassRight = true;
	}
	else{
		document.getElementById("login_button").disabled=true;
		tip.innerHTML = "密码为6-10位数字、字母或“_”";
		isPassRight = false;
	}
}

//显示注册层
function showRegist(){
	var cov = document.getElementById("cover");
	var reg = document.getElementById("regist");
	cov.style.display = "block";
	reg.style.display = "block";
	
	/****加载切换按钮***/
	var user = document.getElementById("userRegist");
	var owner = document.getElementById("ownerRegist");
	user.style.color="red";
	user.onclick = (function(){
		user.style.color="red";
		owner.style.color="#BBBBBB"
	});
	owner.onclick = (function(){
		user.style.color="#BBBBBB";
		owner.style.color="red";
	});
}
//关闭注册层
function closeRegist(){
	var cov = document.getElementById("cover");
	var reg = document.getElementById("regist");
	cov.style.display = "none";
	reg.style.display = "none";
}

//改变分类
function change(x){
	
	var g1 = image("goods.jsp?gname=可比克薯片&ownid=20153236","img/kebike.jpg","可比克薯片",6.9);
	var g2 = image("goods.jsp?gname=妙芙蛋糕&ownid=20153236","img/miaofu.jpg","妙芙蛋糕",15.5);
	var g3 = image("goods.jsp?gname=友臣肉松饼&ownid=20153236","img/rousongbing.jpg","友臣肉松饼",25.6);
	var g4 = image("goods.jsp?gname=猪肉脯&ownid=20153236","img/zhuroufu.jpg","猪肉脯",12.5);
	var g5 = image("goods.jsp?gname=爱尚咪咪虾条&ownid=20163594","img/xiatiao.png","爱尚咪咪虾条",9.90);
	var g6 = image("goods.jsp?gname=港荣蒸蛋糕&ownid=20163594","img/cake.jpg","港荣蒸蛋糕",38.20);
	var g7 = image("goods.jsp?gname=好丽友派&ownid=20163594","img/haoliyou.jpg","好丽友派",15.90);
	var g8 = image("goods.jsp?gname=乐事无限薯片&ownid=20163594","img/leshi.png","乐事无限薯片",19.90);
	var g9 = image("goods.jsp?gname=良品天津麻花&ownid=20163594","img/mahua.png","良品天津麻花",10.50);
	var g10 = image("goods.jsp?gname=PK脆Q薯条锅巴&ownid=20163620","img/PK_Q.jpg","PK脆Q薯条锅巴",11.80);
	var g11 = image("goods.jsp?gname=港荣奶香蒸蛋糕&ownid=20163620","img/naixiang.jpg","港荣奶香蒸蛋糕",9.90);
	var g12 = image("goods.jsp?gname=红牛维生素饮料&ownid=20163620","img/hongniu.jpg","红牛维生素饮料",6.00);
	var g13 = image("goods.jsp?gname=可口可乐(小)&ownid=20163620","img/cola.jpg","可口可乐(小)",2.5);
	var g14 = image("goods.jsp?gname=内蒙古奶制品&ownid=20163620","img/naitiao.jpg","内蒙古奶制品",16.80);
	var g15 = image("goods.jsp?gname=饼干芝士玉米棒&ownid=20163620","img/nailao.jpg","饼干芝士玉米棒",10.80);
	var g16 = image("goods.jsp?gname=俏嘴巴鸡爪&ownid=20163620","img/qiaozuiba.jpg","俏嘴巴鸡爪",9.90);
	var g17 = image("goods.jsp?gname=全麦面包&ownid=20163620","img/quanmai.jpg","全麦面包",7.90);
	var g18 = image("goods.jsp?gname=蔬菜味手指饼干&ownid=20163620","img/shouzhi.jpg","蔬菜味手指饼干",13.80);
	var g19 = image("goods.jsp?gname=哇哈哈AD钙&ownid=20163620","img/AD.jpg","哇哈哈AD钙",1.69);
	var g20 = image("goods.jsp?gname=旺旺小小酥&ownid=20163620","img/wangwang.jpg","旺旺小小酥",10.50);

	
	$(".goodss").fadeOut();
	if(x == 1){
		$(".goodss").fadeOut(1000,function(){
			$(".goodss").eq(1).html(g2);
			$(".goodss").eq(2).html(g3);
			$(".goodss").eq(3).html(g4);
			$(".goodss").eq(4).html(g5);
			
		})
	}else if(x == 2){
		$(".goodss").fadeOut(1000,function(){
			$(".goodss").eq(0).html(g6);
			$(".goodss").eq(1).html(g7);
			$(".goodss").eq(2).html(g8);
			$(".goodss").eq(3).html(g9);
			
		})
	}else if(x == 3){
		$(".goodss").fadeOut(1000,function(){
			$(".goodss").eq(0).html(g2);
			$(".goodss").eq(1).html(g3);
			$(".goodss").eq(2).html(g4);
			$(".goodss").eq(3).html(g5);
			
		})
	}else if(x == 4){
		$(".goodss").fadeOut(1000,function(){
			$(".goodss").eq(0).html(g6);
			$(".goodss").eq(1).html(g7);
			$(".goodss").eq(2).html(g8);
			$(".goodss").eq(3).html(g9);
			
		})
	}else if(x == 5){
		$(".goodss").fadeOut(1000,function(){
			$(".goodss").eq(0).html(g10);
			$(".goodss").eq(1).html(g11);
			$(".goodss").eq(2).html(g12);
			$(".goodss").eq(3).html(g13);
			
		})
	}else if(x == 6){
		$(".goodss").fadeOut(1000,function(){
			$(".goodss").eq(0).html(g14);
			$(".goodss").eq(1).html(g15);
			$(".goodss").eq(2).html(g16);
			$(".goodss").eq(3).html(g17);
			
		})
	}else if(x == 7){
		$(".goodss").fadeOut(1000,function(){
			$(".goodss").eq(0).html(g18);
			$(".goodss").eq(1).html(g19);
			$(".goodss").eq(2).html(g20);
			$(".goodss").eq(3).html(g1);
		})
	}
	
	x = x * 120 - 50;
	var line = $("#line");
	line.animate({left:x + 'px'},"fast");

	$(".goodss").fadeIn();
	
	/*var conn = new ActiveXObject("ADODB.Connection"); 
    // Data Source=数据库地址; User ID=数据库用户名; Password=数据库密码; Initial Catalog=数据库名称。 
    conn.Open("Provider=SQLOLEDB.1; Data Source=192.168.1.252,1433; User ID=king; Password=sa; Initial Catalog=OrderSys");       //打开数据库 
    alert(conn);
    return conn; */
}

function image(url,path,intro,price){
	return 		"<a href='" + url + "'>" + 
				"<img src='" + path + "' width='150px' height='150px'><br>" + intro +
            	"<br></a>" + 
            	"<b>￥" + price + "</b>";
}

//隐藏搜索图标
function hideSearch(){
	//alert();
	$("#search_text").css('background','none');
}

function like(){
	var s = $("#like").html();
	var p = s.lastIndexOf(">") + 1;
	var count = parseInt(s.substr(p));
	count = count + 1;
	$("#like").html(s.substr(0,p) + count.toString());
}