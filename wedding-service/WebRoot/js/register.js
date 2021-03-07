$(document).ready(function(){ 
	
	var uname=$("#rusername");
	var upwd=$("#rpassword");
	var upwd1=$("#rpassword1");
	var ufname=$("#rfamilyname");
	var ugname=$("#rgivenname");
	var uphone=$("#rphone");
	var uemail=$("#remail");
	
    uname.val()=="" ;
	upwd.val()=="" ;
	upwd1.val()=="" ;
	ufname.val()=="";
	ugname.val()=="";
	uphone.val()=="";
	uemail.val()=="";

	   uname.focus(function(){

			var tip = $(this).parent().next();
			tip.text("请输入用户名（必填）！");
			tip.removeClass().addClass("tips_focus");
		});
	   uname.blur(function(){ 
		var tip = $(this).parent().next();
		var filter =/^[a-zA-Z_0-9]{4,15}/;
		if($(this).val() == "") {
			tip.removeClass().addClass("tips_error");
			tip.text("用户名不能为空，请确认!");		
		} else if(filter.test($(this).val())){
			tip.removeClass().addClass("tips_correct");
			tip.text("");	
		}
		
		else {
			
			tip.removeClass().addClass("tips_error");
			tip.text("用户名以字母、数字、及“_”开头，长度为4-15位!");	
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
		}
		
		else {
		
			tip.removeClass().addClass("tips_correct");
			tip.text("");
		 }
	});
	   upwd1.focus(function(){

			var tip = $(this).parent().next();
			tip.text("与密码必须一致（必填）！");
			tip.removeClass().addClass("tips_focus");
		});
	   upwd1.blur(function(){
		 
		var tip = $(this).parent().next();
		if($(this).val() == "") {
			tip.removeClass().addClass("tips_error");
			tip.text("确认密码不能为空请确认!");		
		}else if($(this).val()!=upwd.val()) {
			tip.removeClass().addClass("tips_error");
			tip.text("请和密码保持一致!");		
		}
		else {
			tip.removeClass().addClass("tips_correct");
			tip.text("");
		}
	});
	   ufname.focus(function(){

			var tip = $(this).parent().next();
			tip.text("请输入姓（必填）！");
			tip.removeClass().addClass("tips_focus");
		});
	   ufname.blur(function(){ 
		var tip = $(this).parent().next();
		if($(this).val() == "") {
			tip.removeClass().addClass("tips_error");
			tip.text("姓不能为空，请确认!");		
		} 
		
		else {
			
			tip.removeClass().addClass("tips_correct");
			tip.text("");
		 }
	});
		ugname.focus(function(){

			var tip = $(this).parent().next();
			tip.text("请输入名字（必填）！");
			tip.removeClass().addClass("tips_focus");
		});
	   ugname.blur(function(){ 
		var tip = $(this).parent().next();
		if($(this).val() == "") {
			tip.removeClass().addClass("tips_error");
			tip.text("名字不能为空，请确认!");		
		} 
		
		else {
			
			tip.removeClass().addClass("tips_correct");
			tip.text("");
		 }
	   });
   uemail.focus(function(){
		var tip = $(this).parent().next();
		tip.text("请输入邮箱号（必填）");

		tip.removeClass().addClass("tips_focus");
	});
   uemail.blur(function(){
	var tip = $(this).parent().next();
	var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if($(this).val() == "") {
		tip.removeClass().addClass("tips_error");
		
		tip.text("邮箱不能为空，请确认!");		
	} else if(filter.test($(this).val())){
		tip.removeClass().addClass("tips_correct");
		tip.text("");	
	}
	
	else {
		
		tip.removeClass().addClass("tips_error");
		tip.text("邮箱格式不正确，请确认!");	
	 }
   });
   uphone.focus(function(){
		var tip = $(this).parent().next();
		tip.text("请输入手机号（必填）");

		tip.removeClass().addClass("tips_focus");
	});
   uphone.blur(function(){
	var tip = $(this).parent().next();
	 var filter  = /^1+[0-9]{10}/;
	if($(this).val() == "") {
		tip.removeClass().addClass("tips_error");
		
		tip.text("手机不能为空，请确认!");		
	} else if(filter.test($(this).val())){
		tip.removeClass().addClass("tips_correct");
		tip.text("");	
	}
	
	else {
		
		tip.removeClass().addClass("tips_error");
		tip.text("手机号格式不正确！");	
	 }
  });
   $("form:first").submit(function() {
	    for(var i = 1;i <=9;i++) {
			if(document.getElementById("registerobj").rows[i].childNodes[2].className != "tips_correct") 
					return false;
		  }
	  
	   
	});
});