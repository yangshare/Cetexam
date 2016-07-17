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
    
    <title>成绩查询</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
  
  <body>
    <center>
    ${message }
    <br/><br/><br/><br/><br/>
    <s:iterator id="needmarking" value="needmarkingList">
    <b><s:property value="#needmarking.test.name"/>考试成绩查询结果：</b><br/><br/>
	考生姓名：<s:property value="#needmarking.examinee.name"/><br/><br/>
 	学校：<s:property value="#needmarking.examinee.school"/><br/><br/>
	考试类型：<font color="red">英语四级</font><br/><br/>
	准考证号：<s:property value="#needmarking.examinee.candidate"/><br/><br/><br/>

	您的成绩总分：<s:property value="#needmarking.totalgrade"/><br/>
              写作：<s:property value="#needmarking.writinggrade"/><br/> 
              听力：<s:property value="#needmarking.listeninggrade"/><br/>
              阅读： <s:property value="#needmarking.readinggrade"/><br/>
              翻译：<s:property value="#needmarking.translategrade"/><br/>
    </s:iterator>
    <br/><br/>
            姓名中的生僻字可能无法正常显示，以成绩单为准
    <br/><br/>
    <a href="<%=request.getContextPath() %>/Examinee_toIndex">返回</a>
    </center>
  </body>
</html>
