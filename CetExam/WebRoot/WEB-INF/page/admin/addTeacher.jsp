<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加教师信息</title>
    
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
		.h3{padding-left: 20px;}
		.hr{margin: 0;}
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
  		if(addTeacher.teacherName.value=="")
  		{
  			alert("姓名不能为空！");
  			addTeacher.teacherName.focus();
  			return false;
  		}
  		if(addTeacher.password.value=="")
  		{
  			alert("密码不能为空！");
  			addTeacher.password.focus();
  			return false;
  		}
  		if(addTeacher.teacherOfSchool.value=="")
  		{
  			alert("学校不能为空！");
  			addTeacher.teacherOfSchool.focus();
  			return false;
  		}
  		if(addTeacher.teacherImage.value=="")
  		{
  			alert("请选择相片！");
  			addTeacher.teacherImage.focus();
  			return false;
  		}
  		if(addTeacher.repassword.value!=addTeacher.password.value)
  		{
  			alert("两次密码不一致！");
  			addTeacher.repassword.focus();
  			return false;
  		}
  		var fileName = addTeacher.teacherImage.value;
  		var i = fileName.lastIndexOf(".");
  		var name = fileName.substring(i);
  		if(name!=".jpg"&&name!=".gif"&&name!=".png")
  		{
  			alert("图片格式不正确！只允许格式：.jpg  .gif  .png");
  			addTeacher.teacherImage.focus();
  			return false;
  		}
  	}
  </script>
  
  <body bgcolor="#f7f8f7">
  	<div class="div">
  	<hr class="hr"/>
  	<h3><font color="#6110c5" style="padding-left: 10px;">添加教师信息</font></h3>
  	<hr/>
  	</div>
    <form action="<%=request.getContextPath() %>/cet4/teacherAction-add" method="post" name="addTeacher" enctype="multipart/form-data" onsubmit="return check()">
    	<table height="40%">
    		<tr>
    			<td width="80px"><font size="4">姓名：</font></td>
    			<td><input name="teacherName"/><br/></td>
    		</tr>
    		<tr>
    			<td><font size="4">密码：</font></td>
    			<td><input type="password" name="password"/></td>
    		</tr>
    		<tr>
    			<td><font size="4">再次输入密码：</font></td>
    			<td><input type="password" name="repassword"/></td>
    		</tr>
    		<tr>
    			<td><font size="4">学校：</font></td>
    			<td><input name="teacherOfSchool"/></td>
    		</tr>
    		<tr>
    			<td><font size="4">相片：</font></td>
    			<td>
    				<div class="file-box">
    					<input name="teacherImage" id="textfield" class="txt"/>
    					<input type="file" class="file" name="image" onchange="document.getElementById('textfield').value=this.value"/>
    					<input type="button" value="浏览..." class="btn"/>
    				</div>
    			</td>
    		</tr>
    		<tr>
    			<td colspan="2" style="padding-left: 85px;"><input style="width: 80px;height: 30px;" type="submit" value="确  定"/></td>
    		</tr>
    	</table>
    </form>
    <br/>
    <h3 class="h3">注意事项：</h3>
    <font size="4">
    	&nbsp;&nbsp;(1) 保证输入的信息为教师的真实信息；<br/><br/>
    	&nbsp;&nbsp;(2) 两次输入的密码要保持一致；<br/><br/>
    	&nbsp;&nbsp;(3) 上传的相片格式只支持JPG、PNG和GIF格式。
    </font>
  </body>
</html>
