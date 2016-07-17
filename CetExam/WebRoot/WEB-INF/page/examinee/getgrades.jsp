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
    
    <title>My JSP 'getgrades.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
#content { border:1px dashed #334455 }
</style>
  </head>
  <body background="images/c.jpg"><center>
  <img src="images/er.jpg"></img><br/><br/><br/><br/><br/><br/><br/>
<div style="position:absolute; left: 320px; top:120px;">  <hr size="1" width="70%" align="center"></div>
 <div style="position:absolute; left: 450px; top:140px;"> <font size="5"><b>2012年6月考试成绩查询结果：</b></font></div>
 <s:iterator value="examinee">
考生姓名：<s:property value="name"/><br/>
 学校：<s:property value="examineeOfSchool"/><br/>
考试类型：<font color="red">英语四级</font><br/>
准考证号：<s:property value="candidateNo"/><br/>
<br/>
<hr style="width:30%;border:1px dashed #334455"/><br/>



您的成绩总分：<s:property value="total"/><br/>

              听力：<s:property value="listeningGrade"/><br/>
              阅读： <s:property value="readingGrade"/><br/>
              综合：<s:property value="comprehensivingGrade"/><br/>
             写作：<s:property value="writingGrade"/><br/> 
             </s:iterator>
   <br/>
     <hr style="width:30%;border:1px dashed #334455"/>          
             <br/>
             姓名中的生僻字可能无法正常显示，以成绩单为准<br/><br/>
             
  <s:form action="/cet4/examinee_getexaminee.action" method="post">
  <s:hidden name="candidateNo"></s:hidden>
  <s:submit type="image" value="返回" src="images/fanhui.jpg"></s:submit>
  </s:form>
   </center>
   <div style="position:absolute; left: 413px; top:95px;"> <img src="images/d1.jpg"></img></div>
    <div style="position:absolute; right: 413px; top:95px;"> <img src="images/d1.jpg"></img></div>
   
  </body>
</html>
