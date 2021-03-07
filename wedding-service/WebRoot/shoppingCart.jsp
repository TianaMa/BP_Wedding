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
		<title>购物车</title>
		<jsp:include page="head.jsp" flush="true" />
		<link href="css/message.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
	function show() {
		var message = document.getElementById("messages").value;
		if (message != null && message != "") {
			alert(message);
		}
	}
</script>
		<style type="text/css">
.sh_r .t_sh {
	font-weight: bold;
	color: blue;
	font-size: 12;
}

.sh_r tr {
	height: 33%;
}
</style>
	</head>
	<body onload="show()">
		<div id="container" style="margin: 10px 0 10 0">
			<div id="message">
				<div class="nav_c" style="float: left; width: 200; clear: left;">
					<span>购物车<input type="hidden" id="messages"
							value='<s:property value="#session.error" />' /> <%
 	session.removeAttribute("error");
 %> </span>
				</div>
				<div class="nav_v" style="float: left; width: 800;"></div>
				<s:if
					test="#session.shoppingCart.company.size>0||#session.shoppingCart.hotel.size>0||#session.shoppingCart.server.size>0">
					<div style="width: 1000px;">
						<s:iterator value="#session.shoppingCart.company" id="id"
							status="s">
							<div class="sh_l">
								<img alt="" src="<s:property value="picture" />">
							</div>
							<div class="sh_r">
								<table width="100%" height="100%">
									<tr>
										<td>
											名称
										</td>
										<td colspan="2" class="t_sh"
											style="font-size: 16; color: maroon;">
											<A><s:property value="name" /> </A>
										</td>
										<td align="right">
											<a
												href="<%=path%>/customer!cancel?companyId=<s:property value="id"/>"><img
													alt="" src="images/cancel.gif" border="0"> </a>

										</td>
									</tr>
									<tr>
										<td width="20%">
											星级
										</td>
										<td class="t_sh" width="30%">
											<s:property value="grade" />
										</td>
										<td width="20%">
											电话
										</td>
										<td class="t_sh" width="30%">
											<s:property value="phone" />
										</td>
									</tr>
									<tr>
										<td>
											价格
										</td>
										<td class="t_sh">
											<s:property value="price" />
										</td>
										<td>
											类型
										</td>
										<td class="t_sh">
											<s:if test="type=='CHINA'">中式婚礼</s:if>
											<s:elseif test="type=='CREATIVE'">创意婚礼</s:elseif>
											<s:elseif test="type=='MINI'">小型婚礼</s:elseif>
											<s:elseif test="type=='FOREIGN'">西方婚礼</s:elseif>
										</td>
									</tr>
								</table>
							</div>
						</s:iterator>
						<s:iterator value="#session.shoppingCart.server" id="id"
							status="s">
							<div class="sh_l">
								<img alt="" src="<s:property value="picture" />">
							</div>
							<div class="sh_r">
								<table width="100%" height="100%">
									<tr>
										<td>
											名称
										</td>
										<td colspan="2" class="t_sh"
											style="font-size: 16; color: maroon;">
											<a
												href="<%=path%>/pageDisplay!showSingleServer?serverId=<s:property value="id"/>"><s:property
													value="name" /> </a>
										</td>
										<td align="right">
											<a
												href="<%=path%>/customer!cancel?serverId=<s:property value="id"/>"><img
													alt="" src="images/cancel.gif" border="0"> </a>
										</td>
									</tr>
									<tr>
										<td width="20%">
											星级
										</td>
										<td class="t_sh" width="30%">
											<s:property value="grade" />
										</td>
										<td width="20%">
											电话
										</td>
										<td class="t_sh" width="30%">
											<s:property value="phone" />
										</td>
									</tr>
									<tr>
										<td>
											价格
										</td>
										<td class="t_sh">
											<s:property value="price" />
										</td>
										<td>
											类型
										</td>
										<td class="t_sh">
											<s:if test="position=='MC'">司仪</s:if>
											<s:elseif test="position=='PlANNER'">策划</s:elseif>
											<s:elseif test="position=='WC'">婚车</s:elseif>
											<s:elseif test="position=='FLORIST'">花艺师</s:elseif>
											<s:elseif test="position=='MP'">化妆师</s:elseif>
										</td>
									</tr>
								</table>
							</div>
						</s:iterator>

						<s:iterator value="#session.shoppingCart.hotel" id="id" status="s">
							<div class="sh_l">
								<img alt="" src="<s:property value="picture" />">
							</div>
							<div class="sh_r">
								<table width="100%" height="100%">
									<tr>
										<td>
											名称
										</td>
										<td colspan="2" class="t_sh"
											style="font-size: 16; color: maroon;">
											<s:property value="name" />
										</td>
										<td align="right">
											<a
												href="<%=path%>/customer!cancel?hotelId=<s:property value="id"/>"><img
													alt="" src="images/cancel.gif" border="0"> </a>
										</td>
									</tr>
									<tr>
										<td width="20%">
											星级
										</td>
										<td class="t_sh" width="30%">
											<s:property value="grade" />
										</td>
										<td width="20%">
											电话
										</td>
										<td class="t_sh" width="30%">
											<s:property value="phone" />
										</td>
									</tr>
									<tr>
										<td>
											价格
										</td>
										<td class="t_sh">
											<s:property value="price" />
										</td>
										<td>
											类型
										</td>
										<td class="t_sh">
											<s:if test="grade=='HIGHT'">豪华酒店</s:if>
											<s:elseif test="grade=='MIDDLE'">高级酒店</s:elseif>
											<s:elseif test="grade=='COMMON'">普通酒店</s:elseif>
										</td>
									</tr>
								</table>
							</div>
						</s:iterator>
					</div>
					<div
						style="width: 1000; height: 25; margin: 10px 0 0 0; text-align: right">
						<img alt="" src="images/submit.jpg" border="0"
							onclick="javascript:location.href='<%=path%>/customer!adapter?flag=order'">
					</div>
				</s:if>
				<s:else>
					<div
						style="height: 300; border: 1px solid #A9A9F5; width: 1000px; float: left; line-height: 110px; text-align: center; color: maroon; border-top-width: 0">
						您还有相关购物
					</div>
				</s:else>
			</div>
		</div>
	</body>
	<jsp:include page="foot.jsp" flush="true" />
</html>