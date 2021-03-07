function checkname(source){
		/*****输入文本框变色******/
		//check name
		var name = document.getElementById("TxtUserName").value;
		if(name!=null && name!=""){
			document.getElementById("s_name").innerHTML="<font>OK</font>";
		}else{
			document.getElementById("s_name").innerHTML="<font>用户名不能为空</font>";
		}
	}

function checkpwd(source){
	/*****输入文本框变色******/
	//check name
	var pwd = document.getElementById("TxtPassword").value;
	if(pwd!=null && pwd!=""){
		document.getElementById("s_name2").innerHTML="<font>OK</font>";
	}else{
		document.getElementById("s_name2").innerHTML="<font>密码不能为空</font>";
	}
}