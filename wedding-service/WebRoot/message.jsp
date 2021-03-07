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
		<title>讨论区</title>
		<jsp:include page="head.jsp" flush="true" />
		<link href="css/message.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<form action="message!reply" method="post" name="Message">
			<div id="container">
				<div id="message">
					<div class="nav_c" style="float: left; width: 200; clear: left;">
						<span>讨论区<s:property value="#request.type" /> </span>
					</div>
					<div class="nav_v" style="float: left; width: 800;"></div>
					<div style="width: 1000px;">
						<div
							style="height: 120; border: 1px solid #A9A9F5; width: 200px; float: left;margin: 10 0 0 0;line-height: 50px">
							楼主：
							<s:property value="#request.message.releaser" /><br/>
							发布时间：
							<s:date name="#request.message.createTime" format="yyyy-MM-dd" />
						</div>
						<div
							style="height: 120; border: 1px solid #A9A9F5; width: 788px; float: right; margin: 10 0 0 0;text-align: center">
							主题：<input type="hidden" name="id" value="<s:property value="#request.message.id" />"/>
							<s:property value="#request.message.subject" />
							<hr width="90%" />
							内容：
							<s:property value="#request.message.description" />
						</div>

						<s:iterator value="#request.message.reply" id="id" status="s">
							<div
								style="height: 120; border: 1px solid #A9A9F5; width: 200px; float: left;margin: 10 0 0 0;line-height: 110px">
								<s:property value="#s.index+1" />
								楼:
								<s:property value="value" />
							</div>
							<div
								style="height: 120; border: 1px solid #A9A9F5; width: 788px; float: right; margin: 10 0 0 0;">
								<s:property value="key" />
							</div>
						</s:iterator>
					</div>
				</div>
				<div style="float: left; margin: 10px 0 0 0;">
					<img src="images/mess_r.jpg" width="480px" border="0"
						height="265" />
				</div>
				<div style="width: 500px; float: right;border: 1px solid #A9A9F5;margin: 10px 0 0 0;text-align: center;">
					<table width="480" height="100%" style="margin: 10px;">
						<tr>
							<td>
								<textarea style="width: 480px; height: 200px"
									style="white-space: pre" name="reply">添加回复内容...</textarea>
							</td>

						</tr>
						<tr height="30px">
							<td align="right">
								<img alt="submit" src="images/submit.jpg" onclick=
	submit()
>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</form>
	</body>
	<jsp:include page="foot.jsp" flush="true" />
</html>