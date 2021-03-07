<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type"
			content="text/html; charset=ISO-8859-1">
		<title>foot</title>
		<style type="text/css">
body {
	font-size: 12px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	text-align: center;
}

#fcontainer {
	margin: 0;
	width: 1000px;
	height: 90px;
	text-align: center;
	vertical-align: middle;
	line-height: 30px;
	border: 1px solid #A9A9F5;
}

#fcontainer a {
	margin-left: 15px;
	margin-right: 15px;
	COLOR: #000; TEXT-DECORATION: none;
}
#fcontainer a:hover {
	margin-left: 15px;
	margin-right: 15px;
	COLOR: #000; TEXT-DECORATION: none;
}
</style>
	</head>
	<body>
		<div id="fcontainer">
			<span><a href="index.jsp">首页</a><a href="showCompany.jsp">婚礼公司</a><a
				href="<%=path%>/">婚宴酒店</a><a href="<%=path%>/">单项预定</a><a
				href="<%=path%>/">婚礼知识</a><a href="<%=path%>/">讨论区</a>
			</span>
			<br />
			<span> Copyright 2012 马丽娜 123456号 版权申明 常年法律顾问:mary
				指定保险公司:太平洋保险</span>
			<br />
			<span> 总部地址：天津工业大学  中国 电话：86-21-123456 56789
				网址:http://www.wedding-service/ 网站建设支持与维护：mary </span>
		</div>
	</body>
</html>