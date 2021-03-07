suspendcode="<DIV id=lovexin1 style='Z-INDEX: 10; LEFT: 20px; POSITION: absolute;TOP: 200px; width: 100px; height: 300px;'><img src='images/close.gif' onClick='javascript:window.hide()' width='100' height='10' border='0' vspace='3' alt=''><a href='http://www.baidu.com' target='_blank'><img src='images/ad_left.jpg' width='100' height='300' border='0'></a></DIV>"
document.write(suspendcode);

suspendcode="<DIV id=lovexin2 style='Z-INDEX: 10; RIGHT: 20px; POSITION: absolute;TOP: 200px; width: 100px; height: 300px;'><img src='images/close.gif' onClick='javascript:window.hide()' width='100' height='10' border='0' vspace='3' alt=''><a href='http://www.baidu.com' target='_blank'><img src='images/ad_right.jpg' width='100' height='300' border='0'></a></DIV>"
document.write(suspendcode);

lastScrollY=0;
function heartBeat(){
diffY=document.body.scrollTop;
percent=.3*(diffY-lastScrollY);
if(percent>0)percent=Math.ceil(percent);
else percent=Math.floor(percent);
document.all.lovexin1.style.pixelTop+=percent;
document.all.lovexin2.style.pixelTop+=percent;
lastScrollY=lastScrollY+percent;
}
function hide()  
{   
lovexin1.style.visibility="hidden"; 
lovexin2.style.visibility="hidden";
}
window.setInterval("heartBeat()",1);