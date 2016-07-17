<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>练习系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
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
  
  <body>
    ${message }
  	<center><h2 style="margin-top: 200px">试题信息</h2></center>
  	<table width="50%" align="center" border=3 > 
  		<tr>
  				<td>题号</td>
  				<td>试题名</td>
  				<td>操作</td>
  		</tr>
  		<s:iterator value="testList">
  		<tr>
  			<td>${id}</td>
    		<td>${name}</td>
    		<td><a href="<%=request.getContextPath() %>/Test_toDBTest?testid=${id}">练习</a></td>
    	</tr>
    	</s:iterator>
  	</table>
     
    <table width="50%" align="center" style="margin-top: 40px">
    	<tr>
    		<td>
			    <a href="<%=request.getContextPath() %>/Test_pagingExercise?curPage=1">【首页】</a>
			    <c:if test="${curPage>1}">
			    	<a href="<%=request.getContextPath() %>/Test_pagingExercise?curPage=${curPage-1}">【上一页】</a>
			    </c:if>
			    <c:if test="${curPage<maxPage}">
			    	<a href="<%=request.getContextPath() %>/Test_pagingExercise?curPage=${curPage+1}">【下一页】</a>
			    </c:if>
			    <a href="<%=request.getContextPath() %>/Test_pagingExercise?curPage=${maxPage}">【尾页】</a>
    		</td>
    		<td>
			    <form action="<%=request.getContextPath() %>/Test_pagingExercise" name="page" onsubmit="return check()">   
				           跳转到<input name="curPage" size="2" value="1"/>页
				    <input type="submit" value="跳转"/>
			    </form> 
    		</td>
    		<td>
    			共：${maxPage }页&nbsp;&nbsp;当前：第${curPage }页
    		</td>
    	</tr>
    </table>
   <center style="margin-top: 30px"> 不想从题库中选试卷？点我<a href="javascript:inputdiff();">自动生成试题</a>练习</center>>
    <script>
      function inputdiff(){
         var diff= prompt("Warn,请设置想生成的试卷难度(0-1之间)","0.55");
         if(diff!=null){
           window.location.href="<%=request.getContextPath() %>/Test_toGATest?difficulty="+diff;
         } 
      }
    </script>
  </body>
</html>
