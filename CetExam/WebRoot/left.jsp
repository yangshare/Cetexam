<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>导航页面</title>
    
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
		*{margin:0; padding:0}
		#na{width:200px; margin:0px}
		#na h3{ cursor:pointer; padding-left:35px; line-height:30px; height:30px; background-image:url("images/dao.jpg"); color:#064550;}
		#na h3:hover{background-color:#eee; color:#000;}
		#na a{display:block;color:#064550;text-decoration: none;}
		#na a:hover{color:red;}
		#nav{width:200px; margin:0px}
		#a{cursor:pointer; padding-left:35px; line-height:30px; height:30px;}
		#nav h3{ cursor:pointer; padding-left:35px; line-height:30px; height:30px; background-image:url("images/dao.jpg"); color:#064550;}
		#nav h3:hover{background-color:#eee; color:red;}
		#nav a{display:block; padding-left:40px; line-height:24px;color:#1287d1;text-decoration: none;font-size: 15px;}
		#nav a:hover{background-color:#dcccd8; color:red;}
		#nav div{display:none; border:1px solid white; border-top:none}
	</style>
	
	<script type="text/javascript">
		function $(id){return document.getElementById(id)}
			window.onload = function(){
				 $("nav").onclick = function(e){
					  var src = e?e.target:event.srcElement;
					  if(src.tagName == "H3"){
					  var next = src.nextElementSibling || src.nextSibling;
					  next.style.display = (next.style.display =="block")?"none":"block";
				  }
			 }
		}
	</script>
  
  <body bgcolor="#e2ecf2">

  	<div id="na">
  		<h3><a href="home.jsp" target="showAdmin">首    页</a></h3>
    </div>
    <div id="nav">
	 	<h3>教师管理</h3>
	    <div>
	     	<a href="<%=request.getContextPath() %>/cet4/teacherAction?curPage=1" target="showAdmin">●管理教师</a>
	     	<a href="<%=request.getContextPath() %>/cet4/teacherAction-link" target="showAdmin">●添加教师</a>
	    </div>
	    <h3>考生管理</h3>
	    <div>
	     	<a href="<%=request.getContextPath() %>/cet4/examineeAction?curPage=1" target="showAdmin">●管理考生</a>
	        <a href="<%=request.getContextPath() %>/cet4/examineeAction-link" target="showAdmin">●添加考生</a>
	    </div>
	    <h3>试题管理</h3>
	    <div>
	    	<a href="<%=request.getContextPath() %>/cet4/testAction" target="showAdmin">●管理试题</a>
	        <a href="<%=request.getContextPath() %>/cet4/testAction-gotoAdd" target="showAdmin">●新增试题</a>
	    </div>
	    <h3>考试管理</h3>
	    <div>
	     	<a href="<%=request.getContextPath() %>/cet4/Exam?curPage=1" target="showAdmin">●管理考试</a>
	        <a href="<%=request.getContextPath() %>/cet4/Exam_gotoAdd" target="showAdmin">●添加考试</a>
	    </div>
	</div>
	<div id="na">
	   <h3><a href="adminLogin.jsp" target="_top">退出系统</a></h3>
  	</div>
  </body>
</html>
