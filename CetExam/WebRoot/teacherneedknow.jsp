<%@ page language="java" import="java.util.*,com.cet.pojo.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'teacherneedknow.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
body {
    background-color: #EEF2FB;
	font:15px Arial, Helvetica, sans-serif;
	color: #000;
	margin: 0px;
}
#message{
position:absolute;
top:0px;
left:10px;
width: 820px;
height:400px;
border: 2px solid #ccccff;
background-image: url("images/background5.jpg");
}

#nowposition{
position:absolute;
top:10px;
left:10px;
}
#p1{
position:absolute;
top:40px;
left:30px;
width: 752px;
}	
#p2{
position:absolute;
top:84px;
left:30px;
width: 752px;
}	
#p3{
position:absolute;
top:145px;
left:30px;
width: 752px;
}	
#p4{
position:absolute;
top:189px;
left:30px;
width: 752px;
}	
#p5{
position:absolute;
top:234px;
left:30px;
width: 752px;
}	
#p6{
position:absolute;
top:286px;
left:30px;
width: 752px;
}	
	</style>
  </head>
  
  <body>
  <s:div id="message">
  	    <s:div id="nowposition">
  	                当前位置：教师须知
  	    </s:div>
  	    <br/><br>
 <s:div id="p1">	    
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;评卷是教学工作的重要组成部分。评分是否公正、合理，直接关系
到学生健康成长和对教师教学的指导。各评卷教师必须以高度的责任
感、细致的工作，认真搞好评阅工作。<br/>
</s:div>
 <s:div id="p2"><font color="black" size="3" style="font-weight: bold;">阅卷注意事项：</font><br/><br/>
 <pre>
   1．团结协作，服从评卷点负责人的领导和学科评卷组组长的工作安排。不推委扯皮，自行其事。
   2．认真学习《试题参考答案及评分标准》，讨论研究，订正错误，找出答案的多种可能性，确定
具体评分标准和细则。
   3．评卷始终做到全体教师思想认识统一；执行“评分标准”前后统一；题组之间、评卷教师之间掌
握“评分标准”统一。做到给分有理，扣分有据，不偏宽偏严，不从个人好恶出发给分。
   4．严格遵守评卷纪律，对评卷错误较多或错误严重者将给予通报批评，对违法乱纪、循私舞弊、
弄虚作假者都将根据有关规定给予严肃处理。
   5.评卷一律在评卷室进行，各评卷小组不得相互串走。
 </pre>
  	</s:div>     
 <s:div id="p6"><font color="black" size="3" style="font-weight: bold;">使用系统：</font><br/><br/>
 <pre>
   1.教师登录系统后，可进行批改试卷操作，共作文和翻译两部分。阅卷完成后，点击提交按钮完成阅卷。
   2.阅完卷后单击[退出]按钮，可退出系统。
 </pre>
  	</s:div>     
  	 </s:div>
  </body>
</html>
