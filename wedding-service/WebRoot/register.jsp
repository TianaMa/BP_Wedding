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
		<title>注册</title>
		<jsp:include page="head.jsp" flush="true" />
		<link href="css/register.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/message.js"></script>
		<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="js/register.js"></script>
	<link rel="stylesheet" href="css/common.css" type="text/css"></link></head>
	<body onload="show()">
		<form action="customer!register" method="post" name="Register">
			<div id="rcontainer">
				<ul>
					<li>
						基本资料
					</li>
				</ul>
				<hr width="80%" size="2px;" color="#A9A9F5">
				<table height="150px">
					<tr>
						<td class="first">
							用户名
							<input type="hidden" id="message"
								value='<s:property value="#request.error" />' />
						</td>
						<td class="middle">
							<input type="text" name="name" id="rusername" style="width: 200" />
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="first">
							密码
						</td>
						<td class="middle">
							<input type="password" name="password" id="rpassword" style="width: 200" />
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="first">
							确认密码
						</td>
						<td class="middle">
							<input type="password" name="repwd" id="rpassword1" style="width: 200" />
						</td>
						<td></td>
					</tr>
				</table>
				<ul>
					<li>
						完善资料
					</li>
				</ul>
				<hr width="80%" size="2px;" color="#A9A9F5">
				<table height="200px">
					<tr>
						<td class="first">
							手机
						</td>
						<td class="middle">
							<input type="text" name="phone" id="rphone" style="width: 200" />
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="first">
							注册邮箱
						</td>
						<td class="middle">
							<input type="text" name="email" id="remail" style="width: 200" />
						</td>
						<td></td>
					</tr>

					<tr>
						<td class="first">
							家庭地址
						</td>
						<td class="middle">
							<input type="text" name="address" id="rfamilyname" style="width: 200" />
						</td>
						<td></td>
					</tr>
				</table>
				<img alt="submit" src="images/submit.jpg" onclick=
	submit()
>
			</div>
		</form>
	</body>
	<jsp:include page="foot.jsp" flush="true" />
</html>