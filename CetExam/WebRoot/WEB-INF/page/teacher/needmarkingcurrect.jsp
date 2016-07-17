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
    
    <title>My JSP 'needmarkingcurrect.jsp' starting page</title>
    
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
body {
    background-color: #EEF2FB;
	font:12px Arial, Helvetica, sans-serif;
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
#grade{
width: 45px;
height: 20px;
}
#form{
position:absolute;
top:30px;
left:70px;
}
#tablec{
width: 600px;
height: 200px;
border: 2px solid #33ccff; 
margin: 0px;
padding: 0px;
}
#tablet{
width: 600px;
height: 120px;
border: 2px solid #33ccff; 
margin: 0px;
padding: 0px;
border-top-color: #33ccff;
 
}
#tat{
position:absolute;
top:198px;
left:0px;
}
#com{
position:absolute;
top:170px;
right:3px;
}
#trs{
position:absolute;
top:290px;
right:3px;
}
#defen{
width: 40px;
height: 20px;
border: 1px solid #999999;
}
#sub{
position:absolute;
top:326px;
left:250px;
}
	</style>
  <body>
  <s:div id="message">
  	    <s:div id="nowposition">
  	                当前位置：批改试卷
  	    </s:div>
  	         <br>
  	      <s:form method="post" action="/cet4/needmark_grade.action" id="form">
  	      <s:iterator value="needmarking">
  	     
  	       <table id="tablec" cellspacing="0" cellpadding="0">
  	       <tr>
  	           <td bgcolor="#6699ff"  align="center" width="73px">作文</td>
  	           <td>&nbsp;&nbsp;&nbsp;${answerOfcomprehensive}</td>
  	        </tr>
  	       </table>
  	      <s:div id="tat">
  	      <table id="tablet" cellspacing="0" cellpadding="0">
  	        <tr>
  	           <td bgcolor="#6699ff" width="73px"  align="center">翻译</td>
  	           <td>${answerOftranslate}</td>	          
  	        </tr>
  	        <s:hidden name="candidateNo"></s:hidden>
  	      
  	      </table>
  	      </s:div>
  	      </s:iterator> 
  	      <s:div id="com">得分：<s:textfield name="com_grade" id="defen"></s:textfield></s:div>
  	      <s:div id="trs">得分：<s:textfield name="trs_grade" id="defen"></s:textfield></s:div>
  	      <s:hidden name="curPage" value="1"></s:hidden>
  	      <s:submit type="image" src="images/submit.jpg" id="sub"></s:submit>
  	      
  	     </s:form>
  	 </s:div>
  </body>
</html>

