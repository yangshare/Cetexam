<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改密码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  ${message }
    <h3>修改密码</h3>
    <form action="Examinee_updatePass" method="post">
                旧密码：<input name="password" value=""/><br/><br/>
                新密码：<input id="newpassword" name="newpassword" value=""/><br/><br/>
                <input type="submit" value="修改"/>&nbsp;&nbsp;
                <input type="reset" value="重置"/>
    </form>
  </body>
</html>
