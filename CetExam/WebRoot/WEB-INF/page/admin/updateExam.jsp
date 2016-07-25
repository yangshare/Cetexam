<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>修改一堂考试</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

	</head>

	<body>
		<center>
			<h2>
				定义考试
			</h2>
			<br />
			<form action="Exam_update" method="post">
				考试编号：
				<input readonly="readonly" name="id" type="text" value="${exam.id}" />
				<br />
				<br />
				考试名称：
				<input name="examname" type="text" value="${exam.examname}" />
				<br />
				<br />
				时 间 ：
				<input name="time" type="text" value="${exam.time}" />
				<br />
				<br />
				起始考号：
				<input name="beginno" type="text" value="${exam.beginno}" />
				<br />
				<br />
				末尾考号：
				<input name="endno" type="text" value="${exam.endno}" />
				<br />
				<br />
				监考老师：
				<input name="teacher" type="text" value="${exam.teacher}" />
				<br />
				<br />
				地 点：
				<input name="position" type="text" value="${exam.position}" />
				<br />
				<br />
				试卷难度：
				<input name="difficulty" type="text" value="${exam.difficulty}" />
				<br />
				<br />
				<input type="submit" value="提交" />
				<br />
				<br />
			</form>
		</center>
	</body>
</html>
