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

		<title>修改试题</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
table {
	background-color: #e2ecf2;
}

button {
	width: 70px;
	height: 30px;
}

font {
	text-decoration: none;
}

tr:HOVER {
	background-color: #dcccd8;
}

input {
	width: 700px;
}

textarea {
	width: 700px;
	height: 300px;
}

#textarea {
	width: 700px;
	height: 150px;
}

#select {
	width: 100px;
}

.file-box {
	position: relative;
	width: 340px
}

.txt {
	height: 22px;
	border: 1px solid #cdcdcd;
	width: 180px;
}

.btn {
	background-color: #FFF;
	border: 1px solid #CDCDCD;
	height: 24px;
	width: 70px;
}

.file {
	position: absolute;
	top: 0;
	right: 80px;
	height: 24px;
	filter: alpha(opacity :   0);
	opacity: 0;
	width: 260px
}
</style>
	</head>



	<body bgcolor="#f7f8f7" style="border: 2px solid #ccccff;">
		<center>
			<br />
			<font size="5" face="华文行楷"> 
				<a href="javascript:void(0)" 
				onclick="document.getElementById('testname').scrollIntoView();">标题</a>&nbsp;&nbsp;
				<a href="javascript:void(0)"
				onclick="document.getElementById('composition').scrollIntoView();">作文</a>&nbsp;&nbsp;
				<a href="javascript:void(0)"
				onclick="document.getElementById('fastreading').scrollIntoView();">快速阅读</a>&nbsp;&nbsp;
				<a href="javascript:void(0)"
				onclick="document.getElementById('listening').scrollIntoView();">听力</a>&nbsp;&nbsp;
				<a href="javascript:void(0)"
				onclick="document.getElementById('compoundchoosewords').scrollIntoView();">选词填空</a>&nbsp;&nbsp;
				<a href="javascript:void(0)"
				onclick="document.getElementById('reading').scrollIntoView();">阅读</a>&nbsp;&nbsp;
				<a href="javascript:void(0)"
				onclick="document.getElementById('close').scrollIntoView();">完型填空</a>&nbsp;&nbsp;
				<a href="javascript:void(0)"
				onclick="document.getElementById('translate').scrollIntoView();">翻译</a>
			</font>
		</center>
		<br />
		<hr />
		<h3>
			<a  id="testname"></a>标题
		</h3>
		<s:iterator value="testnames" begin="0" end="0">
			<s:form action="updateTest-updateTestName" namespace="/cet4"
				method="post">
				<table width="100%" cellspacing="0" height="80px">
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="hidden" name="id" value="${id }" />
						</td>
						<td>
							<input name="title" value="${title }" />
						</td>
						<td>
							<button>
								修 改
							</button>
						</td>
					</tr>
				</table>
			</s:form>
		</s:iterator>
		<hr />
		<h3>
			<a id="composition"></a>作文
		</h3>
		<s:iterator value="compositions" begin="0" end="0">
			<s:form action="updateTest-updateComposition" namespace="/cet4" method="post">
				<table width="100%" cellspacing="0" height="200px">
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="hidden" name="id" value="${id }" />
						</td>
						<td>
							<textarea name="title" id="textarea">${title }</textarea>
						</td>
						<td valign="bottom">
							<button>
								修 改
							</button>
						</td>
					</tr>
				</table>
			</s:form>
		</s:iterator>
		<hr />
		<h3>
			<a id="fastreading"></a>快速阅读
		</h3>
		<s:iterator value="titlesofreadings" begin="0" end="0">
			<s:form action="updateTest-updateTitlesofreading" namespace="/cet4" method="post">
				<table width="100%" cellspacing="0" height="350px">
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="hidden" name="id" value="${id }" />
						</td>
						<td>
							<textarea name="title">${title }</textarea>
						</td>
						<td valign="bottom">
							<button>
								修 改
							</button>
						</td>
					</tr>
				</table>
			</s:form>
		</s:iterator>
		<s:iterator value="optionsofreadings" begin="0" end="9">
			<s:form action="updateTest-updateOptionsofreading" namespace="/cet4"
				method="post">
				<table width="100%" cellspacing="0">
					<tr height="50px">
						<td>
							${id }.
							<input type="hidden" name="id" value="${id }" />
						</td>
						<td colspan="2">
							<input name="title" value="${title }" />
						</td>
					</tr>
					<c:if test="${optionA!=null }">
						<tr height="50px">
							<td>
								&nbsp;&nbsp;A.
							</td>
							<td colspan="2">
								<input name="optionA" value="${optionA }" />
							</td>
						</tr>
						<tr height="50px">
							<td>
								&nbsp;&nbsp;B.
							</td>
							<td colspan="2">
								<input name="optionB" value="${optionB }" />
							</td>
						</tr>
						<tr height="50px">
							<td>
								&nbsp;&nbsp;C.
							</td>
							<td colspan="2">
								<input name="optionC" value="${optionC }" />
							</td>
						</tr>
						<tr height="50px">
							<td>
								&nbsp;&nbsp;D.
							</td>
							<td colspan="2">
								<input name="optionD" value="${optionD }" />
							</td>
						</tr>
						<tr height="50px">
							<td></td>
							<td>
								<s:select name="answer" list="{'A','B','C','D'}" id="select" />
							</td>
							<td align="right">
								<button>
									修改
								</button>
							</td>
						</tr>
					</c:if>
					<c:if test="${optionA==null }">
						<tr height="50px">
							<td>
								&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
							<td>
								<input name="answer" value="${answer }" />
							</td>
							<td align="right">
								<button>
									修改
								</button>
							</td>
						</tr>
					</c:if>
				</table>
			</s:form>
		</s:iterator>
		<hr />
		<h3>
			<a id="listening"></a>听力
		</h3>
		<s:iterator value="listeningmaterials" begin="0" end="0">
			<s:form action="updateTest-updateLsteningmaterial" namespace="/cet4"
				method="post" enctype="multipart/form-data">
				<table width="100%" cellspacing="0" height="60px">
					<tr>
						<td>
							听力材料：
							<input type="hidden" name="id" value="${id }" />
						</td>
						<td>
							<div class="file-box">
								<input name="material" id="textfield" value="${material }"
									class="txt" />
								<input type="file" class="file" name="listen"
									onchange="document.getElementById('textfield').value=this.value" />
								<input type="button" value="浏览..." class="btn" />
							</div>
						</td>
						<td>
							<button>
								修改
							</button>
						</td>
					</tr>
				</table>
			</s:form>
		</s:iterator>
		<s:iterator value="optionoflistenings" begin="0" end="24">
			<s:form action="updateTest-updateOptionoflistening" namespace="/cet4"
				method="post">
				<table width="100%" cellspacing="0" height="240px">
					<tr>
						<td>
							${id+10}.A.
							<input type="hidden" name="id" value="${id }" />
						</td>
						<td colspan="2">
							<input name="optionA" value="${optionA }" />
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;B.
						</td>
						<td colspan="2">
							<input name="optionB" value="${optionB }" />
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;C.
						</td>
						<td colspan="2">
							<input name="optionC" value="${optionC }" />
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;D.
						</td>
						<td colspan="2">
							<input name="optionD" value="${optionD }" />
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<s:select name="answer" list="{'A','B','C','D'}" id="select" />
						</td>
						<td align="right">
							<button>
								修改
							</button>
						</td>
					</tr>
				</table>
			</s:form>
		</s:iterator>
		<s:iterator value="titlesofreadings" begin="5" end="5">
			<s:form action="updateTest-updateTitlesofreading" namespace="/cet4" method="post">
				<table width="100%" cellspacing="0" height="350px">
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="hidden" name="id" value="${id }" />
						</td>
						<td>
							<textarea name="title">${title }</textarea>
						</td>
						<td valign="bottom">
							<button>
								修改
							</button>
						</td>
					</tr>
				</table>
			</s:form>
		</s:iterator>
		<s:iterator value="compoundchoosewords" begin="0" end="10">
			<s:form action="updateTest-updateCompoundchoosewords" namespace="/cet4"
				method="post">
				<table width="100%" cellspacing="0">
					<tr height="50px">
						<td>
							${id+35 }.&nbsp;&nbsp;
							<input type="hidden" name="id" value="${id }" />
						</td>
						<td>
							<input name="answer" value="${answer }" />
						</td>
						<td>
							<button>
								修改
							</button>
						</td>
					</tr>
				</table>
			</s:form>
		</s:iterator>
		<hr />
		<h3>
			<a id="compoundchoosewords"></a>选词填空
		</h3>
		<s:iterator value="titlesofreadings" begin="1" end="1">
			<s:form action="updateTest-updateTitlesofreading" namespace="/cet4" method="post">
				<table width="100%" height="350px" cellspacing="0">
					<tr height="50px">
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="hidden" name="id" value="${id }" />
						</td>
						<td>
							<textarea name="title">${title }</textarea>
						</td>
						<td valign="bottom">
							<button>
								修改
							</button>
						</td>
					</tr>
				</table>
			</s:form>
		</s:iterator>
		<s:iterator value="compoundchoosewords" begin="11" end="20">
			<s:form action="updateTest-updateCompoundchoosewords" namespace="/cet4"
				method="post">
				<table width="100%" cellspacing="0">
					<tr height="50px">
						<td width="40px">
							${id+35 }.
							<input type="hidden" name="id" value="${id }" />
						</td>
						<td>
							<s:select name="answer"
								list="{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O'}"
								id="select" />
						</td>
						<td align="right">
							<button>
								修改
							</button>
						</td>
					</tr>
				</table>
			</s:form>
		</s:iterator>
		<hr />
		<h3>
			<a id="reading"></a>阅读
		</h3>
		<s:iterator value="titlesofreadings" begin="2" end="2">
			<s:form action="updateTest-updateTitlesofreading" namespace="/cet4" method="post">
				<table width="100%" cellspacing="0" height="350px">
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="hidden" name="id" value="${id }" />
						</td>
						<td>
							<textarea name="title">${title }</textarea>
						</td>
						<td valign="bottom">
							<button>
								修改
							</button>
						</td>
					</tr>
				</table>
			</s:form>
		</s:iterator>
		<s:iterator value="optionsofreadings" begin="10" end="14">
			<s:form action="updateTest-updateOptionsofreading" namespace="/cet4"
				method="post">
				<table width="100%" height="300px" cellspacing="0">
					<tr>
						<td>
							${id+46 }.
							<input type="hidden" name="id" value="${id }" />
						</td>
						<td colspan="2">
							<input name="title" value="${title }" />
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;A.
						</td>
						<td colspan="2">
							<input name="optionA" value="${optionA }" />
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;B.
						</td>
						<td colspan="2">
							<input name="optionB" value="${optionB }" />
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;C.
						</td>
						<td colspan="2">
							<input name="optionC" value="${optionC }" />
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;D.
						</td>
						<td colspan="2">
							<input name="optionD" value="${optionD }" />
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<s:select name="answer" list="{'A','B','C','D'}" id="select" />
						</td>
						<td align="right">
							<button>
								修改
							</button>
						</td>
					</tr>
				</table>
			</s:form>
		</s:iterator>
		<s:iterator value="titlesofreadings" begin="3" end="3">
			<s:form action="updateTest-updateTitlesofreading" namespace="/cet4" method="post">
				<table width="100%" height="350px" cellspacing="0">
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="hidden" name="id" value="${id }" />
						</td>
						<td>
							<textarea name="title">${title }</textarea>
						</td>
						<td valign="bottom">
							<button>
								修改
							</button>
						</td>
					</tr>
				</table>
			</s:form>
		</s:iterator>
		<s:iterator value="optionsofreadings" begin="15" end="19">
			<s:form action="updateTest-updateOptionsofreading" namespace="/cet4"
				method="post">
				<table width="100%" height="300px" cellspacing="0">
					<tr>
						<td>
							${id+46 }.
							<input type="hidden" name="id" value="${id }" />
						</td>
						<td colspan="2">
							<input name="title" value="${title }" />
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;A.
						</td>
						<td colspan="2">
							<input name="optionA" value="${optionA }" />
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;B.
						</td>
						<td colspan="2">
							<input name="optionB" value="${optionB }" />
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;C.
						</td>
						<td colspan="2">
							<input name="optionC" value="${optionC }" />
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;D.
						</td>
						<td colspan="2">
							<input name="optionD" value="${optionD }" />
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<s:select name="answer" list="{'A','B','C','D'}" id="select" />
						</td>
						<td align="right">
							<button>
								修改
							</button>
						</td>
					</tr>
				</table>
			</s:form>
		</s:iterator>
		<hr />
		<h3>
			<a id="close"></a>完型填空
		</h3>
		<s:iterator value="titlesofreadings" begin="4" end="4">
			<s:form action="updateTest-updateTitlesofreading" namespace="/cet4" method="post">
				<table width="100%" height="350px" cellspacing="0">
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="hidden" name="id" value="${id }" />
						</td>
						<td>
							<textarea name="title">${title }</textarea>
						</td>
						<td valign="bottom">
							<button>
								修改
							</button>
						</td>
					</tr>
				</table>
			</s:form>
		</s:iterator>
		<s:iterator value="optionoflistenings" begin="25" end="44">
			<s:form action="updateTest-updateOptionoflistening" namespace="/cet4"
				method="post">
				<table width="100%" height="250px" cellspacing="0">
					<tr>
						<td>
							${id+41 }.A.
							<input type="hidden" name="id" value="${id }" />
						</td>
						<td colspan="2">
							<input name="optionA" value="${optionA }" />
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;B.
						</td>
						<td colspan="2">
							<input name="optionB" value="${optionB }" />
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;C.
						</td>
						<td colspan="2">
							<input name="optionC" value="${optionC }" />
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;D.
						</td>
						<td colspan="2">
							<input name="optionD" value="${optionD }" />
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<s:select name="answer" list="{'A','B','C','D'}" id="select" />
						</td>
						<td align="right">
							<button>
								修改
							</button>
						</td>
					</tr>
				</table>
			</s:form>
		</s:iterator>
		<hr />
		<h3>
			<a id="translate"></a>翻译
		</h3>
		<s:iterator value="translates">
			<s:form action="updateTest-updateTranslate" namespace="/cet4" method="post">
				<table width="100%" height="70px" cellspacing="0">
					<tr>
						<td>
							${id+86 }.&nbsp;&nbsp;
							<input type="hidden" name="id" value="${id }" />
						</td>
						<td>
							<input name="title" value="${title }" />
						</td>
						<td>
							<button>
								修改
							</button>
						</td>
					</tr>
				</table>
			</s:form>
		</s:iterator>
	</body>
</html>
