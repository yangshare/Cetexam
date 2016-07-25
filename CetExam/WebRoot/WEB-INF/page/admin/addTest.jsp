<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<base href="<%=basePath%>">

		<title>添加一套试题</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<style type="text/css" media="all">
@import "widgEditor_1.0.1/css/info.css";

@import "widgEditor_1.0.1/css/main.css";

@import "widgEditor_1.0.1/css/widgEditor.css";

b {
	font-size: 24px;
}
</style>

		<script type="text/javascript"
			src="widgEditor_1.0.1/scripts/widgEditor.js"></script>
	</head>



	<body>
		<form action="<%=request.getContextPath()%>/cet4/testAction-addTest"
			method="post" name="addTest" enctype="multipart/form-data">

			<br />
			<h5>
					试卷名称：
					<input name="name"  value="" />
			</h5>


			<br />
			<!--进度信息-->
			<div>
				<br />
				<a href="javascript:void(0)">作文</a>
				<a href="javascript:void(0)">Section A短篇新闻</a>
				<a href="javascript:void(0)">Section B长对话</a>
				<a href="javascript:void(0)">Section C听力篇章</a>
				<a href="javascript:void(0)">Section A选词填空</a>
				<a href="javascript:void(0)">Section B段落匹配</a>
				<a href="javascript:void(0)">Section C仔细阅读</a>
				<a href="javascript:void(0)">汉译英</a>
			</div>
			<br />

			<!-- 试题部分 -->
			<b>Part I Writing(30 minutes)</b>
			<br />
			<!-- 富文本编辑器 widgEditor-->

			<textarea id="noise_Writing" name="writing"
				class="widgEditor nothing">作文要求</textarea>

			<!-- END 富文本编辑器 widgEditor-->

			<br />
			<br />

			<b>Part II Listening Comprehension (30minutes)</b>
			<br />
			<br />
			<!-- 听力材料 -->
			听力材料：
			<br />
			<div class="file-box">
				<input name="material" id="textfield" value="" class="txt" />
				<input type="file" class="file" name="listen"
					onchange="document.getElementById('textfield').value=this.value" />
			</div>
			选项1-25：
			<br />
			<!-- 循环器 -->
			<s:bean name="org.apache.struts2.util.Counter" id="counter">
				<s:param name="first" value="1" />
				<s:param name="last" value="25" />
				<s:iterator>
					<br />
					<br />
			听力选项◇<s:property value="current-1" />:<br />
					<!-- 富文本编辑器 widgEditor-->

					<textarea name="listen<s:property value="current-1"/>"
						class="widgEditor nothing">
			
			1.Directions: In this section
			A
			B
			C
			D

		</textarea>

					<!-- END 富文本编辑器 widgEditor-->
					<br />
		答案:
		<input type="text" name="listenAnswer<s:property value="current-1"/>"
						value="答案">

					<br />
					<br />
				</s:iterator>
			</s:bean>
			<!-- END 循环器 -->


			<b>Part III Reading Comprehension (40 minutes)</b>
			<!-- 词汇理解 -->
			<h4>
				词汇理解
			</h4>
			<br />
			<br />

			<!-- 富文本编辑器 widgEditor-->

			<textarea name="wordunderstand" class="widgEditor nothing">
					词汇理解
		
				</textarea>

			<!-- END 富文本编辑器 widgEditor-->
			<br />
			答案:
			<input type="text" name="wordunderstandAnswer" value="词汇理解答案">

			<br />
			<br />

			<!-- 长阅读 -->
			<h4>
				长阅读
			</h4>
			<!-- 富文本编辑器 widgEditor-->

			<textarea name="longreading" class="widgEditor nothing">
			长阅读

		</textarea>

			<!-- END 富文本编辑器 widgEditor-->
			<br />
			答案:
			<input type="text" name="longreadingAnswer" value="长阅读答案">


			<br />
			<br />

			<!-- 仔细阅读 -->
			<h4>
				仔细阅读
			</h4>
			<textarea name="carereadingA" class="widgEditor nothing">
			
			仔细阅读第一篇

		</textarea>
			<!-- 循环器 -->
			<s:bean name="org.apache.struts2.util.Counter" id="counter">
				<s:param name="first" value="46" />
				<s:param name="last" value="50" />
				<s:iterator>
					<br />
					<br />
			仔细阅读选项◇<s:property value="current-1" />:<br />
					<!-- 富文本编辑器 widgEditor-->

					<textarea name="carereading<s:property value="current-1"/>"
						class="widgEditor nothing">
			
			1.Directions: In this section
			A
			B
			C
			D

		</textarea>

					<!-- END 富文本编辑器 widgEditor-->
					<br />
		答案:
		<input type="text"
						name="carereadingAnswer<s:property value="current-1"/>" value="答案">

					<br />
					<br />
				</s:iterator>
			</s:bean>
			<!-- END 循环器 -->
			<br>

			<textarea name="carereadingB" class="widgEditor nothing">
			
			仔细阅读第二篇

		</textarea>
			<!-- 循环器 -->
			<s:bean name="org.apache.struts2.util.Counter" id="counter">
				<s:param name="first" value="51" />
				<s:param name="last" value="55" />
				<s:iterator>
					<br />
					<br />
			仔细阅读选项◇<s:property value="current-1" />:<br />
					<!-- 富文本编辑器 widgEditor-->

					<textarea name="carereading<s:property value="current-1"/>"
						class="widgEditor nothing">
			
			1.Directions: In this section
			A
			B
			C
			D

		</textarea>

					<!-- END 富文本编辑器 widgEditor-->
					<br />
		答案:
		<input type="text"
						name="carereadingAnswer<s:property value="current-1"/>" value="答案">

					<br />
					<br />
				</s:iterator>
			</s:bean>
			<!-- END 循环器 -->
			<br />
			<br />


			<!-- 翻译 -->
			<b>Part IV Translation (30 minutes)</b>
			<br />
			<br />
			<!-- 富文本编辑器 widgEditor-->

			<textarea name="translate" class="widgEditor nothing">
			
			翻译

		</textarea>

			<!-- END 富文本编辑器 widgEditor-->
			<br />
			<br />

			<input type="submit" value="保存">

			<!-- 试题部分结束 -->


		</form>
	</body>
</html>
