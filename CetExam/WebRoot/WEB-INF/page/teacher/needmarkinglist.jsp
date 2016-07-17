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
    
    <title>My JSP 'needmarkinglist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
  	function check(){
  		if(page.curPage.value<1){
  			page.curPage.value=1;
  		}
  		if(page.curPage.value>${maxPage}){
  			page.curPage.value = ${maxPage};
  		}
  	}
  </script>
  </head>
  
  <style type="text/css">
body {
    background-color: #EEF2FB;
	font:12px Arial, Helvetica, sans-serif;
	color: #000;
	margin: 0px;
}
#message{
position:absolute;
top:0px;
left:10px;
width: 820px;
height:400px;
border: 2px solid #ccccff;
background-image: url("images/background5.jpg");
}

#nowposition{
position:absolute;
top:10px;
left:10px;
}
#table1{
width:440px;
height:200px;
position:absolute;
top:50px;
left:130px;
border: 1px solid white;
}
#tablepage{
position:absolute;
top:280px;
left:80px;
}
A:hover{color:red;}
A{text-decoration: none;font-size: 15px;}
	</style>

  <body>
  <s:div id="message">
  	    <s:div id="nowposition">
  	                当前位置：试卷列表
  	    </s:div>
  	         <br>
  	      <table id="table1">
  	      <tr bgcolor="#6699ff">
  	      <th>试卷名</th>
  	      <th>批改状态</th>
  	      <th>操作</th>
  	      <th>批改时间</th>
  	      </tr>
  	       <s:iterator value="list">  
  	      <tr align="center" bgcolor="#EEF2FB">
  	        <td>试卷cet4</td>
  	        <td><P id="sp"><s:property value="status"></s:property></P></td>
  		    <td><a href="<%=request.getContextPath()  %>/cet4/needmark_currect?candidateNo=${candidateNo}" target="showteacherright">批改</a></td>
  	        <td><s:if test="%{time==null}">无</s:if><s:else>
  	        <s:property value="time"/></s:else></td>
  	      </tr>
  	      </s:iterator> 
  	      
  	      </table >
  	      <table width="80%" align="center" cellspacing="0" id="tablepage">
    	<tr align="center" bgcolor="">
    		<td>
			    <a href="<%=request.getContextPath() %>/cet4/needmark_list?curPage=1">【首页】</a>
			    <s:if test="%{curPage>1}">
			    	<a href="<%=request.getContextPath() %>/cet4/needmark_list?curPage=${curPage-1}">【上一页】</a>
			    </s:if>
			    <s:if test="%{curPage<maxPage}">
			    	<a href="<%=request.getContextPath() %>/cet4/needmark_list?curPage=${curPage+1}">【下一页】</a>
			    </s:if>
			    <a href="<%=request.getContextPath() %>/cet4/needmark_list?curPage=${maxPage}">【尾页】</a>  		</td>
    		<td id="font">
    			共：${maxPage }页&nbsp;&nbsp;当前：第${curPage }页
    		</td>
    	</tr>
    </table>       
  		          
  	         	 
  	        
  	 </s:div>
  </body>
</html>

