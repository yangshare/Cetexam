<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
    #sub{
    position:absolute;
    top:3900px;
    left:250px;
    border:0px;
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
 var maxtime = 30*45//半个小时，按秒计算，自己调整!  
 function CountDown(){  
 if(maxtime>=0){  
 minutes = Math.floor(maxtime/30);  
 seconds = Math.floor(maxtime%30);  
 msg = "该部分还有"+minutes+"分"+seconds+"秒结束";  
 document.all["timer"].innerHTML=msg;  
 if(maxtime == 5*30) alert('注意，还有5分钟!');  
 --maxtime;  
 }  
 else{  
 clearInterval(timer);  
 alert("该部分时间结束，将进入下部分试题 !");  
 location.href="Cet4System/cet4/test_getpartII.action";
 
 }  
 }  
 timer = setInterval("CountDown()",1000);   
 </script> 
<style type="text/css">
#composition{
position: absolute;
top:100px;
left:100px;
}
#partI{
position:absolute;
top:20px;
left:280px;
width: 780px;
}
#pre{
width:780px;word-break: break-all; word-wrap:break-word;
}
#kreadtitle{
left:200px;
width: 700px;
}
#kread{border: 1px solid #999999;}
</style>
</head>
  <body>
  
  <!-- 头 -->
 
  <div style=" position: absolute;left:300px;top:180px;"><font size="4" color="red"><b>考试说明</b></font></div>
  <div style="background-color:#FFCCFF; position: absolute;left:300px;top:210px;height:450"><table  ><tr >
  <td>考试总分：710.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  及格分数线：425.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  总答题时间：125分钟</td></tr>
  <tr ><td>本考试作文和翻译为教师评分，不计入成绩，该部分试题满分568分</td></tr>
  </table></div>

  
  <s:div id="partI">
 <s:form action="/cet4/test_getpartII.action" method="post" >
 
<br/><br/><br/><br/><br/><br/><center><font size="4"><b><s:iterator value="testnames" begin="0" end="0" step="1">
    <s:if test="%{id==#session.testid}">
        <s:property value="title"/>
    </s:if>
 </s:iterator></b></font> </center>
<br/><br/><br/><br/><br/><br/><br/>
  <!-- 作文部分begin -->
<font size="4"><b>Part Ⅰ Writing</b>(共1题,共106.5分)<br/>
  &nbsp;&nbsp;<img src="images/imgs/1.jpg"></img><b>Directions:</b> For this part, you are allowed 30 minutes to write a short essay on the topic of On<br/> Excessive Packaging, following the outline below. You should write at least 120 words but no more </br>than 180 words.</font>
   <s:iterator value="compositions" begin="0" end="0" step="1">
   <pre> <font size="4"><s:property value="title"/></font>
      </pre>
     <b>填写答案</b><br/>
      <table>
        <tr>
        <td>
        <s:textarea cols="93" rows="6" name="composition"></s:textarea>  
        </td>
        </tr>  
       </table>  
   </s:iterator>
  <br/>
  <!-- 作文部分end -->
  <!-- 快速阅读部分begin -->
<font size="4"><b>  Part Ⅱ Reading Comprehension</b> (Skimming and Scanning)(共10题,共71分)<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;<b>Directions:</b> In this part, you will have 15 minutes to go over the passage quickly and answer the questions on Answer Sheet 1. For questions 1-7, choose the best answer from the four choices marked A), B), C) and D). For questions 8-10, complete the sentences with the information given in the passage.
   <s:iterator value="titlesofreadings" begin="0" end="2" step="1">
     <s:if test="%{id==(#session.testid-1)*6+1}">
    <pre id="pre"><s:property value="title"/></pre>
 <s:iterator value="optionsofreadings" begin="0" end="9" step="1">
           <s:if test="%{(#session.testid-1)*20+1==id}">
         <pre id="pre"><img src="images/imgs/2.jpg"/><s:property value="title"></s:property>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre> 
    选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="kread1" ></s:radio>  
      </s:if>
           <s:if test="%{id==(#session.testid-1)*20+2}">
           <pre id="pre"><img src="images/imgs/3.jpg"></img><s:property value="title"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>  
    选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="kread2" ></s:radio>         
      </s:if>
          <s:if test="%{id==(#session.testid-1)*20+3}">
           <pre id="pre"><img src="images/imgs/4.jpg"></img><s:property value="title"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>   
    选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="kread3" ></s:radio>        
      </s:if>
          <s:if test="%{id==(#session.testid-1)*20+4}">
           <pre id="pre"><img src="images/imgs/5.jpg"></img><s:property value="title"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>   
    选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="kread4" ></s:radio>        
      </s:if>
          <s:if test="%{id==(#session.testid-1)*20+5}">
           <pre id="pre"><img src="images/imgs/6.jpg"></img><s:property value="title"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>    
    选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="kread5" ></s:radio>       
      </s:if>
          <s:if test="%{id==(#session.testid-1)*20+6}">
           <pre id="pre"><img src="images/imgs/7.jpg"></img><s:property value="title"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>    
    选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="kread6" ></s:radio>       
      </s:if>
          <s:if test="%{id==(#session.testid-1)*20+7}">
           <pre id="pre"><img src="images/imgs/8.jpg"></img><s:property value="title"/>
<b>[A]</b><s:property value="optionA"/>
<b>[B]</b><s:property value="optionB"/>
<b>[C]</b><s:property value="optionC"/>
<b>[D]</b><s:property value="optionD"/></pre>         
    选择答案：<s:radio list="#{'A':'A','B':'B','C':'C','D':'D'}" name="kread7" ></s:radio>  
      </s:if>
         <s:if test="%{id==(#session.testid-1)*20+8}">
           <pre id="pre"><img src="images/imgs/9.jpg"></img><s:property value="title"/></pre>
           填写答案：<s:textfield name="kread8" id="kread"></s:textfield>
      </s:if>
         <s:if test="%{id==(#session.testid-1)*20+9}">
           <pre id="pre"><img src="images/imgs/10.jpg"></img><s:property value="title"/></pre>
           填写答案：<s:textfield name="kread9" id="kread"></s:textfield>
      </s:if>
         <s:if test="%{id==(#session.testid-1)*20+10}">
           <pre id="pre"><img src="images/imgs/11.jpg"></img><s:property value="title"/></pre>
           填写答案：<s:textfield name="kread10" id="kread"></s:textfield>
      </s:if>
   </s:iterator>
      
      </s:if>
   </s:iterator>
    <s:hidden name="candidateNo"></s:hidden>
    <br />
    <s:submit value="进入下一部分答题" type="image" src="images/next.jpg" id="sub"></s:submit>

  </s:form>
  </s:div>
  </font>
  <div style="position:absolute; left: 220px; top:158px;"><img src="images/imgs/x61.jpg"></img></div>
 <div style="position:absolute; left: 220px; top:163px;"><img src="images/imgs/x2.jpg"></img></div>
 <div style="position:absolute; left: 213px; top:643px;"><img src="images/imgs/x3.jpg"></img></div>
 <div style="position:absolute; left: 213px; top:2030px;"><img src="images/imgs/x3.jpg"></img></div>
 <div style="position:absolute; right: 225px; top:163px;"><img src="images/imgs/x2.jpg"></img></div>
 <div style="position:absolute; right: 213px; top:640px;"><img src="images/imgs/x3.jpg"></img></div>
 <div style="position:absolute; right: 213px; top:2030px;"><img src="images/imgs/x3.jpg"></img></div>
  <div style="position:absolute; left: 230px; top:4011px;width: 843px;"><img src="images/imgs/x63.jpg"></img></div>
 <!-- 头顶部分 -->
  <div class="nav">
  <div id="timer" style="color:black;" style="position:absolute; left: 153px; top:76px;"></div>
    <ul>
    <li>
      <img src="images/ping21.jpg"></img>
      </li>
    </ul>

</div>
 

 <!-- 快速阅读部分end -->
  </body>
</html>
