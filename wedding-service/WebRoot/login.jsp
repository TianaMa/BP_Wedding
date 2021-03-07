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
		<title>用户登录</title>
		<jsp:include page="head.jsp" flush="true" />
		<link href="css/login.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/message.js"></script>
		<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="js/login.js"></script>
        
	<link rel="stylesheet" href="css/common.css" type="text/css"></link></head>
	<body onload="show()">
		<form action="customer!login" method="post" name="Login">
			<div id="container">
				<div id="login_l">
					<div class="nav_c" style="width: 200px">
						<span>用户登录</span>
					</div>
					<div class="nav_v" style="width: 300px"></div>
					<div
						style="width: 500px; border: solid 1px #A9A9F5; border-top-width: 0">
						<table width="100%">
							<tr>
								<td width="200px;" align="center" height="60">
									用户名
									<input type="hidden" id="message"
										value='<s:property value="#request.error" />' />
								</td>
								<td>
									<input type="text" style="width: 200" name="name"  id="tusername"/>
								</td>
								<td class="tips_show"  >
								  必填
								</td>
							</tr>
							<tr>
								<td align="center" height="60">
									密 码
								</td>
								<td>
									<input type="password" style="width: 200" name="password"  id="tpassword"/>
								</td>
								<td class="tips_show"  >
								  必填
								</td>
							</tr>
							<tr>
								<td align="center" height="45" colspan="2">

									<img src="images/cancel.gif" border="0" height="35"
										onclick="javascript:reset();" />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<img src="images/login.gif" border="0" height="35"
										onclick="submit();" />
								</td>
							</tr>
							<tr>
								<td colspan="2" height="20"></td>
							</tr>
						</table>
					</div>
				</div>
				<div style="float: left; margin: 10px 10 0 12;">
					<img src="images/l_2.jpg" width="465px" border="0" height="235" />
				</div>
				<center>
					<div style="margin: 30px 0 0 0; width: 980px;">
						<img src="images/center_banner.gif" width="980px" border="0" />
					</div>
				</center>
			</div>
		</form>
	</body>
	<jsp:include page="foot.jsp" flush="true" />
</html>