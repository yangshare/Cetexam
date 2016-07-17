<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改考生信息</title>
    
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
		.div{background-color: #9edce3;}
		.file-box{ position:relative;width:340px}
		.txt{ height:22px; border:1px solid #cdcdcd; width:180px;}
		.txtid{ border:1px solid gray; background-color: gray;}
		.btn{ background-color:#FFF; border:1px solid #CDCDCD;height:24px; width:70px;}
		.file{ position:absolute; top:0; right:80px; height:24px; filter:alpha(opacity:0);opacity: 0;width:260px }
	</style>

  </head>
  
  <script type="text/javascript">
  	function check()
  	{
  		if(updateExaminee.candidateNo.value=="")
  		{
  			alert("考号不能为空！");
  			updateExaminee.candidateNo.focus();
  			return false;
  		}
  		if(updateExaminee.name.value=="")
  		{
  			alert("姓名不能为空！");
  			updateExaminee.name.focus();
  			return false;
  		}
  		if(updateExaminee.examineeOfSchool.value=="")
  		{
  			alert("学校不能为空！");
  			updateExaminee.examineeOfSchool.focus();
  			return false;
  		}
  		if(updateExaminee.examineeImage.value=="")
  		{
  			alert("相片不能为空！");
  			updateExaminee.examineeImage.focus();
  			return false;
  		}
  		if(updateExaminee.writingGrade.value=="")
  		{
  			updateExaminee.writingGrade.value="0";
  		}
  		if(updateExaminee.listeningGrade.value=="")
  		{
  			updateExaminee.listeningGrade.value="0";
  		}
  		if(updateExaminee.readingGrade.value=="")
  		{
  			updateExaminee.readingGrade.value="0";
  		}
  		if(updateExaminee.comprehensivingGrade.value=="")
  		{
  			updateExaminee.comprehensivingGrade.value="0";
  		}
  		if(updateExaminee.total.value=="")
  		{
  			updateExaminee.total.value="0";
  		}
  		var fileName = updateExaminee.examineeImage.value;
  		var i = fileName.lastIndexOf(".");
  		var name = fileName.substring(i);
  		if(name!=".jpg"&&name!=".gif"&&name!=".png")
  		{
  			alert("图片格式不正确！只允许格式：.jpg  .gif  .png");
  			updateExaminee.examineeImage.focus();
  			return false;
  		}
  	}
  </script>
  
  <body bgcolor="#f7f8f7">
  	<div class="div">
  	<hr class="hr"/>
  	<h3><font color="#6110c5" style="padding-left: 10px;">修改考生信息</font></h3>
  	<hr/>
  	</div>
    <form action="<%=request.getContextPath() %>/cet4/examineeAction-update" method="post" name="updateExaminee" enctype="multipart/form-data" onsubmit="return check()">
    	<table>
    		<tr>
    			<td width="80px"><font size="4">考号：</font></td>
    			<td><input name="candidateNo" value="${examinee.candidateNo}" readonly="readonly" class="txtid"/></td>
    		</tr>
    		<tr>
    			<td><font size="4">姓名：</font></td>
    			<td><input name="name" value="${examinee.name }"/></td>
    		</tr>
    		<tr>
    			<td><font size="4">性别：</font></td>
    			<td>
    				<select name="sex">
    					<c:if test="${examinee.sex == '男'}">
    						<option>男</option><option>女</option>
    					</c:if>
    					<c:if test="${examinee.sex == '女'}">
    						<option>女</option><option>男</option>
    					</c:if>
    				</select>
    			</td>
    		</tr>
    		<tr>
    			<td><font size="4">学校：</font></td>
    			<td><input name="examineeOfSchool" value="${examinee.examineeOfSchool }"/></td>
    		</tr>
    		<tr>
    			<td valign="top"><font size="4">相片：</font></td>
    			<td>
    				<img src="${examinee.image }" width="110px" height="150px"/>
    				<div class="file-box">
    					<input name="examineeImage" id="textfield" value="${examinee.image }" class="txt"/>
    					<input type="file" class="file" name="image" onchange="document.getElementById('textfield').value=this.value"/>
    					<input type="button" value="浏览..." class="btn"/>
    				</div>
    			</td>
    		</tr>
    		<tr>
    			<td><font size="4">写作：</font></td>
    			<td><input name="writingGrade" value="${examinee.writingGrade }"/></td>
    		</tr>
    		<tr>
    			<td><font size="4">听力：</font></td>
    			<td><input name="listeningGrade" value="${examinee.listeningGrade }"/></td>
    		</tr>
    		<tr>
    			<td><font size="4">阅读：</font></td>
    			<td><input name="readingGrade" value="${examinee.readingGrade }"/></td>
    		</tr>
    		<tr>
    			<td><font size="4">综合：</font></td>
    			<td><input name="comprehensivingGrade" value="${examinee.comprehensivingGrade }"/></td>
    		</tr>
    		<tr>
    			<td><font size="4">总分：</font></td>
    			<td><input name="total" value="${examinee.total }"/></td>
    		</tr>
    		<tr>
    			<td></td>
    			<td><input style="width: 80px;height: 30px;" type="submit" value="确定"/></td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
