<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>用户信息</title>
		<jsp:include page="head.jsp" flush="true" />
		<link href="css/myInfo.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/message.js"></script>
	</head>
	<body onload="show()">
		<form action="customer!modify" method="post" name="Modify">
			<div id="container">
				<div id="modify">
					<div class="nav_c" style="float: left; width: 200; clear: left;">
						<span>修改信息</span>
					</div>
					<div class="nav_v" style="float: left; width: 300"></div>
					<div
						style="border: solid 1px #A9A9F5; border-top-width: 0; width: 500px;">
						<table width="100%" height="300">
							<tr>
								<td class="first">
									用户名
									<input type="hidden" name="message"
										value='<s:property value="#request.error" />' />
								</td>
								<td class="middle">
									<s:property value="#session.customer.name" />
								</td>

							</tr>
							<tr>
								<td class="first">
									密码
								</td>
								<td class="middle">
									<input type="password" name="password" style="width: 200PX"
										value='<s:property value="#session.customer.password"/>' />
								</td>

							</tr>
							<tr>
								<td class="first">
									确认密码
								</td>
								<td class="middle">
									<input type="password" name="repwd" style="width: 200PX" />
								</td>

							</tr>


							<tr>
								<td class="first">
									注册邮箱
								</td>
								<td class="middle">
									<input type="text" name="email" style="width: 200PX"
										value='<s:property value="#session.customer.email"/>' />
								</td>

							</tr>
							<tr>
								<td class="first">
									手机
								</td>
								<td class="middle">
									<input type="text" name="phone" style="width: 200PX"
										value='<s:property value="#session.customer.phone"/>' />
								</td>
							</tr>
							<tr>
								<td class="first">
									家庭地址
								</td>
								<td class="middle">
									<input type="text" name="address" style="width: 200PX"
										value='<s:property value="#session.customer.address"/>' />
								</td>
							</tr>
							<tr>
								<td class="first">

								</td>
								<td class="middle">
									<img alt="submit" src="images/submit.jpg" onclick=
	submit()
>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div style="float: left; margin: 10px 10 0 10;">
					<img src="images/modify_bg.jpg" width="465px" border="0"
						height="335" />
				</div>
				<center>
					<div style="margin: 10px 0 10 0; width: 980px;">
						<img src="images/middle_banner.jpg" width="980px" />
					</div>
				</center>
			</div>
		</form>
	</body>
	<jsp:include page="foot.jsp" flush="true" />
</html>