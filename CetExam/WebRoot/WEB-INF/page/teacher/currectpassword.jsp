<%@ page language="java" import="java.util.*,com.cet.pojo.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'teacherneedknow.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
body {
	background-color: #EEF2FB;
	font: 15px Arial, Helvetica, sans-serif;
	color: #000;
	margin: 0px;
}

#message {
	position: absolute;
	top: 0px;
	left: 10px;
	width: 820px;
	height: 400px;
	border: 2px solid #ccccff;
	background-image: url("images/background5.jpg");
}

#nowposition {
	position: absolute;
	top: 10px;
	left: 10px;
}

#pwd1 {
	width: 205px;
	height: 28px;
	border: 1px solid #999999;
	outline: 1px solid #cccccc;
	
}
#pwd2 {
	width: 205px;
	height: 28px;
	border: 1px solid #999999;
	
}
#sub {
	position: absolute;
	top: 260px;
	left: 300px;
	outline: none;
}

#oldpwd {
	position: absolute;
	top: 100px;
	left: 200px;
}

#newpwds {
	position: absolute;
	top: 140px;
	left: 200px;
}

#newpwdagains {
	position: absolute;
	top: 190px;
	left: 184px;
	
}
</style>
	<script type="text/javascript">
	
	function checknewpwd(){
		  // alert("happy");
		  var x=document.getElementById("pwd1").value;
		   if(x.length==0){
		  // alert("dd");
		        $("#newpwdm").css("display","inline");	
		        $("#newpwd").css("display","none");
		        return false;
			}
			else if(x.length<6){
			   $("#newpwdm").css("display","onne");	
			   $("#newpwd").css("display","inline");
		        return false;
			}
			else{
			    $("#newpwdm").css("display","none");
			    $("#newpwd").css("display","inline");
			    return true;
			}
		}
	function checknewpwdagain(){
	        var y=document.getElementById("pwd2").value;
		    if(y!=x){
		        $("#newpwdagain").css("display","inline");	
		        return false;
			}else{
			    $("#newpwdagain").css("display","none");
			    return true;
			}
		}
		function check()
  	{
  		if(cform.newpwd.value=="")
  		{
  			alert("密码不能为空！");
  			cform.newpwd.focus();
  			return false;
  		}
  		if(cform.newpwdagain.value!=cform.newpwd.value)
  		{
  			alert("两次输入的密码不相同！");
  			cform.newpwd.focus();
  			return false;
  		}
  	}
	</script>
  </head>
  <body>
 
  <s:div id="message">
  	    <s:div id="nowposition">
  	                当前位置：修改密码
  	    </s:div>
  	         <br/><br/><br>
  		           <s:form method="post" action="/cet4/updatepwd_currectpwd.action" name="cform" onsubmit="return check()">
  		           <s:iterator value="teacher ">
  		           <div id="oldpwd">原密码：<s:property value="password"/></div>
  		             <s:hidden name="id" ></s:hidden>
  		           </s:iterator>
  		           <div id="newpwds"> 
  		           新密码：<s:password name="newpwd" onblur="checknewpwd()" id="pwd1"></s:password>
  		        <span id="newpwd">密码不能少于6个字符 </span>
  		        <span id="newpwdm" style="display:none;" >密码不能为空</span>
  		        </div>
                   <div id="newpwdagains"> 密码确认：<s:password name="newpwdagain" onblur="checknewpwdagain()" id="pwd2"></s:password>
                 <span id="newpwdagain" style="display: none;">两次密码输入不正确 </span></div>
       
               <s:submit type="image" src="images/xiugai1.jpg" id="sub" ></s:submit>
            </s:form>       
  	 </s:div>
  </body>
</html>
