<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/jquery.chili-1.7.pack.js"></script>
		<script type="text/javascript" src="js/jquery.easing.js"></script>
		<script type="text/javascript" src="js/jquery.dimensions.js"></script>
		<script type="text/javascript" src="js/jquery.accordion.js"></script>
		<script language="javascript">
	jQuery().ready(function() {
		jQuery('#navigation').accordion( {
			header : '.head',
			navigation1 : true,
			event : 'click',
			fillSpace : true,
			animated : 'bounceslide'
		});
	});
</script>
		<style type="text/css">
<!--
body {
	margin: 0px;
	padding: 0px;
	font-size: 12px;
}

#navigation {
	margin: 0px;
	padding: 0px;
	width: 147px;
}

#navigation a.head {
	cursor: pointer;
	background: url(images/main_34.gif) no-repeat scroll;
	display: block;
	font-weight: bold;
	margin: 0px;
	padding: 5px 0 5px;
	text-align: center;
	font-size: 12px;
	text-decoration: none;
}

#navigation ul {
	border-width: 0px;
	margin: 0px;
	padding: 0px;
	text-indent: 0px;
}

#navigation li {
	list-style: none;
	display: inline;
}

#navigation li li a {
	display: block;
	font-size: 12px;
	text-decoration: none;
	text-align: center;
	padding: 3px;
}

#navigation li li a:hover {
	background: url(images/tab_bg.gif) repeat-x;
	border: solid 1px #adb9c2;
}
-->
</style>
	</head>
	<body>
		<div style="height: 100%;">
			<ul id="navigation">
				<li>
					<a class="head">管理员管理</a>
					<ul>
						<li>
							<a href="<%=path %>/msadmin.jsp" target="rightFrame">【添加】</a>
						</li>
						<li>
							<a href="<%=path %>/admin!showAll" target="rightFrame">【查看/修改/删除】</a>
						</li>
					</ul>
				</li>
				<li>
					<a class="head">公司管理</a>
					<ul>
						<li>
							<a href="<%=path %>/mscompany.jsp" target="rightFrame">【添加】</a>
						</li>
						<li>
							<a href="<%=path %>/company!showAll" target="rightFrame">【查看/修改/删除】</a>
						</li>
					</ul>
				</li>
				
				<li>
					<a class="head">酒店管理</a>
					<ul>
						<li>
							<a href="<%=path %>/hotel!show" target="rightFrame">【添加】</a>
						</li>
						<li>
							<a href="<%=path %>/hotel!showAll" target="rightFrame">【查看/修改/删除】</a>
						</li>
					</ul>
				</li>
				<li>
					<a class="head">单项管理</a>
					<ul>
						<li>
							<a href="<%=path %>/server!show" target="rightFrame">【添加】</a>
						</li>
						<li>
							<a href="<%=path %>/server!showAll" target="rightFrame">【查看/修改/删除】</a>
						</li>
					</ul>
				</li>
				
				<li>
					<a class="head">版本信息</a>
					<ul>
						<li>
							<a>By mary</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</body>
</html>