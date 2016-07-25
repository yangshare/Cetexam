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

		<title>添加一堂考试</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

	</head>

	<body>
		<center>
			${message}
			<h2>
				定义考试
			</h2>
			<br />
			<form action="Exam_insert" method="post">
				考试名称：
				<input name="examname" type="text" value="" />
				<br />
				<br />
				时 间 ：
				<input name="time" type="text" value="" />
				<br />
				<br />
				起始考号：
				<input name="beginno" type="text" value="" />
				<br />
				<br />
				末尾考号：
				<input name="endno" type="text" value="" />
				<br />
				<br />
				监考老师：
				<input name="teacher" type="text" value="" />
				<br />
				<br />
				地 点：
				<input name="position" type="text" value="" />
				<br />
				<br />
				试卷难度：
				<input name="difficulty" type="text" value="" />
				<br />
				<br />
				<input type="submit" value="提交" />
				<br />
				<br />
			</form>
		</center>
	</body>
</html>
