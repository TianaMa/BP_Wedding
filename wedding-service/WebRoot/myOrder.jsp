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
		<title>我的订单</title>
		<jsp:include page="head.jsp" flush="true" />
		<link href="css/message.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/show.js"></script>
	</head>
	<body>
		<div id="container" style="margin: 10px 0 0 0">
			<div id="message">
				<div class="nav_c" style="float: left; width: 200; clear: left;">
					<span>我的订单 </span>
				</div>
				<div class="nav_v" style="float: left; width: 800;"></div>
				<s:if test="#request.orders.size>0">
					<input type="hidden" id="index"
						value="<s:property value="#request.orders.size" />" />
					<div style="width: 1000px;">
						<s:iterator value="#request.orders" id="id" status="s">
							<div
								style="width: 1000; border: 1px solid #A9A9F5; margin: 0 0 10px 0; padding-bottom: 7px">
								<div
									style="margin: 10 10 5 10; height: 60; width: 978; border: 1px solid orange; line-height: 2">
									<table width="100%">
										<tr>
											<td width="15%">
												订单编号
											</td>
											<td width="35%">
												<s:property value="number" />
											</td>
											<td width="15%">
												订单用户
											</td>
											<td width="35%">
												<s:property value="customer.name" />
											</td>
										</tr>
										<tr>
											<td>
												订单时间
											</td>
											<td>
												<s:date name="time" format="yyyy-MM-dd" />
											</td>
											<td>
												订单总价
											</td>
											<td>
												<s:property value="total" />
											</td>
										</tr>
										<tr>
											<td colspan="4" align="left">
												<a onclick="show(<s:property value="#s.index" />)"
													style="color: maroon;">详细信息</a>
											</td>
										</tr>
									</table>
								</div>
								<div id="<s:property value="#s.index" />" style="display: none">
									<s:if test="company!=null">
										<div class="sh_l"
											style="margin: 5 0 5 9; width: 188; border: 1px solid orange">
											<img alt="" src="<s:property value="company.picture"/>"
												style="width: 166; height: 96">
										</div>
										<div class="sh_r"
											style="margin: 5 9 5 0; width: 784; border: 1px solid orange;">
											<table width="100%" height="100%">
												<tr>
													<td>
														名称
													</td>
													<td colspan="3">
														<s:property value="company.name" />
													</td>
												</tr>
												<tr>
													<td width="15%">
														星级
													</td>
													<td width="35%">
														<s:property value="company.grade" />
													</td>
													<td width="15%">
														电话
													</td>
													<td width="35%">
														<s:property value="company.phone" />
													</td>
												</tr>
												<tr>
													<td>
														价格
													</td>
													<td>
														<s:property value="company.price" />
													</td>
													<td>
														住址
													</td>
													<td>
														<s:property value="company.address" />
													</td>
												</tr>
												<tr>
													<td>
														描述
													</td>
													<td colspan="3">
														<s:property value="company.description" />
													</td>
												</tr>
											</table>
										</div>
									</s:if>

									<s:if test="hotel!=null">
										<div class="sh_l"
											style="margin: 5 0 5 9; width: 188; border: 1px solid orange; line-height: 1; text-align: center">
											<img alt="" src="<s:property value="hotel.picture"/>"
												style="width: 166; height: 76">
											名称:
											<s:property value="hotel.name" />
											<br />
											价格:
											<s:property value="hotel.price" />
											-- 星级:
											<s:property value="hotel.grade" />
										</div>
									</s:if>

									<s:if test="server.size>0">
										<s:iterator value="server">
											<div class="sh_l"
												style="margin: 5 0 5 9; width: 188; border: 1px solid orange;line-height: 1; text-align: center">
												<img alt="" src="<s:property value="picture"/>"
													style="width: 166; height: 76">
												名称:
												<s:property value="name" />
												<br />
												价格:
												<s:property value="price" />
												-- 类型:
												<s:if test="position=='MC'">司仪</s:if>
												<s:elseif test="position=='PlANNER'">策划</s:elseif>
												<s:elseif test="position=='WC'">婚车</s:elseif>
												<s:elseif test="position=='FLORIST'">花艺师</s:elseif>
												<s:elseif test="position=='MP'">化妆师</s:elseif>
											</div>
										</s:iterator>
									</s:if>

								</div>
							</div>
						</s:iterator>
					</div>
				</s:if>
				<s:else>
					<div
						style="height: 300; border: 1px solid orange; width: 1000px; float: left; margin: 0 0 20 0; line-height: 110px; text-align: center; color: maroon; border-top-width: 0">
						您还有相关订单
					</div>
				</s:else>
			</div>
		</div>
	</body>
	<jsp:include page="foot.jsp" flush="true" />
</html>