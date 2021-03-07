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
		<link href="css/messages.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<form action="message!leave" method="post" name="Leave">
			<div id="container">
				<div id="leave_top">
					<div class="nav_c" style="float: left; width: 200; clear: left;">
						<span> <s:if test="#request.type=='HOTEL'">讨论区[酒店区]</s:if>
							<s:elseif test="#request.type=='OTHERS'">讨论区[其他]</s:elseif> <s:elseif
								test="#request.type=='COMPANY'">讨论区[公司区]</s:elseif> <s:elseif
								test="#request.type=='TIE'">新婚小贴士</s:elseif> <s:else>讨论区[所有]</s:else>
						</span>
					</div>
					<div class="nav_v" style="float: left; width: 800"></div>
					<div
						style="border: solid 1px #A9A9F5; border-top-width: 0; width: 1000px; height: 300px">
						<table width="100%" style="text-align: center">
							<tr>
								<td width="15%">
									时间
								</td>
								<td width="55%">
									主题
								</td>
								<td width="15%">
									类型
								</td>
								<td width="15%">
									发布人
								</td>
							</tr>
							<s:if test="#request.messages.size>0">
								<s:iterator value="#request.messages">
									<tr>
										<td>
											<s:date name="createTime" format="yyyy-MM-dd" />
										</td>
										<td>
											<A
												href="<%=path%>/message!unfold?id=<s:property value="id" />"><s:property
													value="subject" /> </A>
										</td>
										<td>
											<s:if test="type=='HOTEL'">酒店</s:if>
											<s:elseif test="type=='OTHERS'">其他</s:elseif>
											<s:elseif test="type=='COMPANY'">公司</s:elseif>
										</td>
										<td>
											<s:property value="releaser" />
										</td>
									</tr>
								</s:iterator>
							</s:if>
							<s:else>
								<tr>
									<td colspan="4">
										暂无帖子
									</td>
								</tr>
							</s:else>
						</table>
					</div>
				</div>
				<div id="leave">
					<div class="nav_c" style="float: left; width: 200; clear: left;">
						<span>用户发帖</span>
					</div>
					<div class="nav_v" style="float: left; width: 300"></div>
					<div
						style="border: solid 1px #A9A9F5; border-top-width: 0; width: 500px;">
						<table width="100%" height="300">
							<tr height="30px">
								<td class="first">
									主题：
								</td>
								<td class="middle">
									<input type="text" name="subject" style="width: 350PX" />
								</td>

							</tr>
							<tr height="30px">
								<td class="first">
									类型：
								</td>
								<td class="middle">
									<input type="radio" name="type" value="COMPANY" />
									公司
									<input type="radio" name="type" value="HOTEL" />
									酒店
									<input type="radio" name="type" value="OTHERS"
										checked="checked" />
									其他
								</td>

							</tr>
							<tr>
								<td class="first" style="vertical-align: top;">
									内容：
								</td>
								<td class="middle">
									<textarea style="width: 350px; height: 190px"
										style="white-space: pre" name="description"></textarea>
								</td>

							</tr>
							<tr height="50px">
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
				<div style="float: left; margin: 10px 0 0 10;">
					<img src="images/modify_bg.jpg" width="488px" border="0"
						height="350" />
				</div>
			</div>
		</form>
	</body>
	<jsp:include page="foot.jsp" flush="true" />
</html>