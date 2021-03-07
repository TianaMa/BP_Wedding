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
		<base href="<%=basePath%>">
		<title>修改公司</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="css/addPage.css" rel="stylesheet" type="text/css" />
	</head>
	<body style="margin-top: 0px; margin-left: 0px; margin-right: 0px;">
		<form action="company!modify" method="post" name="addForm">
			<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="24" bgcolor="#353c44">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td>
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="14" height="19" valign="bottom">
															<div align="left">
																<img src="images/tb.gif" width="15" height="15"
																	style="margin: 9 0 2 0" />
															</div>
														</td>
														<td valign="middle">
															<span style="color: white; font-size: 12px;">修改公司</span>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%" border="0" cellpadding="0" cellspacing="1"
							bgcolor="#a8c7ce">
							<tr>
								<td width="25%" bgcolor="#ffffff"></td>
								<td height="20" bgcolor="d3eaef" class="STYLE6" width="25%">
									<div align="center">
										<span class="STYLE10" style="font-size: 12px;">名称</span>
										<input type="hidden"
											value="<s:property value="#request.company.id"/>" name="id" />
									</div>
								</td>
								<td height="20" bgcolor="#ffffff" class="STYLE6">
									<div align="left">
										<span class="STYLE10"><input name="name"
												style="width: 50%;" type="text"
												value="<s:property value="#request.company.name"/>" /> </span>
									</div>
								</td>
							</tr>
							<tr>
								<td width="25%" bgcolor="#ffffff"></td>
								<td height="20" bgcolor="d3eaef" class="STYLE6" width="25%">
									<div align="center">
										<span class="STYLE10" style="font-size: 12px;">地址</span>
									</div>
								</td>
								<td height="20" bgcolor="#ffffff" class="STYLE6">
									<div align="left">
										<span class="STYLE10"><input type=text
												style="width: 50%;" name="address"
												value="<s:property value="#request.company.address"/>" /> </span>
									</div>
								</td>
							</tr>

							<tr>
								<td width="25%" bgcolor="#ffffff"></td>
								<td height="20" bgcolor="d3eaef" class="STYLE6" width="25%">
									<div align="center">
										<span class="STYLE10" style="font-size: 12px;">电话</span>
									</div>
								</td>
								<td height="20" bgcolor="#ffffff" class="STYLE6">
									<div align="left">
										<span class="STYLE10"><input type=text
												style="width: 50%;" name="phone"
												value="<s:property value="#request.company.phone"/>" /> </span>
									</div>
								</td>
							</tr>

							<tr>
								<td width="25%" bgcolor="#ffffff"></td>
								<td height="20" bgcolor="d3eaef" class="STYLE6" width="25%">
									<div align="center">
										<span class="STYLE10" style="font-size: 12px;">价格</span>
									</div>
								</td>
								<td height="20" bgcolor="#ffffff" class="STYLE6">
									<div align="left">
										<span class="STYLE10"><input type=text
												style="width: 50%;" name="price"
												value="<s:property value="#request.company.price"/>" /> </span>
									</div>
								</td>
							</tr>

							<tr>
								<td width="25%" bgcolor="#ffffff"></td>
								<td height="20" bgcolor="d3eaef" class="STYLE6" width="25%">
									<div align="center">
										<span class="STYLE10" style="font-size: 12px;">图片</span>
									</div>
								</td>
								<td height="20" bgcolor="#ffffff" class="STYLE6">
									<div align="left">
										<span class="STYLE10"><input type=text
												style="width: 50%;" name="picture"
												value="<s:property value="#request.company.picture"/>" /> </span>
									</div>
								</td>
							</tr>
							<tr>
								<td width="25%" bgcolor="#ffffff"></td>
								<td height="20" bgcolor="d3eaef" class="STYLE6" width="25%">
									<div align="center">
										<span class="STYLE10" style="font-size: 12px;">等级</span>
									</div>
								</td>
								<td height="20" bgcolor="#ffffff" class="STYLE6">
									<div align="left">
										<span class="STYLE10"><input type=text
												style="width: 50%;" name="grade"
												value="<s:property value="#request.company.grade"/>" /> </span>
									</div>
								</td>
							</tr>
							<tr>
								<td width="25%" bgcolor="#ffffff"></td>
								<td height="60" bgcolor="d3eaef" class="STYLE6" width="25%"
									valign="top">
									<div align="center">
										<span class="STYLE10" style="font-size: 12px;">描述</span>
									</div>
								</td>
								<td height="60" bgcolor="#ffffff" class="STYLE6">
									<div align="left">
										<span class="STYLE10"><textarea name="description"
												style="white-space: pre; width: 50%; height: 60px">
												<s:property value="#request.company.decription" />
												</textarea> </span>
									</div>
								</td>
							</tr>

							<tr>
								<td height="20" bgcolor="#353c44" class="STYLE6" width="25%"
									colspan=3>
									<div align="center">
										<span class="STYLE10"> <img alt="submit"
												src="images/submit.gif"
												onclick="javascript:document.addForm.submit();" /> </span>
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>