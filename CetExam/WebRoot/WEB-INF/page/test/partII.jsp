<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>">
    
    <title>大学英语四级</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
    body,h1,ul{margin:0;}
    ul li{list-style-type:none;}
    .nav{width:1380px;background:#fff;margin:0px auto 0;border:solid 1px #ccc;zoom:1;border-radius:opx;box-shadow:0 1px 6px rgba(0,0,0,0.1);color:#D74452;}
    .nav_scroll{position:fixed;width:100%;margin:0;left:0;top:0;}
    .nav:after{content:"";display:block;height:0;clear:both;visibility:hidden;}
    .nav ul li{float:left;margin:0 00px;height:0px;line-height:0px;}
    .nav ul li a{cursor:pointer; }
    .nav ul li a:hover{text-decoration:underline;}
  h3{height:400px;line-height:400px;}
  #sub{
  position: absolute;
  top:13550px;
  left:250px;
  }
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function(){
                var topMain=$("#header").height()+20//是头部的高度加头部与nav导航之间的距离。
                var nav=$(".nav");
                $(window).scroll(function(){
                    if ($(window).scrollTop()>topMain){//如果滚动条顶部的距离大于topMain则就nav导航就添加类.nav_scroll，否则就移除。
                        nav.addClass("nav_scroll");
                    }
                    else
                    {
                        nav.removeClass("nav_scroll");
                    }
                });
     
        })
</script>
<script language="javascript">  
 var maxtime = 30*80//半个小时，按秒计算，自己调整!  
 function CountDown(){  
 if(maxtime>=0){  
 minutes = Math.floor(maxtime/30);  
 seconds = Math.floor(maxtime%30);  
 msg = "距离考试结束还有"+minutes+"分"+seconds+"秒";  
 document.all["timer"].innerHTML=msg;  
 if(maxtime == 5*30) alert('注意，还有5分钟!');  
 --maxtime;  
 }  
 else{  
 clearInterval(timer);  
 alert("考试结束，请考生轻声离开考场！"); 
 location.href="Cet4System/cet4/grade_givegrade.action"; 
 }  
 }  
 timer = setInterval("CountDown()",1000);   
 </script> 
 
<style type="text/css">
#partII{
position:absolute;
top:20px;
left:280px;
width: 780px;
}
#pre{
width:780px;word-break: break-all; word-wrap:break-word;
}
#testfield{
	width: 205px;
	height: 28px;
	border: 1px solid #999999;
	outline: 1px solid #cccccc;


}
</style>
  </head>
  
  <body>
    <div id="timer" style="color:black;" style="position:absolute; left: 153px; top:76px;"></div>
  
   <font size="4">
  <s:div id="partII">
  
  <s:form action="/cet4/grade_givegrade.action" method="post">
  
  <!-- 听力部分begin -->
  <br/><br/><br/><br/><br/><br/><br/><br/>
  <s:iterator value="listeningmaterials" begin="0" end="0" step="1">
    <pre>
       <embed src="${material }" width="300" height="45" loop="false" autostart="true" />
    </pre>
  </s:iterator>
  
 <b>Listening Comprehension</b>&nbsp;&nbsp; Section A(共36题,共248.5分)<br/>
       <b> Directions:</b> In this section, you will hear 8 short conversations and 2 long conversations. At the end of each conversation, one or more questions will be asked about what was said. Both the conversation and the questions will be spoken only once. After each question there will be a pause. During the pause, you must read the four choices marked A), B), C) and 19), and decide which is the best answer. Then mark the corresponding letter on Answer Sheet 2 with a single line through the centre.
    <s:iterator value="optionoflistenings" begin="0" end="24" step="1">
        <s:if test="%{id==(#session.testid-1)*45+1}">
           <pre id="pre"><img src="images/imgs/12.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre> 
<table>
<tr>
<td>选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen11" ></s:radio></td>
</tr>   
</table>       
      </s:if>
           <s:if test="%{id==(#session.testid-1)*45+2}">
           <pre id="pre"><img src="images/imgs/13.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>    
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen12" ></s:radio>         
      </s:if>
          <s:if test="%{id==(#session.testid-1)*45+3}">
           <pre id="pre"><img src="images/imgs/14.jpg"/>
           <b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>         
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen13" ></s:radio>    
      </s:if>
          <s:if test="%{id==(#session.testid-1)*45+4}">
           <pre id="pre"><img src="images/imgs/15.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>    
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen14" ></s:radio>         
      </s:if>
          <s:if test="%{id==(#session.testid-1)*45+5}">
           <pre id="pre"><img src="images/imgs/16.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre> 
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen15" ></s:radio>            
      </s:if>
          <s:if test="%{id==(#session.testid-1)*45+6}">
           <pre id="pre"><img src="images/imgs/17.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>        
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen16" ></s:radio>     
      </s:if>
          <s:if test="%{id==(#session.testid-1)*45+7}">
           <pre><img src="images/imgs/18.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>    
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen17" ></s:radio>         
      </s:if>
          <s:if test="%{id==(#session.testid-1)*45+8}">
           <pre><img src="images/imgs/19.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>       
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen18" ></s:radio>     
      </s:if>
   </s:iterator>
     <br/> Questions 19 to 22 are based on the conversation you have just heard.
   <s:iterator value="optionoflistenings" begin="8" end="11" step="1">
          <s:if test="%{id==(#session.testid-1)*45+9}">
           <pre><img src="images/imgs/1.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>    
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen19" ></s:radio>          
      </s:if>
          <s:if test="%{id==(#session.testid-1)*45+10}">
           <pre><img src="images/imgs/2.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>      
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen110" ></s:radio>       
      </s:if>
          <s:if test="%{id==(#session.testid-1)*45+11}">
           <pre id="pre"><img src="images/imgs/3.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>         
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen111" ></s:radio>     
      </s:if>
          <s:if test="%{id==(#session.testid-1)*45+12}">
           <pre id="pre"><img src="images/imgs/4.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>         
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen112" ></s:radio>    
      </s:if>     
      </s:iterator>
     <br/> Questions 23 to 25 are based on the conversation you have just heard.
   <s:iterator value="optionoflistenings" begin="12" end="14" step="1"> 
                <s:if test="%{id==(#session.testid-1)*45+13}">
           <pre id="pre"><img src="images/imgs/1.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>      
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen113" ></s:radio>       
      </s:if>
          <s:if test="%{id==(#session.testid-1)*45+14}">
           <pre id="pre"><img src="images/imgs/2.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>       
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen114" ></s:radio>      
      </s:if>
          <s:if test="%{id==(#session.testid-1)*45+15}">
           <pre id="pre"><img src="images/imgs/3.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>         
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen115" ></s:radio>     
      </s:if>   
      </s:iterator>
     <br/> Section B <br/> 
  <b> Directions:</b>In this section, you will hear 3 short passages. At the end of each passage, you will hear some questions. Both the passage and the questions will be spoken only once. After you hear a question, you must choose the best answer from the four choices marked A), B), C) and D). Then mark the corresponding letter on Answer Sheet 2 with a single line through the centre.   
   Passage One     
   Questions 26 to 28 are based on the conversation you have just heard.
  <s:iterator value="optionoflistenings" begin="15" end="17" step="1"> 
                <s:if test="%{id==(#session.testid-1)*45+16}">
           <pre id="pre"><img src="images/imgs/1.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>      
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen116" ></s:radio>      
      </s:if>
          <s:if test="%{id==(#session.testid-1)*45+17}">
           <pre id="pre"><img src="images/imgs/2.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>      
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen117" ></s:radio>       
      </s:if>
          <s:if test="%{id==(#session.testid-1)*45+18}">
           <pre id="pre"><img src="images/imgs/3.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>     
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen118" ></s:radio>       
      </s:if>    
    </s:iterator>  
  <br/>  Passage Two <br/>   Questions 29 to 31 are based on the conversation you have just heard.
  <s:iterator value="optionoflistenings" begin="18" end="20" step="1"> 
            <s:if test="%{id==(#session.testid-1)*45+19}">
           <pre id="pre"><img src="images/imgs/1.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>   
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen119" ></s:radio>          
      </s:if>
          <s:if test="%{id==(#session.testid-1)*45+20}">
           <pre id="pre"><img src="images/imgs/2.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>     
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen120" ></s:radio>        
      </s:if>
          <s:if test="%{id==(#session.testid-1)*45+21}">
           <pre id="pre"><img src="images/imgs/3.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>  
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen121" ></s:radio>           
      </s:if>   
     </s:iterator>       
   <br/> Passage Three
   <br/> Questions 32 to 35 are based on the conversation you have just heard.
   <s:iterator value="optionoflistenings" begin="21" end="24" step="1">  
         <s:if test="%{id==(#session.testid-1)*45+22}">
           <pre id="pre"><img src="images/imgs/1.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>      
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen122" ></s:radio>       
      </s:if>
           <s:if test="%{id==(#session.testid-1)*45+23}">
           <pre id="pre"><img src="images/imgs/2.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>   
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen123" ></s:radio>          
      </s:if>
          <s:if test="%{id==(#session.testid-1)*45+24}">
           <pre id="pre"><img src="images/imgs/3.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>     
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen124" ></s:radio>         
      </s:if>
          <s:if test="%{id==(#session.testid-1)*45+25}">
           <pre id="pre"><img src="images/imgs/4.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>  
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="listen125" ></s:radio>          
      </s:if>    
      </s:iterator>
<br></br>Section C<br/>
    Directions:In this section, you will hear a passage three times. When the passage is read for the first time, you should listen carefully for its general idea. When the passage is read for the second time, you are required to fill in the blanks numbered from 36 to 43 with the exact words you have just heard. For blanks numbered from 44 to 46 you are required to fill in the missing information. For these blanks, you can either use the exact words you have just heard or write down the main points in your own words. Finally, when the passage is read for the third time, you should check what you have written.    
    <s:iterator value="titlesofreadings" begin="5" end="5" step="1">
        <pre id="pre"><s:property value="title"/></pre>
        <img src="images/imgs/1.jpg"/>填写答案：<s:textfield name="listen126" id="testfield"></s:textfield><br/>
        <img src="images/imgs/2.jpg"/>填写答案：<s:textfield name="listen127" id="testfield"></s:textfield><br/>
       <img src="images/imgs/3.jpg"/>填写答案：<s:textfield name="listen128" id="testfield"></s:textfield><br/>
        <img src="images/imgs/4.jpg"/>填写答案：<s:textfield name="listen129" id="testfield"></s:textfield><br/>
        <img src="images/imgs/5.jpg"/>填写答案：<s:textfield name="listen130" id="testfield"></s:textfield><br/>
        <img src="images/imgs/6.jpg"/>填写答案：<s:textfield name="listen131" id="testfield"></s:textfield><br/>
        <img src="images/imgs/7.jpg"/>填写答案：<s:textfield name="listen132" id="testfield"></s:textfield><br/>
        <img src="images/imgs/8.jpg"/>填写答案：<s:textfield name="listen133" id="testfield"></s:textfield><br/>
        <img src="images/imgs/9.jpg"/>填写答案：<s:textfield name="listen134" id="testfield"></s:textfield><br/>
       <img src="images/imgs/10.jpg"/>填写答案：<s:textfield name="listen135" id="testfield"></s:textfield><br/>
        <img src="images/imgs/11.jpg"/>填写答案：<s:textfield name="listen136" id="testfield"></s:textfield><br/>
    </s:iterator>
   
  <!-- 听力部分end -->
  <!-- 选词填空部分begin -->
 <b> Part Ⅳ Reading Comprehension (Reading in Depth)</b>(共20题,共177.5分)<br/>
Section A    
  <s:iterator value="titlesofreadings" begin="1" end="1" step="1"> 
     <pre id="pre"><s:property value="title"/></pre>
        <img src="images/imgs/1.jpg"/>填写答案：<s:textfield name="choose1" id="testfield"></s:textfield><br/>
        <img src="images/imgs/2.jpg"/>填写答案：<s:textfield name="choose2" id="testfield"></s:textfield><br/>
        <img src="images/imgs/3.jpg"/>填写答案：<s:textfield name="choose3" id="testfield"></s:textfield><br/>
        <img src="images/imgs/4.jpg"/>填写答案：<s:textfield name="choose4" id="testfield"></s:textfield><br/>
        <img src="images/imgs/5.jpg"/>填写答案：<s:textfield name="choose5" id="testfield"></s:textfield><br/>
        <img src="images/imgs/6.jpg"/>填写答案：<s:textfield name="choose6" id="testfield"></s:textfield><br/>
       <img src="images/imgs/7.jpg"/>填写答案：<s:textfield name="choose7" id="testfield"></s:textfield><br/>
        <img src="images/imgs/8.jpg"/>填写答案：<s:textfield name="choose8" id="testfield"></s:textfield><br/>
       <img src="images/imgs/9.jpg"/>填写答案：<s:textfield name="choose9" id="testfield"></s:textfield><br/>
        <img src="images/imgs/10.jpg"/>填写答案：<s:textfield name="choose10" id="testfield"></s:textfield><br/>
     
  </s:iterator>
  <!-- 选词填空部分end -->
  <!-- 阅读部分begin -->
  Section B<br/>
  <b> Directions: </b>There are 2 passages in this section. Each passage is followed by some questions or unfinished statements. For each of them there are four choices marked A), B), C) and D). You should decide on the best choice and mark the corresponding letter on Answer Sheet 2 with a single line through the centre.
Passage One
 <s:iterator value="titlesofreadings" begin="2" end="2" step="1"> 
    <pre id="pre"><s:property value="title"/></pre>
    <s:iterator value="optionsofreadings" begin="10" end="14" step="1">
       <s:if test="%{id==(#session.testid-1)*20+11}">
           <pre id="pre"><img src="images/imgs/1.jpg"/><s:property value="title"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre> 
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="read1"></s:radio>          
      </s:if>
      <s:if test="%{id==(#session.testid-1)*20+12}">
           <pre id="pre"><img src="images/imgs/2.jpg"/><s:property value="title"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>  
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="read2"></s:radio>       
      </s:if>
      <s:if test="%{id==(#session.testid-1)*20+13}">
           <pre id="pre"><img src="images/imgs/3.jpg"/><s:property value="title"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>   
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="read3"></s:radio>        
      </s:if>
      <s:if test="%{id==(#session.testid-1)*20+14}">
           <pre id="pre"><img src="images/imgs/4.jpg"/><s:property value="title"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>   
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="read4"></s:radio>       
      </s:if>
      <s:if test="%{id==(#session.testid-1)*20+15}">
           <pre id="pre"><img src="images/imgs/5.jpg"/><s:property value="title"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre> 
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="read5"></s:radio>         
      </s:if>
     
    </s:iterator>
 </s:iterator>
 <br></br>Passage Two
 <s:iterator value="titlesofreadings" begin="3" end="3" step="1"> 
    <pre id="pre"><s:property value="title"/></pre>
    <s:iterator value="optionsofreadings" begin="15" end="19" step="1">
       <s:if test="%{id==(#session.testid-1)*20+16}">
           <pre id="pre"><img src="images/imgs/1.jpg"/><s:property value="title"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>   
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="read6"></s:radio>       
      </s:if>
      <s:if test="%{id==(#session.testid-1)*20+17}">
           <pre id="pre"><img src="images/imgs/2.jpg"/><s:property value="title"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>    
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="read7"></s:radio>      
      </s:if>
      <s:if test="%{id==(#session.testid-1)*20+18}">
           <pre id="pre"><img src="images/imgs/3.jpg"/><s:property value="title"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre> 
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="read8"></s:radio>         
      </s:if>
      <s:if test="%{id==(#session.testid-1)*20+19}">
           <pre id="pre"><img src="images/imgs/4.jpg"/><s:property value="title"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre> 
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="read9"></s:radio>          
      </s:if>
      <s:if test="%{id==(#session.testid-1)*20+20}">
           <pre id="pre"><img src="images/imgs/5.jpg"/><s:property value="title"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>    
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="read10"></s:radio>      
      </s:if>
     
    </s:iterator>
 </s:iterator>
<!-- 阅读部分end -->
<!-- 完形填空begin -->
 <br></br><b>Part Ⅴ Cloze </b>(共20题,共177.5分)  <br/>
    <b>Directions:</b>There are 20 blanks in the following passage. For each blank there are four choices marked A), B), C) and D). You should choose the ONE that best fits into the passage. Then mark the corresponding letter on Answer Sheet 2 with a single line through the centre.  

    <s:iterator value="titlesofreadings" begin="4" end="4" step="1"> 
       <pre id="pre"><s:property value="title"/></pre>
       <s:iterator value="optionoflistenings" begin="25" end="44" step="1">
           <s:if test="%{id==(#session.testid-1)*45+26}">
           <pre id="pre"><img src="images/imgs/1.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>     
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="wanxing1"></s:radio>     
      </s:if>
      <s:if test="%{id==(#session.testid-1)*45+27}">
           <pre id="pre"><img src="images/imgs/2.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>    
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="wanxing2"></s:radio>    
      </s:if>
      <s:if test="%{id==(#session.testid-1)*45+28}">
           <pre id="pre"><img src="images/imgs/3.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>      
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="wanxing3"></s:radio>       
      </s:if>
      <s:if test="%{id==(#session.testid-1)*45+29}">
           <pre id="pre"><img src="images/imgs/4.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>  
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="wanxing4"></s:radio>         
      </s:if>
      <s:if test="%{id==(#session.testid-1)*45+30}">
           <pre id="pre"><img src="images/imgs/5.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>  
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="wanxing5"></s:radio>         
      </s:if>
      <s:if test="%{id==(#session.testid-1)*45+31}">
           <pre id="pre"><img src="images/imgs/6.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>    
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="wanxing6"></s:radio>       
      </s:if>
      <s:if test="%{id==(#session.testid-1)*45+32}">
           <pre id="pre"><img src="images/imgs/7.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>      
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="wanxing7"></s:radio>      
      </s:if>
      <s:if test="%{id==(#session.testid-1)*45+33}">
           <pre id="pre"><img src="images/imgs/8.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>    
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="wanxing8"></s:radio>        
      </s:if>
      <s:if test="%{id==(#session.testid-1)*45+34}">
           <pre id="pre"><img src="images/imgs/9.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre> 
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="wanxing9"></s:radio>           
      </s:if>
      <s:if test="%{id==(#session.testid-1)*45+35}">
           <pre id="pre"><img src="images/imgs/10.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>   
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="wanxing10"></s:radio>       
      </s:if>
      <s:if test="%{id==(#session.testid-1)*45+36}">
           <pre id="pre"><img src="images/imgs/11.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>    
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="wanxing11"></s:radio>         
      </s:if>
      <s:if test="%{id==(#session.testid-1)*45+37}">
           <pre id="pre"><img src="images/imgs/12.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>     
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="wanxing12"></s:radio>       
      </s:if>
      <s:if test="%{id==(#session.testid-1)*45+38}">
           <pre id="pre"><img src="images/imgs/13.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>  
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="wanxing13"></s:radio>          
      </s:if>
      <s:if test="%{id==(#session.testid-1)*45+39}">
           <pre id="pre"><img src="images/imgs/14.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>   
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="wanxing14"></s:radio>         
      </s:if>
      <s:if test="%{id==(#session.testid-1)*45+40}">
           <pre id="pre"><img src="images/imgs/15.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre> 
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="wanxing15"></s:radio>           
      </s:if>
      <s:if test="%{id==(#session.testid-1)*45+41}">
           <pre id="pre"><img src="images/imgs/16.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>  
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="wanxing16"></s:radio>         
      </s:if>
      <s:if test="%{id==(#session.testid-1)*45+42}">
           <pre id="pre"><img src="images/imgs/17.jpg"></img>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>    
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="wanxing17"></s:radio>        
      </s:if>
           <s:if test="%{id==(#session.testid-1)*45+43}">
           <pre id="pre"><img src="images/imgs/18.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>    
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="wanxing18"></s:radio>        
      </s:if>
      <s:if test="%{id==(#session.testid-1)*45+44}">
           <pre id="pre"><img src="images/imgs/19.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>    
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="wanxing19"></s:radio>        
      </s:if>
      <s:if test="%{id==(#session.testid-1)*45+45}">
           <pre id="pre"><img src="images/imgs/20.jpg"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>  
选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="wanxing20"></s:radio>          
      </s:if>
       </s:iterator>
    </s:iterator>

<!-- 完形填空end -->

<!-- 翻译 begin-->
<br/> <b>Part Ⅵ Translation</b><br/>
     <b>Directions:</b>Complete the sentences by translating into English the Chinese given in brackets. Please write you translation on Answer Sheet 2.
  <s:iterator value="translates" begin="0"  end="4" step="1">
      <s:if test="%{id==(#session.testid-1)*5+1}">
         <pre id="pre"><img src="images/imgs/1.jpg"/><s:property value="title"/></pre>
         填写答案：<s:textfield name="trans1" id="testfield"></s:textfield>
      </s:if>
      <s:if test="%{id==(#session.testid-1)*5+2}">
          <pre id="pre"><img src="images/imgs/2.jpg"/><s:property value="title"/></pre>
         填写答案：<s:textfield name="trans2" id="testfield"></s:textfield><br/>
      </s:if>
      <s:if test="%{id==(#session.testid-1)*5+3}">
          <pre id="pre"><img src="images/imgs/3.jpg"/><s:property value="title"/></pre>
         填写答案：<s:textfield name="trans3" id="testfield"></s:textfield><br/>
      </s:if>
      <s:if test="%{id==(#session.testid-1)*5+4}">
          <pre id="pre"><img src="images/imgs/4.jpg"/><s:property value="title"/></pre>
         填写答案：<s:textfield name="trans4" id="testfield"></s:textfield><br/>
      </s:if>
      <s:if test="%{id==(#session.testid-1)*5+5}">
          <pre id="pre"><img src="images/imgs/5.jpg"/><s:property value="title"/></pre>
         填写答案：<s:textfield name="trans5" id="testfield" ></s:textfield><br/>
      </s:if>
  </s:iterator>
    <s:hidden name="candidateNo"></s:hidden>
  <s:submit type="image" src="images/jiaojuan.jpg" id="sub"></s:submit>
 
  </s:form>
  </s:div>
 </font>
 <div style="position:absolute; left: 220px; top:158px;"><img src="images/imgs/x61.jpg"></img></div>
 <div style="position:absolute; left: 220px; top:163px;"><img src="images/imgs/x2.jpg"></img></div>
 <div style="position:absolute; left: 213px; top:646px;"><img src="images/imgs/x3.jpg"></img></div>
 <div style="position:absolute; left: 213px; top:2030px;"><img src="images/imgs/x3.jpg"></img></div>
 <div style="position:absolute; left: 213px; top:3414px;"><img src="images/imgs/x3.jpg"></img></div>
 <div style="position:absolute; left: 213px; top:4798px;"><img src="images/imgs/x3.jpg"></img></div>
 <div style="position:absolute; left: 213px; top:6282px;"><img src="images/imgs/x3.jpg"></img></div>
 <div style="position:absolute; left: 213px; top:7766px;"><img src="images/imgs/x3.jpg"></img></div>
 <div style="position:absolute; left: 213px; top:9250px;"><img src="images/imgs/x3.jpg"></img></div>
  <div style="position:absolute; left: 213px; top:10734px;"><img src="images/imgs/x3.jpg"></img></div>
 <div style="position:absolute; left: 213px; top:11450px;"><img src="images/imgs/x3.jpg"></img></div>
  <div style="position:absolute; left: 221px; top:13406px;"><img src="images/imgs/x21.jpg"></img></div>
 

 <div style="position:absolute; right: 225px; top:163px;"><img src="images/imgs/x2.jpg"></img></div>
 <div style="position:absolute; right: 213px; top:646px;"><img src="images/imgs/x3.jpg"></img></div>
 <div style="position:absolute; right: 213px; top:2030px;"><img src="images/imgs/x3.jpg"></img></div>
 <div style="position:absolute; right: 213px; top:2030px;"><img src="images/imgs/x3.jpg"></img></div>
 <div style="position:absolute; right: 213px; top:3414px;"><img src="images/imgs/x3.jpg"></img></div>
 <div style="position:absolute; right: 213px; top:4798px;"><img src="images/imgs/x3.jpg"></img></div>
 <div style="position:absolute; right: 213px; top:6282px;"><img src="images/imgs/x3.jpg"></img></div>
 <div style="position:absolute; right: 213px; top:7766px;"><img src="images/imgs/x3.jpg"></img></div>
 <div style="position:absolute; right: 213px; top:9250px;"><img src="images/imgs/x3.jpg"></img></div>
 <div style="position:absolute; right: 213px; top:10734px;"><img src="images/imgs/x3.jpg"></img></div>
 <div style="position:absolute; right: 213px; top:11450px;"><img src="images/imgs/x3.jpg"></img></div>
  <div style="position:absolute; right: 225px; top:13410px;"><img src="images/imgs/x21.jpg"></img></div>
  

 <div style="position:absolute; left: 228px; top:13630px;"><img src="images/imgs/x62.jpg"></img></div>
 
 
 <!-- 头顶部分 -->
  <div class="nav">
 
    <ul>
    <li>
     <img src="images/ping21.jpg"></img>
      </li>
      </ul>
 </div>
<!-- 翻译 end-->
  </body>
</html>
         