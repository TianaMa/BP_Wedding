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
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>导航</title>
		<link href="css/head.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" language="javascript"
			src="js/duilian.js"></script>
	</head>
	<body>
		<br />
		<br />
		<script language="javascript">
	function qiehuan(num){
		for(var id = 0;id<=9;id++)
		{
			if(id==num)
			{
				document.getElementById("qh_con"+id).style.display="block";
				document.getElementById("mynav"+id).className="nav_on";
			}
			else
			{
				document.getElementById("qh_con"+id).style.display="none";
				document.getElementById("mynav"+id).className="";
			}
		}
	}
</script>
		<div style="margin: -20px 0 0 0; width: 1000px;">
			<a href="http://www.baidu.com" ><img src="images/top_banner.jpg" alt="广告" width="1000px" /></a>
		</div>
		<div class="top" style="width: 1000; height: 60px">
			<UL>
				<s:if test="#session['customer'] == null">
					<LI>
						<A href='<%=path%>/customer!adapter?flag=shoppingcart'><SPAN>购物车</SPAN>
						</A>
					</LI>
					<LI class=menu_line2></LI>
					<LI>
						<A href='<%=path%>/customer!adapter?flag=myorder'><SPAN>我的订单</SPAN>
						</A>
					</LI>
					<LI class=menu_line2></LI>
					<LI>
						<A href='<%=path%>/customer!adapter?flag=modify'><span>修改密码</span>
						</A>
					</LI>
					<LI class=menu_line2></LI>
					<LI>
						<A href="register.jsp"><SPAN>免费注册</SPAN> </A>
					</LI>
					<LI class=menu_line2></LI>
					<LI>
						<A href="login.jsp"><SPAN>请登录</SPAN> </A>
					</LI>
				</s:if>
				<s:else>
					<LI>
						<A href='<%=path%>/customer!exit'><SPAN>退出</SPAN> </A>
					</LI>
					<LI class=menu_line2></LI>
					<LI>
						<A href='<%=path%>/customer!adapter?flag=shoppingcart'><SPAN>购物车</SPAN>
						</A>
					</LI>
					<LI class=menu_line2></LI>
					<LI>
						<A href='<%=path%>/customer!adapter?flag=myorder'><SPAN>我的订单</SPAN>
						</A>
					</LI>
					<LI class=menu_line2></LI>
					<LI>
						<A href='<%=path%>/customer!adapter?flag=modify'><span>修改密码</span>
						</A>
					</LI>
					<LI class=menu_line2></LI>
					<LI>
						<A>用户:&nbsp;&nbsp;<SPAN style="color: red; font-weight: bold"><s:property
									value="#session.customer.name" /> </SPAN>&nbsp;&nbsp;在线</A>
					</LI>
				</s:else>
			</UL>
		</div>
		<div id=menu_out>
			<div id=menu_in>
				<div id=menu>
					<UL id=nav>
						<LI>
							<A class=nav_on id=mynav0 onmouseover="javascript:qiehuan(0)"
								href='<%=path%>/pageDisplay!showIndex'><SPAN>首 页</SPAN> </A>
						</LI>
						<LI class="menu_line"></LI>
						<li>
							<a href='<%=path%>/pageDisplay!showCompany'
								onmouseover="javascript:qiehuan(1)" id="mynav1" class="nav_off"><span>婚礼公司</span>
							</a>
						</li>
						<li class="menu_line"></li>
						<li>
							<a href='<%=path%>/pageDisplay!showHotel'
								onmouseover="javascript:qiehuan(2)" id="mynav2" class="nav_off"><span>婚宴酒店</span>
							</a>
						</li>
						<li class="menu_line"></li>
						<li>
							<a onmouseover="javascript:qiehuan(3)" id="mynav3"
								class="nav_off"><span>单项预订</span> </a>
						</li>
						<li class="menu_line"></li>
						<li>
							<a onmouseover="javascript:qiehuan(4)" id="mynav4"
								class="nav_off"><span>婚礼知识</span> </a>
						</li>
						<li class="menu_line"></li>
						<li>
							<a href="<%=path%>/pageDisplay!showMessage"
								onmouseover="javascript:qiehuan(5)" id="mynav5" class="nav_off"><span>讨
									论 区</span> </a>
						</li>
					</UL>
					<div id=menu_con>
						<div id=qh_con0 style="DISPLAY: block">
							<!--<UL>
								<LI>
									<span style="padding-left: 50px;"><input type="text"
											name="search" style="width: 300px" /> </span>
								</LI>
								<LI>
									<SPAN><img src="images/search.jpg" border="0" /> </SPAN>
								</LI>
							</UL>
						--></div>
						<div id=qh_con1 style="DISPLAY: none">
							<UL>
								<LI>
									<A href='<%=path%>/pageDisplay!showCompany?type=CHINA'><span>中式婚礼</span>
									</A>
								</LI>
								<LI class=menu_line2></LI>
								<LI>
									<A href='<%=path%>/pageDisplay!showCompany?type=FOREIGN'><SPAN>西式婚礼</SPAN>
									</A>
								</LI>
								<LI class=menu_line2></LI>
								<LI>
									<A href='<%=path%>/pageDisplay!showCompany?type=CREATIVE'><SPAN>创意婚礼</SPAN>
									</A>
								</LI>
								<LI class=menu_line2></LI>
								<LI>
									<A href='<%=path%>/pageDisplay!showCompany?type=MINI'><SPAN>小型婚宴</SPAN>
									</A>
								</LI>
							</UL>
						</div>
						<div id=qh_con2 style="DISPLAY: none">
							<UL>
								<LI>
									<A href='<%=path%>/pageDisplay!showHotel?grade=HIGHT'><span>豪华酒店</span>
									</A>
								</LI>
								<LI class=menu_line2></LI>
								<LI>
									<A href='<%=path%>/pageDisplay!showHotel?grade=MIDDLE'><SPAN>高级酒店</SPAN>
									</A>
								</LI>
								<LI class=menu_line2></LI>
								<LI>
									<A href='<%=path%>/pageDisplay!showHotel?grade=COMMON'><SPAN>普通酒店</SPAN>
									</A>
								</LI>
							</UL>
						</div>
						<div id=qh_con3 style="DISPLAY: none">
							<UL>
								<LI>
									<A href='<%=path%>/pageDisplay!showServer?position=WC'><span>婚车预订</span>
									</A>
								</LI>
								<LI class=menu_line2></LI>
								<LI>
									<A href='<%=path%>/pageDisplay!showServer?position=MC'><SPAN>司仪预订</SPAN>
									</A>
								</LI>
								<LI class=menu_line2></LI>
								<LI>
									<A href='<%=path%>/pageDisplay!showServer?position=PlANNER'><SPAN>策划师预订</SPAN>
									</A>
								</LI>
								<LI class=menu_line2></LI>
								<LI>
									<A href='<%=path%>/pageDisplay!showServer?position=FLORIST'><SPAN>花艺师预订</SPAN>
									</A>
								</LI>
								<LI class=menu_line2></LI>
								<LI>
									<A href='<%=path%>/pageDisplay!showServer?position=MP'><SPAN>化妆师预订</SPAN>
									</A>
								</LI>
							</UL>
						</div>
						<div id=qh_con4 style="DISPLAY: none">
							<UL>
								<LI>
									<A href="<%=path%>/flow.jsp"><span>婚礼流程</span> </A>
								</LI>
								<LI class=menu_line2></LI>
								<LI>
									<A href="<%=path%>/promise.jsp"><SPAN>婚礼誓言</SPAN> </A>
								</LI>
								<LI class=menu_line2></LI>
								<LI>
									<A href="<%=path%>/pageDisplay!showMessage?type=TIE"><SPAN>新婚小贴士</SPAN>
									</A>
								</LI>
							</UL>
						</div>
						<div id=qh_con5 style="DISPLAY: none">
							<UL>
								<LI>
									<A href="<%=path%>/pageDisplay!showMessage?type=COMPANY"><span>婚庆公司区</span>
									</A>
								</LI>
								<LI class=menu_line2></LI>
								<LI>
									<A href="<%=path%>/pageDisplay!showMessage?type=HOTEL"><SPAN>婚宴酒店区</SPAN>
									</A>
								</LI>
								<LI class=menu_line2></LI>
								<LI>
									<A href="<%=path%>/pageDisplay!showMessage?type=OTHERS"><SPAN>其他</SPAN>
									</A>
								</LI>
							</UL>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
