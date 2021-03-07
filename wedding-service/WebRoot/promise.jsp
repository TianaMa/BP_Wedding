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
		<title>婚礼誓言</title>
		<jsp:include page="head.jsp" flush="true" />
		<style type="text/css">
#container .sub_2 {
	color: black;
	font-size: 14px;
	padding-left: 30px;
}

#container .sub {
	color: blue;
	font-size: 18px;
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
			style="margin: 10 0 10 0; width: 1000px; border: 1px solid #A9A9F5; border-top-width: 0">
			<div class="nav_c" style="float: left; width: 200; clear: left;">
				<span>婚礼誓言</span>
			</div>
			<div class="nav_v" style="float: left; width: 798"></div>
			<table width="800px;">
				<tr>
					<td class="sub">
						一.中文
					</td>
				</tr>
				<tr>
					<td class="sub_2">
						XXX，你是否愿意娶xxx为妻，按照圣经的教训与他同住，在神面前和她结为一体，爱她、安慰她、尊重她、保护他，像你爱自己一样。不论她生病或是健康、富有或贫穷，始终忠於她，直到离开世界？
						<br />
						<br />
						xxx，你是否愿意嫁XXX为妻，按照圣经的教训与他同住，在神面前和他结为一体，爱他、安慰他、尊重他、保护他，像你爱自己一样。不论他生病或是健康、富有或贫穷，始终忠於他，直到离开世界？
						<br />
						<br />
						交换戒指
						<br />
						<br />
						现在要交换戒指，作为结婚的信物。
						<br />
						<br />
						戒指是金的，表示你们要把自己最珍贵的爱，像最珍贵的礼物交给对方。
						<br />
						<br />
						黄金永不生锈、永不退色，代表你们的爱持久到永远。是圆的，代表毫无保留、有始无终。永不破裂。
					</td>
				</tr>
				<tr>
					<td class="sub">
						二.英文
					</td>
				</tr>
				<tr>
					<td class="sub_2">
						I,[Groom's name],take you [brede's name],to be my wife,my partner
						in life and my one true love.
						<br />
						<br />
						I will cherish our friendship and love you today,tomorrow,and
						forever.
						<br />
						<br />
						I will trust you and honor you.
						<br />
						<br />
						I will laugh with you and cry with you.
						<br />
						<br />
						I will love you faithfully.
						<br />
						<br />
						Through the best and the worst, Through the difficult and the
						easy. What may come I will always be there.
						<br />
						<br />
						As I have given you my hand to hold.
						<br />
						<br />
						So I give you my life to keep.
						<br />
						<br />
						So help me God.
						<br />
						<br />
						I,[brede's name],take you [Groom's name],to be my husband,my
						partner in life and my one true love.
						<br />
						<br />
						I will cherish our friendship and love you today,tomorrow,and
						forever.
						<br />
						<br />
						I will trust you and honor you.
						<br />
						<br />
						I will laugh with you and cry with you.
						<br />
						<br />
						I will love you faithfully.
						<br />
						<br />
						Through the best and the worst, Through the difficult and the
						easy.
						<br />
						<br />
						What may come I will always be there.
						<br />
						<br />
						As I have given you my hand to hold.
						<br />
						<br />
						So I give you my life to keep.
						<br />
						<br />
						So help me God.
						<br />
						<br />
						In unison
						<br />
						<br />
						Entreat me not to leave you,or to return from following after you,
						For where you go I will go, and where you stay I will stay.
						<br />
						<br />
						Your people will be my people, and your God will be my God.
						<br />
						<br />
						And where you die,I will die and there I will be buried.
						<br />
						<br />
						May the Lord do with me and more if anything but death parts you
						from me.
						<br />
						<br />
						I want to take this man/woman to my lawful wedded husband/wife, to
						love him/her and cherish him/her, for better or worse,for poorer
						and richer.

					</td>
				</tr>
			</table>
		</div>
	</body>
	<jsp:include page="foot.jsp" flush="true" />
</html>