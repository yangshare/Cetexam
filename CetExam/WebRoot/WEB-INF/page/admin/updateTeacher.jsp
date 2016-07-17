<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改教师信息</title>
    
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
		.txtid{ border:1px solid gray; background-color: gray;}
		.txt{ height:22px; border:1px solid #cdcdcd; width:180px;}
		.btn{ background-color:#FFF; border:1px solid #CDCDCD;height:24px; width:70px;}
		.file{ position:absolute; top:0; right:80px; height:24px; filter:alpha(opacity:0);opacity: 0;width:260px }
	</style>

  </head>
  
  <script type="text/javascript">
  	function check()
  	{
  		if(updateTeacher.teacherName.value=="")
  		{
  			alert("姓名不能为空！");
  			updateTeacher.teacherName.focus();
  			return false;
  		}
  		else if(updateTeacher.password.value=="")
  		{
  			alert("密码不能为空！");
  			updateTeacher.password.focus();
  			return false;
  		}
  		else if(updateTeacher.teacherOfSchool.value=="")
  		{
  			alert("学校不能为空！");
  			updateTeacher.teacherOfSchool.focus();
  			return false;
  		}
  		var fileName = updateTeacher.teacherImage.value;
  		var i = fileName.lastIndexOf(".");
  		var name = fileName.substring(i);
  		if(name!=".jpg"&&name!=".gif"&&name!=".png")
  		{
  			alert("图片格式不正确！只允许格式：.jpg  .gif  .png");
  			updateTeacher.teacherImage.focus();
  			return false;
  		}
  	}
  </script>
  
  <body bgcolor="#f7f8f7">
  	<div class="div">
  	<hr class="hr"/>
  	<h3><font color="#6110c5" style="padding-left: 10px;">修改教师信息</font></h3>
  	<hr/>
  	</div>
    <form action="<%=request.getContextPath() %>/cet4/teacherAction-update" method="post" name="updateTeacher" enctype="multipart/form-data" onsubmit="return check()">
    	<table height="85%">
    		<tr>
    			<td width="80px"><font size="4">编号：</font></td>
    			<td><input name="id" value="${teacher.id }" readonly="readonly" class="txtid"/></td>
    		</tr>
    		<tr>
    			<td><font size="4">姓名：</font></td>
    			<td><input name="teacherName" value="${teacher.teacherName }"/></td>
    		</tr>
    		<tr>
    			<td><font size="4">密码：</font></td>
    			<td><input name="password" value="${teacher.password}"/></td>
    		</tr>
    		<tr>
    			<td><font size="4">学校：</font></td>
    			<td><input name="teacherOfSchool" value="${teacher.teacherOfSchool }"/></td>
    		</tr>
    		<tr>
    			<td valign="top"><font size="4">相片：</font></td>
    			<td>
    				<img src="${teacher.teacherImage }" width="150px" height="200px">
    				<div class="file-box">
    					<input name="teacherImage" id="textfield" value="${teacher.teacherImage }" class="txt"/>
    					<input type="file" class="file" name="image" onchange="document.getElementById('textfield').value=this.value"/>
    					<input type="button" value="浏览..." class="btn"/>
    				</div>
    			</td>
    		</tr>
    		<tr>
    			<td></td>
    			<td><input style="width: 80px;height: 30px;" type="submit" value="确定"/></td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
