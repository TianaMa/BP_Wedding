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
		<title>公司预定</title>
		<jsp:include page="head.jsp" flush="true" />
		<link href="css/single.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div id="container" style="margin: 10 0 10 0">
			<div id="leave_top" style="height: 200">
				<div class="nav_c" style="float: left; width: 200; clear: left;">
					<span>公司预定</span>
				</div>
				<div class="nav_v" style="float: left; width: 800"></div>

				<div
					style="border: solid 1px #A9A9F5; border-top-width: 0; width: 1000px; height: 200px">
					<table width="100%" border="0" bordercolor="black" cellpadding="0"
						cellspacing="0" height="200px">
						<tr height="45">
							<td width="200" rowspan="4">
								<img src="<s:property value="#request.company.picture"/>"
									style="width: 380; height: 180; margin: 10 10 10 10" />
							</td>
							<td width="50">
								名称
							</td>
							<td width="350"
								style="font-weight: bold; color: maroon; font-size: 16"
								class="t_sh">
								<s:property value="#request.company.name" />
							</td>
							<td width="50">

							</td>
							<td width="350">

							</td>
						</tr>
						<tr height="45">
							<td>
								星级
							</td>
							<td class="t_sh">
								<s:property value="#request.company.grade" />
							</td>
							<td>
								电话
							</td>
							<td class="t_sh">
								<s:property value="#request.company.phone" />
							</td>
						</tr>
						<tr height="45">
							<td>
								价格
							</td>
							<td class="t_sh">
								<s:property value="#request.company.price" />
							</td>
							<td>
								住址
							</td>
							<td class="t_sh">
								<s:property value="#request.company.address" />
							</td>
						</tr>
						<tr height="65">
							<td>
								描述
							</td>
							<td colspan="2" class="t_sh">
								<s:property value="#request.company.description" />
							</td>
							<td colspan="5">
								<img src="images/yy.gif" border="0"
									onclick="javascript:location.href='<%=path%>/customer!shoppingCart?companyId=<s:property value="#request.company.id" />'" />
							</td>
						</tr>
					</table>
					<ul>
						<li>
							<h4>
								酒店信息
							</h4>
						</li>
					</ul>
					<div style="width: 1000px;">
						<s:if test="#request.hotels.size>0">
							<s:iterator value="#request.hotels">
								<s:if test="ordered!=true||ordered==null">
									<div class="main_h">
										<a
											href="<%=path%>/pageDisplay!showSingleHotel?hotelId=<s:property value="id"/>"><img
												border="0" src="<s:property value="picture"/>" alt="详细信息">
										</a> 名称:
										<SPAN><a
											href="<%=path%>/pageDisplay!showSingleHotel?hotelId=<s:property value="id"/>"><s:property
													value="name" /> </a> </SPAN>
										<br />
										价格:
										<SPAN><s:property value="price" />---</SPAN> 星级:
										<SPAN><s:property value="grade" /> </SPAN>
									</div>
								</s:if>
							</s:iterator>
						</s:if>
					</div>
					<ul>
						<li>
							<h4>
								其他信息
							</h4>
						</li>
					</ul>
					<div style="width: 1000px; margin: 10 0 10 0">
						<s:if test="#request.servers.size>0">
							<s:iterator value="#request.servers">
								<s:if test="ordered!=true||ordered==null">
									<div class="main_c">
										<a
											href="<%=path%>/pageDisplay!showSingleServer?serverId=<s:property value="id"/>"><img
												border="0" src="<s:property value="picture"/>" alt="详细信息">
										</a> 名称:
										<SPAN><a
											href="<%=path%>/pageDisplay!showSingleServer?serverId=<s:property value="id"/>"><s:property
													value="name" /> </a> </SPAN>
										<br />
										价格:
										<SPAN><s:property value="price" /> </SPAN><br />
										 类型:
										<SPAN><s:if test="position=='MC'">司仪</s:if> <s:elseif
												test="position=='PlANNER'">策划</s:elseif> <s:elseif
												test="position=='WC'">婚车</s:elseif> <s:elseif
												test="position=='FLORIST'">花艺师</s:elseif> <s:elseif
												test="position=='MP'">化妆师</s:elseif> </SPAN>
									</div>
								</s:if>
							</s:iterator>
						</s:if>
					</div>
				</div>
			</div>
		</div>
	</body>
	<jsp:include page="foot.jsp" flush="true" />
</html>