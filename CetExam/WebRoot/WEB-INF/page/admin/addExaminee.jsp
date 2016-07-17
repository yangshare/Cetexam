<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加考生信息</title>
    
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

  </head>
  
  <script type="text/javascript">
  	function check()
  	{
  		if(addExaminee.candidateNo.value=="")
  		{
  			alert("考号不能为空！");
  			addExaminee.candidateNo.focus();
  			return false;
  		}
  		if(addExaminee.name.value=="")
  		{
  			alert("姓名不能为空！");
  			addExaminee.name.focus();
  			return false;
  		}
  		if(addExaminee.examineeOfSchool.value=="")
  		{
  			alert("学校不能为空！");
  			addExaminee.examineeOfSchool.focus();
  			return false;
  		}
  		if(addExaminee.examineeImage.value=="")
  		{
  			alert("相片不能为空！");
  			addExaminee.examineeImage.focus();
  			return false;
  		}
  		if(addExaminee.writingGrade.value=="")
  		{
  			addExaminee.writingGrade.value="0";
  		}
  		if(addExaminee.listeningGrade.value=="")
  		{
  			addExaminee.listeningGrade.value="0";
  		}
  		if(addExaminee.readingGrade.value=="")
  		{
  			addExaminee.readingGrade.value="0";
  		}
  		if(addExaminee.comprehensivingGrade.value=="")
  		{
  			addExaminee.comprehensivingGrade.value="0";
  		}
  		if(addExaminee.total.value=="")
  		{
  			addExaminee.total.value="0";
  		}
  		var fileName = addExaminee.examineeImage.value;
  		var i = fileName.lastIndexOf(".");
  		var name = fileName.substring(i);
  		if(name!=".jpg"&&name!=".gif"&&name!=".png")
  		{
  			alert("图片格式不正确！只允许格式：.jpg  .gif  .png");
  			addExaminee.examineeImage.focus();
  			return false;
  		}
  	}
  </script>
  
  <body bgcolor="#f7f8f7">
  	<div class="div">
  	<hr class="hr"/>
  	<h3><font color="#6110c5" style="padding-left: 10px;">添加考生信息</font></h3>
  	<hr/>
  	</div>
    <form action="<%=request.getContextPath() %>/cet4/examineeAction-add" method="post" name="addExaminee" enctype="multipart/form-data" onsubmit="return check()">
    	<table height="40%">
    		<tr>
    			<td width="80px"><font size="4">考号：</font></td>
    			<td><input name="candidateNo"/></td>
    		</tr>
    		<tr>
    			<td><font size="4">姓名：</font></td>
    			<td><input name="name"/></td>
    		</tr>
    		<tr>
    			<td><font size="4">性别：</font></td>
    			<td><select name="sex"><option>男</option><option>女</option></select></td>
    		</tr>
    		<tr>
    			<td><font size="4">学校：</font></td>
    			<td><input name="examineeOfSchool"/></td>
    		</tr>
    		<tr>
    			<td><font size="4">相片：</font></td>
    			<td>
    				<div class="file-box">
    					<input name="examineeImage" id="textfield" class="txt"/>
    					<input type="file" class="file" name="image" onchange="document.getElementById('textfield').value=this.value"/>
    					<input type="button" value="浏览..." class="btn"/>
    				</div>
    				<input type="hidden" name="writingGrade"/>
    				<input type="hidden" name="listeningGrade"/>
    				<input type="hidden" name="readingGrade"/>
    				<input type="hidden" name="comprehensivingGrade"/>
    				<input type="hidden" name="total"/>
    			</td>
    		</tr>
    		<tr>
    			<td></td>
    			<td><input style="width: 80px;height: 30px;" type="submit" value="确定"/></td>
    		</tr>
    	</table>
    </form>
    <br/>
    <h3 class="h3">注意事项：</h3>
    <font size="4">
    	&nbsp;&nbsp;(1) 保证输入的信息为教师的真实信息；<br/><br/>
    	&nbsp;&nbsp;(2) 上传的相片格式只支持JPG、PNG和GIF格式。
    </font>
  </body>
</html>
