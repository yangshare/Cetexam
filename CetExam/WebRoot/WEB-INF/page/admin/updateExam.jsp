<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加考试信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
		body{margin-top: 0;margin-right: 0;border: 2px solid #ccccff;}
		form{margin: 20px;}
		.hr{margin: 0;}
		.h3{padding-left: 20px;}
		.div{background-color: #9edce3;}
		.file-box{ position:relative;width:340px}
		.txt{ height:22px; border:1px solid #cdcdcd; width:180px;}
		.btn{ background-color:#FFF; border:1px solid #CDCDCD;height:24px; width:70px;}
		.file{ position:absolute; top:0; right:80px; height:24px; filter:alpha(opacity:0);opacity: 0;width:260px }
	</style>
	<sx:head extraLocales="UTF-8"/>
  </head>
  
  <script type="text/javascript">
  	function check()
  	{
  		if(addExaminee.testname.value=="")
  		{
  			alert("考试名称不能为空！");
  			addExaminee.testname.focus();
  			return false;
  		}
  		if(addExaminee.time.value=="")
  		{
  			alert("考试时间不能为空！");
  			addExaminee.time.focus();
  			return false;
  		}
  		if(addExaminee.numarea.value=="")
  		{
  			alert("考试区间不能为空！");
  			addExaminee.numarea.focus();
  			return false;
  		}
  		if(addExaminee.testteachers.value=="")
  		{
  			alert("监考老师不能为空！");
  			addExaminee.testteachers.focus();
  			return false;
  		}
  		if(addExaminee.position.value=="")
  		{
  			alert("考试地点不能为空！");
  			addExaminee.position.focus();
  			return false;
  		}
  		
  		
  	}
  </script>
  
  <body bgcolor="#f7f8f7">
  	<div class="div">
  	<hr class="hr"/>
  	<h3><font color="#6110c5" style="padding-left: 10px;">添加考试信息</font></h3>
  	<hr/>
  	</div>
    <form action="<%=request.getContextPath() %>/cet4/examAction-update" method="post" name="addExaminee"  onsubmit="return check()">
    	<table height="40%">
    		<tr>
    			<td width="80px"><font size="4">考试名称：</font></td>
    			<td>
    				<input type="hidden" name="id" value="${exam.id}"/>
    				<input name="testname" value="${exam.testname}"/>
    			</td>
    		</tr>
    		<tr>
    			<td><font size="4">考试时间：</font></td>
    			<td>
    				<input name="time" value="${exam.time}"/><label>*格式如：2016/6/18 00:00:00</label>
    			</td>
    		</tr>
    		<tr>
    			<td><font size="4">考号区间：</font></td>
    			<td><input name="numarea" value="${exam.numarea}"/><label>*格式如：10-100</label></td>
    		</tr>
    		<tr>
    			<td><font size="4">监考老师：</font></td>
    			<td><input name="testteachers" value="${exam.testteachers}"/></td>
    		</tr>
    		<tr>
    			<td><font size="4">考试地点：</font></td>
    			<td><input name="position" value="${exam.position}"/></td>
    		</tr>
    		<tr>
    			<td><font size="4">试题名称：</font></td>
    			<td>
    				<s:select name="testid" list="testlist" listValue="title" listKey="id" />
    			</td>
    		</tr>
    		<tr>
    			<td><input style="width: 80px;height: 30px;" type="submit" value="确定"/></td>
    		</tr>
    	</table>
    </form>
    <br/>
    <h3 class="h3">注意事项：</h3>
    <font size="4">
    	&nbsp;&nbsp;(1) 保证输入的信息为考试的真实信息；<br/><br/>
    </font>
  </body>
</html>
