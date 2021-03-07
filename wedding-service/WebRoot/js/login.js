$(document).ready(function(){

   var uname=$("#tusername");
   var upwd=$("#tpassword");
   uname.val()=="" ;
   upwd.val()=="" ;
   uname.focus(function(){

		var tip = $(this).parent().next();
		tip.text("请输入用户名（必填）！");
		tip.removeClass().addClass("tips_focus");
	});
   uname.blur(function(){
	 
	var tip = $(this).parent().next();
	if($(this).val() == "") {
		tip.removeClass().addClass("tips_error");
		tip.text("用户名不能为空，请确认!");		
	} else {
		tip.removeClass().addClass("tips_correct");
		tip.text("用户名合法");
	}
});
   upwd.focus(function(){

		var tip = $(this).parent().next();
		tip.text("请输入密码（必填）！");
		tip.removeClass().addClass("tips_focus");
	});
   upwd.blur(function(){
	 
	var tip = $(this).parent().next();
	if($(this).val() == "") {
		tip.removeClass().addClass("tips_error");
		tip.text("密码不能为空请确认!");		
	} else {
		tip.removeClass().addClass("tips_correct");
		tip.text("密码合法");
	}
});
   $("form:first").submit(function() {
	    for(var i = 4;i <=5;i++) {
			if(document.getElementById("loginobj").rows[i].childNodes[2].className != "tips_correct") 
					return false;
		  }
	  
	   
	});
});