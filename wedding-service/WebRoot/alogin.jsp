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
		<title>管理员登录界面</title>
		<LINK href="images/Default.css" type=text/css rel=stylesheet>
		<LINK href="images/xtree.css" type=text/css rel=stylesheet>
		<LINK href="images/User_Login.css" type=text/css rel=stylesheet>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<META content="MSHTML 6.00.6000.16674" name=GENERATOR>
		<script type="text/javascript" src="js/alogin.js"></script>
		<script type="text/javascript" src="js/message.js"></script>
	</head>
	<BODY id=userlogin_body onload="show()">
		<DIV></DIV>
		<DIV id=user_login>
			<form action="admin!login" method="post" name="adminLogin">
				<DL>
					<DD id=user_top>
						<UL>
							<LI class=user_top_l></LI>
							<LI class=user_top_c></LI>
							<LI class=user_top_r></LI>
						</UL>
					</DD>
					<DD id=user_main>
						<UL>
							<LI class=user_main_l></LI>
							<LI class=user_main_c>
								<DIV class=user_main_box>
									<UL>
										<LI class=user_main_text>
											账号：
											<input type="hidden" id="message" 
												value='<s:property value="#request.error" />'/>
										</LI>
										<LI class=user_main_input>
											<INPUT class=TxtUserNameCssClass id=TxtUserName maxLength=20
												name="name" onblur="checkname(this);">
										</LI>
									</UL>
									<UL >
									<li>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<FONT id="s_name" color="#ff0000"  ></FONT>
												
										</li>
									</UL>
									<UL>
										<LI class=user_main_text>
											密 码：
										</LI>
										<LI class=user_main_input>
											<INPUT class=TxtPasswordCssClass id=TxtPassword type=password
												name="password" onblur="checkpwd(this);"  >
										</LI>
									</UL>
									<UL >
									<li>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<FONT id="s_name2" color="#ff0000"  ></FONT>
												
										</li>
									</UL>
								</DIV>
							</LI>
							<LI class=user_main_r>
								<img alt="" src="images/user_botton.gif"
									style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px"
									onclick="submit()" />
							</LI>
						</UL>
					</DD>
					<DD id=user_bottom>
						<UL>
							<LI class=user_bottom_l></LI>
							<LI class=user_bottom_c>
								<SPAN style="MARGIN-TOP: 40px"></SPAN>
							</LI>
							<LI class=user_bottom_r></LI>
						</UL>
					</DD>
				</DL>
			</form>
		</DIV>
		<SPAN id=ValrUserName style="DISPLAY: none; COLOR: red"></SPAN>
		<SPAN id=ValrPassword style="DISPLAY: none; COLOR: red"></SPAN>
		<SPAN id=ValrValidateCode style="DISPLAY: none; COLOR: red"></SPAN>
		<DIV id=ValidationSummary1 style="DISPLAY: none; COLOR: red"></DIV>
		<DIV></DIV>
	</BODY>
</html>