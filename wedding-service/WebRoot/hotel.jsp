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
		<title>酒店预定</title>
		<jsp:include page="head.jsp" flush="true" />
		<link href="css/single.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/Calendarlx.js"></script>
	</head>
	<body>
		<div id="container" style="margin: 10 0 10 0">
			<div id="leave_top" style="height: 200">
				<div class="nav_c" style="float: left; width: 200; clear: left;">
					<span>酒店预定</span>
				</div>
				<div class="nav_v" style="float: left; width: 800"></div>
				<div
					style="border: solid 1px #A9A9F5; border-top-width: 0; width: 1000px; height: 200px">
					<table width="100%" border="0" bordercolor="black" cellpadding="0"
						cellspacing="0" height="200px">
						<tr height="45">
							<td width="40%" rowspan="4">
								<img src="<s:property value="#request.hotel.picture"/>"
									style="width: 380; height: 180; margin: 10 10 10 10" />
							</td>
							<td width="5%">
								名称
							</td>
							<td width="25%"
								style="font-weight: bold; color: maroon; font-size: 16"
								class="t_sh">
								<s:property value="#request.hotel.name" />
							</td>
							<td width="5%">
								<s:iterator value="#request.hotel.scheduled" var="d">
									<input type="hidden"
										value="<s:date format="dd/M/yyyy" name="d"/>" name="sel" />
								</s:iterator>
							</td>
							<td width="25%" class="t_sh">
								<a onclick=
	calendar();
style="color: maroon;">查询已预订日期</a>
							</td>
						</tr>
						<tr height="45">
							<td>
								星级
							</td>
							<td class="t_sh">
								<s:property value="#request.hotel.grade" />
							</td>
							<td>
								电话
							</td>
							<td class="t_sh">
								<s:property value="#request.hotel.phone" />
							</td>
						</tr>
						<tr height="45">
							<td>
								价格
							</td>
							<td class="t_sh">
								<s:property value="#request.hotel.price" />
							</td>
							<td>
								住址
							</td>
							<td class="t_sh">
								<s:property value="#request.hotel.address" />
							</td>
						</tr>
						<tr height="65">
							<td>
								描述
							</td>
							<td colspan="2" class="t_sh">
								<s:property value="#request.hotel.description" />
							</td>
							<td colspan="5">
								<img src="images/yy.gif" border="0"
									onclick="javascript:location.href='<%=path%>/customer!shoppingCart?hotelId=<s:property value="#request.hotel.id" />'" />
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