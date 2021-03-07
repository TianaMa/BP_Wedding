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
		<title>操作管理员界面</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="css/center.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<table width="100%" border=0 " align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td bgcolor="#353c44">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr height="20">
													<td width="6%" height="19" valign="bottom">
														<div align="center">
															<img src="images/tb.gif" width="15" height="15" style="margin: 9 0 2 0"/>
														</div>
													</td>
													<td width="94%" valign="middle">
														<span class="STYLE1"> 管理员信息管理</span>
													</td>
												</tr>
											</table>
										</td>
										<td>
											<div align="right" id="nav">
												<span class="STYLE1"> <input type="text" />
													<input type="submit" value="搜索"/><input
														type="checkbox" name="checkbox11" id="checkbox11" />全选
													&nbsp;&nbsp; <a href="addAdmin.jsp"><img
															src="images/add.gif" width="10" height="10" border="0" />
												</a> 新建 &nbsp;&nbsp; &nbsp;&nbsp;</span>
											</div>
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
							<td width="4%" height="20" bgcolor="d3eaef" class="STYLE10">
								<div align="center">
									<input type="checkbox" name="checkbox" id="checkbox" />
								</div>
							</td>
							<td height="20" bgcolor="d3eaef" class="STYLE6">
								<div align="center">
									<span class="STYLE10">账号</span>
								</div>
							</td>
							<td height="20" bgcolor="d3eaef" class="STYLE6">
								<div align="center">
									<span class="STYLE10">密码</span>
								</div>
							</td>
							<td height="20" bgcolor="d3eaef" class="STYLE6">
								<div align="center">
									<span class="STYLE10">角色</span>
								</div>
							</td>
							<td height="20" bgcolor="d3eaef" class="STYLE6" width="5%">
								<div align="center">
									<span class="STYLE10">修改</span>
								</div>
							</td>
							<td height="20" bgcolor="d3eaef" class="STYLE6" width="5%">
								<div align="center">
									<span class="STYLE10">删除</span>
								</div>
							</td>
						</tr>
						<s:set name="admin" value="#session.adminList"></s:set>
						<s:if test="#session.adminList.size>0">
							<s:iterator value="admin">
								<tr>
									<td height="20" bgcolor="#FFFFFF">
										<div align="center">
											<input type="checkbox" name="checkbox2" id="checkbox2" />
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE6">
										<div align="center">
											<span class="STYLE19"><s:property value="name" />
											</span>
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">
											<span class="STYLE19"><s:property
													value="password" /> </span>
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">
											管理员
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">
											<a href='<%=path%>/admin!show?adminId=<s:property value="id" />'>
												<img src="images/edit.gif" width="10" height="10" border="0" />
											</a>
										</div>
									</td>

									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">
											<a href='<%=path%>/admin!delete?adminId=<s:property value="id" />'><img
													src="images/del.gif" width="10" height="10" border="0" /> </a>
										</div>
									</td>
								</tr>
							</s:iterator>
						</s:if>
						<s:else>
							<tr>
								<td colspan="6" align="center" class="STYLE19" height="20">
									没有找到相关信息
								</td>
							</tr>
						</s:else>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>