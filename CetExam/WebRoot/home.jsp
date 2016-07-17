<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员首页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <style type="text/css">
  	body{margin-top: 0;margin-right: 0;}
  	hr{margin-left:10px; width: 600px;}
	#message{
		position:absolute;
		width: 835px;
		height:572px;
		border: 2px solid #ccccff;
	}
	#div{width: 835px;height: 35px;background-color: #9edce3;}
  </style>
  
  <body bgcolor="#f7f8f7">
    <div id="message">
    	<div id="div"><font color="black" size="6" style="font-weight: bold;">英语四级</font></div>
    	<img src="images/home.jpg" style="float: right;margin-right: 20px;margin-top: 20px;">
    	<h3>&nbsp;简介</h3>
<hr align="left"/><pre>
     英语四级，即CET-4，College English Test Band 4的缩写。是由国家教育部高等教育司主持的

全国 性教学考试；考试的主要对象是根据教育大纲修完大学英语四级的大学本科生或研究生。大学英语四、
 
六级标准化考试自1986年末开始筹备，1987年正式实施。目的是推动大学英语教学大纲的贯彻执行， 对大
 
学生的英语能力进行客观、准确的测量，为提高我国大学英语课程的教学质量服务。国家教育部委托“全国
 
大学英语四、六级考试委员会”（1993年前名为“大学英语四、六级标准化考试设计组”）负责设计、 组
 
织、管理与实施大学英语四、六级考试。

    大学英语考试根据理工科本科和文理科本科用的两个《大学英语教学大纲》，由教育部（原国家教育委员会）高等教育司组织
    
 的全国统一的单科性标准化教学考试，分大学英语四级考试（CET-4）和大学英语六级考试（CET-6）两种。每年考试过后8月份或
 
 9月份公布成绩并颁发成绩单[3]，425分为及格线。
    	</pre>
    	<h3>&nbsp;报名条件</h3>
    	<hr align="left" style="width: 750px;"/>
    	<pre>
    (1) 考试对象限制在普通高校内部四年制或以上根据教育大纲修完大学英语四级的本科生；

　　(2) 同等程度的大专生或硕士研究生经所在学校同意，可在本校报名参加考试；

　　(3) 同等程度的夜大或函授大学学生经所在学校同意，可在本校报名参加考试；

　　从2007年1月的考试开始，大学英语四六级考试将不再对社会考生开放，只对在校大学生开放。
    	</pre>
    </div>
  </body>
</html>
