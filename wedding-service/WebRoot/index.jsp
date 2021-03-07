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
		<title>婚礼服务首页</title>
		<jsp:include page="head.jsp" flush="true"></jsp:include>
		<script type="text/javascript" language="javascript" src="js/news.js"></script>
		<script type="text/javascript" language="javascript"
			src="js/AutoChangePhoto.js"></script>
		<link href="css/index.css" rel="stylesheet" type="text/css" />
		<link href="css/title.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" type="text/javascript">
	function qqBoard(n) {
		for (i = 0; i < secTable2.cells.length; i++)
			secTable2.cells[i].className = "qq1";
		secTable2.cells[n].className = "qq2";
		for (i = 0; i < mainTable2.tBodies.length; i++)
			mainTable2.tBodies[i].style.display = "none";
		mainTable2.tBodies[n].style.display = "block";
	}
	function Board(n) {
		for (i = 0; i < secTable.cells.length; i++)
			secTable.cells[i].className = "q1";
		secTable.cells[n].className = "q2";
		for (i = 0; i < mainTable.tBodies.length; i++)
			mainTable.tBodies[i].style.display = "none";
		mainTable.tBodies[n].style.display = "block";
	}
	function oload() {
		playit();
		qqBoard(0);
		Board(0);
	}
</script>
	</head>
	<body onload="oload()">
		<div id="container">
			<div id="index_top">
				<div class=fpic1>
					<img id=focpic1
						style="FILTER: RevealTrans (                     duration =                     1，transition =                     23 ); VISIBILITY: visible; float: left"
						height=350 alt="" src="images/gg1.jpg" width=700 border="0">
				</div>
				<div id="newHotel">
					<div class="nav_c">
						<span>新婚八卦</span>
					</div>
					<div id="msg_weibo" style="float: left; text-align: left;">
						<s:iterator value="#request.messages">
							<div class="con">
								<a href="<%=path%>/message!unfold?id=<s:property value="id" />">[<s:date
										name="createTime" format="yyyy-MM-dd" />]&nbsp;<s:property
										value="subject" /> </a>
							</div>
						</s:iterator>
					</div>
					<div>
						<img src="images/new1.jpg"
							onclick="javascript:location.href = '<%=path%>/pageDisplay!showMessage'" />
						&nbsp;
						<img src="images/new2.jpg" />
					</div>
				</div>
			</div>
			<div style="margin: 10px 0 0 0; width: 1000px;">
				<img src="images/center_banner.gif" width="1000px" />
			</div>
			<div id="index_middle">
				<div class="nav_c" style="width: 300px">
					<span>热门婚庆公司</span>
				</div>
				<div class="nav_v" style="width: 700px"></div>
				<s:if test="#request.hotCompanys.size>0">
					<div id="com_pic" style="float: right;">
						<table border="0" cellspacing="0" cellpadding="0" width="700"
							height="320" id="mainTable2">
							<s:iterator value="#request.subCompanys" status="s">
								<s:if test="#s.index = 0">
									<tbody style="display: block;">
										<tr>
											<td>
												<img alt="" src='<s:property value="picture"/>' width="700"
													height="320" border="0">
											</td>
										</tr>
									</tbody>
								</s:if>
								<s:else>
									<tbody style="display: none;">
										<tr>
											<td>
												<img alt="" src='<s:property value="picture"/>' width="700"
													height="320" border="0">
											</td>
										</tr>

									</tbody>
								</s:else>
							</s:iterator>
						</table>
						<table width="700" border="0" cellpadding="0" cellspacing="0"
							id="secTable2" height="30px">
							<tr height="30px">
								<s:iterator value="#request.subCompanys" status="s">
									<s:if test="#s.index = 0">
										<td class="qq1" onmouseover=qqBoard(0)>
											<s:property value="name" />
										</td>
									</s:if>
									<s:else>
										<td class="qq2" onmouseover=qqBoard(<s:property value="#s.index" />)
>
											<s:property value="name" />
										</td>
									</s:else>
								</s:iterator>
							</tr>
						</table>
					</div>
					<div class="phang" style="height: 354px; width: 300; float: left;">
						<table border="0" cellpadding="0" cellspacing="0" width="100%"
							height="354px">
							<s:iterator value="#request.hotCompanys" status="s">
								<tr>
									<td width="20%">
										<div id='cj_<s:property value="#s.index" />'></div>
									</td>
									<td width="80%">
										<s:property value="name" />
									</td>
								</tr>
							</s:iterator>
						</table>
					</div>
				</s:if>
			</div>
			<div style="margin: 10px 0 0 0; width: 1000px;">
				<img src="images/middle_banner.jpg" width="1000px" />
			</div>
			<div id="index_center">
				<div class="nav_v" style="float: left; width: 700"></div>
				<div class="nav_c" style="float: right; width: 300">
					<span>热点酒店</span>
				</div>
				<s:if test="#request.hotHotels.size>0">
					<div id="hot_pic" style="float: left">
						<table border="0" cellspacing="0" cellpadding="0" width="700"
							height="320" id="mainTable">
							<s:iterator value="#request.hotHotels" status="s">
								<s:if test="#s.index = 0">
									<tbody style="display: block;">
										<tr>
											<td>
												<img alt="" src='<s:property value="picture" />' width="700"
													height="320" border="0">
											</td>
										</tr>
									</tbody>
								</s:if>
								<s:else>
									<tbody style="display: none;">
										<tr>
											<td>
												<img alt="" src='<s:property value="picture" />' width="700"
													height="320" border="0">
											</td>
										</tr>

									</tbody>
								</s:else>
							</s:iterator>
						</table>
						<table width="700" border="0" cellpadding="0" cellspacing="0"
							id="secTable" height="30px">
							<tr height="30px">
								<s:iterator value="#request.subHotels" status="s">
									<s:if test="#s.index = 0">
										<td class="q1" onmouseover=Board(0)>
											<s:property value="name" />
										</td>
									</s:if>
									<s:else>
										<td class="q2" onmouseover=Board(<s:property value="#s.index" />)
>
											<s:property value="name" />
										</td>
									</s:else>
								</s:iterator>
							</tr>
						</table>
					</div>
					<div class="phang" style="height: 354px; width: 300; float: right;">
						<table border="0" cellpadding="0" cellspacing="0" width="100%"
							height="354px">
							<s:iterator value="#request.hotHotels" status="s">
								<tr>
									<td width="20%">
										<div id='cj_<s:property value="#s.index" />'></div>
									</td>
									<td width="80%">
										<s:property value="name" />
									</td>
								</tr>
							</s:iterator>
						</table>
					</div>
				</s:if>
			</div>
			<div id="index_buttom">
				<div class="nav_c" style="float: left; clear: left; width: 300">
					<span>新婚小贴士</span>
				</div>
				<div class="nav_v" style="float: right; clear: left; width: 700"></div>
				<s:iterator value="#request.messages" status="s">
					<s:if test="#s.index<24">
						<s:if test="#s.index%2==0">
							<div style="float: left; width: 350px; padding-left: 20px;">
								<a href="<%=path%>/message!unfold?id=<s:property value="id" />"><s:property
										value="subject" /> </a>
							</div>
						</s:if>
						<s:else>
							<div
								style="float: left; width: 350px; border-left: 1px solid #A9A9F5; padding-left: 20px;">
								<a href="<%=path%>/message!unfold?id=<s:property value="id" />"><s:property
										value="subject" /> </a>
							</div>
						</s:else>
						<div style="float: left; width: 145px;">
							[
							<a href="<%=path%>/message!unfold?id=<s:property value="id" />"><s:date
									name="createTime" format="yyyy-MM-dd" />
							</a> ]
						</div>
					</s:if>
				</s:iterator>
			</div>
		</div>
	</body>
	<jsp:include page="foot.jsp" flush="true"></jsp:include>
</html>
