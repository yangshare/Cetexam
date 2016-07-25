<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>英语考试进行中</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <script language="javascript">  
     var maxtime = 125*60;//按秒计算 
     function CountDown(){  
      if(maxtime>=0){  
        minutes = Math.floor(maxtime/60);  
        seconds = Math.floor(maxtime%60);  
        msg = "*距离考试结束还有"+minutes+"分"+seconds+"秒";  
        document.all["timer"].innerHTML=msg;  
      if(maxtime == 95*60){//30分钟后开始播放听力
        alert('注意，开始播放听力材料!');  
        --maxtime;  
        document.all["listening"].innerHTML="<audio src='"+document.all['url'].value+"' autoplay='true'></audio>";
        } 
      if(maxtime == 5*60) alert('注意，还有5分钟!');  
        --maxtime;  
        }  
      else{  
       clearInterval(timer);  
       alert("考试结束，请考生轻声离开考场！"); 
       location.href="Cet4System/Test_giveGrade"; 
        }  
     }  
    
    timer = setInterval("CountDown()",1000);   
  
    </script>
 
  </head>
  
  <body>
   <s:debug></s:debug>
    <div id="timer" style="color:black;">&nbsp;</div>
    <div>
    <form action="Test_submitTest" method="post">
    <s:iterator value="test">
    <!--试卷头信息-->
    <h1> ${name } </h1>
    <div>
        <p>◇ 本卷共分为 8大题 57小题，作答时间为 125分钟，总分 710 分，426 分及格。</p>
                <div class="attention">
                    本套试卷含有主观题，针对主观题请自行参考解析评分
                </div>
    </div>
    </div>

                <!--进度信息-->
                <div><br/>
                <a href="javascript:void(0)">作文</a>
                <a href="javascript:void(0)">Section A短篇新闻</a>
                <a href="javascript:void(0)">Section B长对话</a>
                <a href="javascript:void(0)">Section C听力篇章</a>
                <a href="javascript:void(0)">Section A选词填空</a>
                <a href="javascript:void(0)">Section B段落匹配</a>
                <a href="javascript:void(0)">Section C仔细阅读</a>
                <a href="javascript:void(0)">汉译英</a>
                </div>
               <br><br/><br/>

                <!-- 试题部分 -->
                <!-- 写作 -->
                <b>Part I Writing(30 minutes)</b>
                <br><br/>
                ${baseWriting.title}           
                <br/><br/>
                <textarea rows="7" cols="90" name="writingAnswer"></textarea>
                <br/><br/>
                
                <!-- 听力 -->
				<b>Part II Listening Comprehension (30minutes)</b>
				<br><br>
				<div id="listening"><input id="url" type="hidden" value="${baseListening.materialurl}"></div>
				<s:iterator id="seed" value="baseListening.seedListenings">
				  ${seed.options} <br/><br/>
				  &nbsp;&nbsp;选择答案:<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen%{#seed.id%26}" ></s:radio> <br/><br/><br/>
				</s:iterator>
				
				<!-- 词汇理解 -->
				<b>Part III Reading Comprehension (40 minutes)</b>
				<br><br>
				${baseWordunderstand.essay}<br/> <br/>           
				${baseWordunderstand.options}<br/><br/>            
				填入答案:<input type="text" name="wordunderstandAnswer"/><br><br>
				
				<!-- 长阅读 -->
				${baseLongreading.essay}<br/><br/>
				${baseLongreading.options}<br/><br/>
				填入答案:<input type="text" name="lognreadingAnswer"/><br><br>
				
				<!-- 仔细阅读 -->
				${baseCarereading1.essay}<br/><br/>
				<s:iterator id="seed" value="baseCarereading1.seedCarereadings">
				  ${seed.question} <br/><br/>
				  &nbsp;&nbsp;${seed.options} <br/><br/>
				  &nbsp;&nbsp;选择答案:<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="carereading%{#seed.id%6+45}" ></s:radio> <br/><br/><br/>
				</s:iterator>
				${baseCarereading2.essay}<br/><br/>
				<s:iterator id="seed" value="baseCarereading2.seedCarereadings">
				  ${seed.question} <br/><br/>
				  &nbsp;&nbsp;${seed.options} <br/><br/>
				  &nbsp;&nbsp;选择答案:<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="carereading%{#seed.id%6+50}" ></s:radio> <br/><br/><br/>
				</s:iterator>
                
                <!-- 翻译 -->
                <b>Part IV Translation (30 minutes)</b><br/><br/>
				${baseTranslate.essay}<br/><br/>
                <textarea rows="7" cols="90" name="translateAnswer"></textarea>
                <br/><br/>
				</s:iterator>
				<input type="submit" value="交卷"/>
				</form>
				<!-- 试题部分结束 -->
		
  </body>
</html>
