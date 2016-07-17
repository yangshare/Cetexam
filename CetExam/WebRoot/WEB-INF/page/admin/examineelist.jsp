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
    
    <title>考生信息</title>
    
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
  	.hr{margin: 0;}
	.h3{padding-left: 20px;}
	.div{background-color: #9edce3;}
  	a{text-decoration: none;font-size: 15px;}
  	a:HOVER{color: red;}
  	#font{font-size: 15px;color: #1287d1;}
  </style>
  
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
  
  <body bgcolor="#f7f8f7" style="border:2px solid #ccccff;">
  	<div class="div">
  	<hr class="hr"/>
  	<h3><font color="#6110c5" style="padding-left: 10px;">查询考生信息</font></h3>
  	<hr/>
  	</div>
    <s:iterator value="examinees">
    <table width="80%">
    	<tr>
    		<td align="center"><img src="${image }" width="150px" height="200px"/></td>
  			<td align="left">
  			<h4 style="color: #524c4c;">
  				<br/>
	  			考号：${candidateNo }<br/><br/>
	  			姓名：${name }<br/><br/>
	  			性别：${sex }<br/><br/>
	  			学校：${examineeOfSchool }
	  		</h4>
  			</td>
  		</tr>
    </table>
    <hr width="100%" style="border: 1px dashed #e9e9e9;"/>
    </s:iterator>
    <table width="90%" align="center">
    	<tr>
    		<td>
			    <a href="<%=request.getContextPath() %>/cet4/examineeAction?curPage=1">【首页】</a>
			    <c:if test="${curPage>1}">
			    	<a href="<%=request.getContextPath() %>/cet4/examineeAction?curPage=${curPage-1}">【上一页】</a>
			    </c:if>
			    <c:if test="${curPage<maxPage}">
			    	<a href="<%=request.getContextPath() %>/cet4/examineeAction?curPage=${curPage+1}">【下一页】</a>
			    </c:if>
			    <a href="<%=request.getContextPath() %>/cet4/examineeAction?curPage=${maxPage}">【尾页】</a>&nbsp;&nbsp;&nbsp;&nbsp;
    		</td>
    		<td style="padding-top: 15px;">
			    <form action="<%=request.getContextPath() %>/cet4/examineeAction" name="page" onsubmit="return check()">   
				           跳转到<input name="curPage" size="1" value="1"/>页
				    <input type="submit" value="跳转"/>
			    </form> 
    		</td>
    		<td id="font">
    			共：${maxPage }页&nbsp;&nbsp;当前：第${curPage }页
    		</td>
    	</tr>
    </table> 
  </body>
</html>
