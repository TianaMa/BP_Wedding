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
		<title>单项预定</title>
		<jsp:include page="head.jsp" flush="true" />
		<link href="css/single.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div id="container" style="margin: 10 0 10 0">
			<div id="leave_top" style="height: 200">
				<div class="nav_c" style="float: left; width: 200; clear: left;">
					<span>单项预定[ <s:if test="#request.server.position=='MC'">司仪</s:if>
						<s:elseif test="#request.server.position=='PlANNER'">策划</s:elseif>
						<s:elseif test="#request.server.position=='WC'">婚车</s:elseif> <s:elseif
							test="#request.server.position=='FLORIST'">花艺师</s:elseif> <s:elseif
							test="#request.server.position=='MP'">化妆师</s:elseif> ]</span>
				</div>
				<div class="nav_v" style="float: left; width: 800"></div>
				<div
					style="border: solid 1px #A9A9F5; border-top-width: 0; width: 1000px; height: 200px">
					<table width="100%" border="0" bordercolor="black" cellpadding="0"
						cellspacing="0" height="200px">
						<tr height="45">
							<td width="20%" rowspan="4">
								<img src="<s:property value="#request.server.picture"/>"
									style="width: 180; height: 180; margin: 10 10 10 10" />
							</td>
							<td width="10%">
								名称
							</td>
							<td width="30%"
								style="font-weight: bold; color: maroon; font-size: 16"
								class="t_sh">
								<s:property value="#request.server.name" />
							</td>
							<td width="10%">
								职位
							</td>
							<td width="30%" class="t_sh">
								<s:if test="#request.server.position=='MC'">司仪</s:if>
								<s:elseif test="#request.server.position=='PlANNER'">策划</s:elseif>
								<s:elseif test="#request.server.position=='WC'">婚车</s:elseif>
								<s:elseif test="#request.server.position=='FLORIST'">花艺师</s:elseif>
								<s:elseif test="#request.server.position=='MP'">化妆师</s:elseif>
							</td>
						</tr>
						<tr height="45">
							<td>
								星级
							</td>
							<td class="t_sh">
								<s:property value="#request.server.grade" />
							</td>
							<td>
								电话
							</td>
							<td class="t_sh">
								<s:property value="#request.server.phone" />
							</td>
						</tr>
						<tr height="45">
							<td>
								价格
							</td>
							<td class="t_sh">
								<s:property value="#request.server.price" />
							</td>
							<td>
								住址
							</td>
							<td class="t_sh">
								<s:property value="#request.server.address" />
							</td>
						</tr>
						<tr height="65">
							<td>
								描述
							</td>
							<td colspan="2" class="t_sh">
								<s:property value="#request.server.description" />
							</td>
							<td colspan="5">
								<img src="images/yy.gif" border="0"
									onclick="javascript:location.href='<%=path%>/customer!shoppingCart?serverId=<s:property value="#request.server.id" />'" />
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div style="margin: 10px 0 0 0; width: 1000px;">
				<img src="images/middle_banner.jpg" width="1000px" />
			</div>
		</div>
	</body>
	<jsp:include page="foot.jsp" flush="true" />
</html>