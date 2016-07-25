<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>考生登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script>
		function check()
		{
		 if(loginform.candidate.value == "")
		  {
		  alert("请输入准考证号！");
		  return false;
		  }
		 if(loginform.password.value == "")
		  {
		  alert("请输入密码！");
		  return false;
		  }
		}
		function forget()
		{
		  document.forms[0].action="Examinee_forgetPass";
		  document.forms[0].submit();
		}
	</script>

  </head>
  
  <body>
    <center>
    ${message }
    <br/><br/><br/><br/><br/><br/>
    <h1>考生登录</h1>
        <br/><br/><br/><br/>
		<form name="loginform" method="post" action="Examinee_login">
				准考证号：<input type="text" name="candidate" id="candidate"/> <br/><br/><br/>
				 密&nbsp;码&nbsp;：<input type="password" name="password" id="password"/> <br/><br/><br/>
			    <input value="登录" type="submit" onclick="return check()"/> &nbsp;&nbsp;
			    <input value="注册 " type="button" onclick="window.location.href='';" />&nbsp;&nbsp;
			    <input value="重置" type="button" onclick="this.form.reset();return false;"/> <br/><br/><br/><br/>
		</form>
		<a href="javascript:forget()">忘记密码？点我发送密码到您的邮箱</a><br/><br/>&nbsp;&nbsp;&nbsp;<a href="adminLogin.jsp">点击进入后台</a><br/><br/>
		
		<div>
		
		考生输入准考证号，单击[Enter]按钮继续<br/>
		 如果输入有误，单击[Reset]按钮重新输入
		</div>
  </center>
  </body>
</html>
