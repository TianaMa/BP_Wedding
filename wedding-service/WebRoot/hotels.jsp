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
		<title>婚庆公司</title>
		<jsp:include page="head.jsp" flush="true" />
		<link href="css/main.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div id="container">
			<div id="main_top">
				<div class="nav_c" style="float: left; width: 200; clear: left;">
					<span>婚庆酒店[ <s:if test="#request.grade=='HIGHT'">豪华酒店</s:if>
						<s:elseif test="#request.grade=='MIDDLE'">高级酒店</s:elseif> <s:elseif
							test="#request.grade=='COMMON'">普通酒店</s:elseif> <s:else>所有</s:else>
						]</span>
				</div>
				<div class="nav_v" style="float: left; width: 800;"></div>
				<div style="width: 1000px;">
					<s:if test="#request.hotels.size>0">
						<s:iterator value="#request.hotels">
							
								<div class="main_c">
									<a
										href="<%=path%>/pageDisplay!showSingleHotel?hotelId=<s:property value="id"/>"><img
											border="0" src="<s:property value="picture"/>" alt="详细信息">
									</a> 名称:
									<SPAN><a
										href="<%=path%>/pageDisplay!showSingleHotel?hotelId=<s:property value="id"/>"><s:property
												value="name" /> </a> </SPAN>
									<br />
									价格:
									<SPAN><s:property value="price" /> </SPAN>
									&nbsp;&nbsp;|&nbsp;&nbsp; 星级:
									<SPAN><s:property value="grade" /> </SPAN>
									<br />
									地址:
									<SPAN><s:property value="address" /> </SPAN>
								</div>
							
						</s:iterator>
					</s:if>
					<s:else>
						<div
							style="width: 980px; height: 200px; border: 1px solid orange; text-align: center; line-height: 200px; margin: 10 10 0 10">
							没有找到相关信息
						</div>
					</s:else>
				</div>
			</div>
			<center>
				<div style="margin: 10px 0 10 0; width: 980px;">
					<img src="images/center_banner.gif" width="980px" border="0" />
				</div>
			</center>
		</div>
	</body>
	<jsp:include page="foot.jsp" flush="true" />
</html>