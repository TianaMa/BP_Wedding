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
		<title>婚礼流程</title>
		<jsp:include page="head.jsp" flush="true" />
		<style type="text/css">
#container .sub_2 {
	color: black;
	font-size: 14px;
	padding-left: 30px;
}

#container .sub {
	color: blue;
	font-size:18px;
}
.nav_c {
	float: left;
	width: 288px;
	background: url(images/menu_bg.gif);
	height: 35px;
	text-align: left;
	line-height: 35px;
}

.nav_v {
	float: right;
	background: url(images/menu_bg.gif);
	background-position: 0 -35;
	height: 35px;
	width: 712px;
}

.nav_c span {
	font-size: 14px;
	color: #FFFFFF;
	font-weight: bold;
	padding-left: 25px;
}
</style>
	</head>
	<body>
		<div id="container"
			style="margin: 10 0 10 0; width: 1000px; border: 1px solid #A9A9F5;border-top-width: 0 ">
			<div class="nav_c" style="float: left; width: 200; clear: left;">
						<span>婚礼流程</span>
					</div>
					<div class="nav_v" style="float: left; width: 798"></div>
			<table width="800px;">
				<tr>
					<td class="sub">
						一.准备
					</td>
				</tr>
				<tr>
					<td class="sub_2">
						5：30-7:00 新娘伴娘化妆 化妆师为新娘伴娘化妆，摄影师偷拍 化妆师摄影师 化妆品、新娘饰品
						<br />
						7：00- 7：45 新郎准备 去那新娘捧花、头花、嘉宾花、扎婚车并和摄像师、伴郎碰头， 前往新娘家、新娘家提前午餐和家人小聚。
						摄像师、伴郎、礼车司机。 礼车，扎彩车、捧花、头花、嘉宾花
					</td>
				</tr>
				<tr>
					<td class="sub">
						二.进门
					</td>
				</tr>
				<tr>
					<td class="sub_2">
						新郎进门迎娶新娘
						<br />
						新娘家人出难题给新郎，新郎给伴娘、伴郎发红包 在场全体人员 红包，嘉宾花分大家
						<br />
						8:30-8:45 献捧花 新郎单膝下跪向新娘献捧花，摄像师、摄影师抓拍镜头
						<br />
						摄像师、摄影师 捧花
						<br />
						8:45-8:55 拜见新娘父母 新人给新娘父母敬茶、父母回敬信任红包 新娘父母 茶水、红包
						<br />
						8:55-9:00 吃甜品 新郎喂新娘甜品，摄像师、摄影师抓拍镜头 摄像师、摄影师 甜品
						<br />
						9：10 出门燃鞭炮，前往新郎家 和新娘父母道别,前往新郎家，新娘母亲将新娘要更换的新鞋拿到楼下，新郎给新娘换上新鞋
						新娘母亲，礼炮手 鞭炮，新鞋
					</td>
				</tr>
				<tr>
					<td class="sub">
						三.拜公婆
					</td>
				</tr>
				<tr>
					<td class="sub_2">
						10：00 迎新娘 婚车抵达时燃放鞭炮 礼炮手 鞭炮
						<br />
						10：05 进门 新娘进门拜见公婆， 新郎父母回赠红包 新郎父母 茶水，红包
						<br />
						10：20 吃甜品 新郎喂新娘吃甜品， 摄像师、摄影师抓拍镜头 摄像师、摄影师 甜品
					</td>
				</tr>
				<tr>
					<td class="sub">
						四. 外景
					</td>
				</tr>
				<tr>
					<td class="sub_2">
						出发拍外景 前往外景拍摄地拍摄外景 摄像师、摄影师
					</td>
				</tr>
				<tr>
					<td class="sub">
						五. 场地
					</td>
				</tr>

				<tr>
					<td class="sub_2">
						10：40 出发前往酒店 到大酒店后， 人稍作休息，或安排最后彩排 彩排相关人员
						<br />
						11：00 现场候场、签到 新人在宴会厅门口迎宾，与宾客拍照，客人签到 摄像师、摄影师 签到本、座位表、席卡 迎宾人员引导宾客入座
					</td>
				</tr>
				<tr>
					<td class="sub">
						六.仪式
					</td>
				</tr>

				<tr>
					<td class="sub_2">
						12：15 婚礼开始 司仪宣布婚礼开始 司仪
						<br />
						12：20 新娘进场 新娘由父亲（或新郎）带入现场 司仪、新郎父亲或新郎 鲜花、花瓣， 或彩带等 《婚礼进行曲》响起
						<br />
						12:25 证婚 证婚人上台发言，新人交换戒指 司仪、证婚人 证婚词、戒指 背景音乐轻放
						<br />
						12:30 双方父母代表发言 双方父母代表发言， 寄语和祝福 司仪、双方父母 发言稿 背景音乐轻放
						<br />
						12:35 新人答谢双方父母 新人代表致答谢辞， 向双方父母献花或赠送礼物 新人、双方父母 答谢辞、鲜花或礼物 背景音乐轻放
						<br />
						12:40 现场新人仪式 新人行礼、交换戒指、 拥抱亲吻、开香槟、倒香槟酒、切蛋糕、 喝交杯酒 司仪、双方父母 香槟酒、香槟塔、
						蛋糕 新人向双方父母行礼后，双方父母再入席
					</td>
				</tr>
				<tr>
					<td class="sub">
						七.婚宴开始
					</td>
				</tr>
				<tr>
					<td class="sub_2">
						13:00 开席 司仪宣布婚宴正式开始， 新娘换礼服，新人敬烟敬酒 司仪、 伴娘伴郎 可用烛光仪式代替敬烟 背景音乐响起
					</td>
				</tr>
				<tr>
					<td class="sub">
						八. 休息
					</td>
				</tr>
				<tr>
					<td class="sub_2">
						14：00 宾客休息 宾客离开或到棋牌室娱乐 棋牌游戏
						<br />
						14：30 新人休息 新郎新娘进餐、休息
					</td>
				</tr>
				<tr>
					<td class="sub">
						九.晚餐
					</td>
				</tr>
				<tr>
					<td class="sub_2">
						17：00 晚餐准备 通知酒店晚 餐准备数量
						<br />
						20：00 离开酒店 离开前清点所有物品
					</td>
				</tr>
				<tr>
					<td class="sub">
						十.闹洞房
					</td>
				</tr>
				<tr>
					<td class="sub_2">
						21：00 开始闹洞房 节目自由发挥
					</td>
				</tr>
			</table>
		</div>
	</body>
	<jsp:include page="foot.jsp" flush="true" />
</html>