<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>首页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
  
  <body>
  ${message }
  <s:form action="Test_toDBTest?mode='Testing'" method="post">
  <s:iterator id="exam" value="examList">
   <center> *最近考试：<s:property value="#exam.examname"/>，开考时间为<s:property  value="#exam.time"/><br/></center>
  </s:iterator>
  <br/><br/><br/><br/>
  <s:hidden name="testid" id="testid" /><!-- 隐藏域传试卷ID -->
  
  <div align="center"><font size="6" ><b>我的信息</b></font></div> 
  <br/><br/> 
  <font size="5"> 
   <center><s:iterator value="examinee">
     <table style="top:260px;">
     <tr> <td> <b>姓名：</b></td><td><s:property value="name"/></td> </tr>
     <tr><td>&nbsp;</td></tr>
     <tr> <td> <b>性别：</b></td><td><s:property value="sex"/></td> </tr>
     <tr><td>&nbsp;</td></tr> 
     <tr> <td> <b>准考证号：</b></td><td><s:property value="candidate"/></td> </tr>
     <tr><td>&nbsp;</td></tr> 
     <tr> <td><b>所在院校：</b></td><td><s:property value="school"/></td> </tr>
     </table>
  <br/><br/> 
  
     <div style="position:relative; top:20%;"><img src="${image }"/></div> <br/><br/><br/>
  
     <s:submit disabled="true"  value="开始答题" id="sub" type="button"/>
     <input type="button" onclick="window.location.href='<%=request.getContextPath() %>/Examinee_showGrade?candidate=${candidate}'" value="查看成绩"/>
     <input type="button" onclick="window.location.href='<%=request.getContextPath() %>/Test_pagingExercise?curPage=1'" value="练习系统"/>
     <input type="button" onclick="window.location.href='<%=request.getContextPath() %>/updatePass.jsp'" value="修改密码"/>
     
    </s:iterator></center>
   </s:form> 
    <script type="text/javascript">
     var testid="${exam.test.id}";
     var time="${exam.time}";
     var date = (new Date(time)).getTime()/1000; //得到秒数 
     var now=new Date().getTime()/1000;
     if((now-date)>=-60*60 && (now-date)<15*60){//考生在离考试前一个小时内登录，才设置计时器，准备考试，否则，无法进行考试，故，请在考试前一个小时内，登录或刷新一次本页面
     setTimeout(function(){
        alert("开始考试，请准备");
        document.getElementById("testid").value = testid;
        document.getElementById("sub").disabled = false;
        },(date-now)*1000);  
     }
   </script>
   
   </font>
  </body>
</html>
