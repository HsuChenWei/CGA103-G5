<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.act_pic.model.*"%>

<%
Act_pic_VO act_picVO = (Act_pic_VO) request.getAttribute("act_picVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>活動照片新增 - addAct_pic.jsp</title>

<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>活動照片新增 - addAct_pic.jsp</h3>
			</td>
			<td>
				<h4>
					<a href="select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>活動新增:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="act_pic.do" name="form1"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td>活動編號:</td>
				<td><input type="TEXT" name="act_no" size="45"
					value="<%=(act_picVO == null) ? "4" : act_picVO.getAct_no()%>" /></td>
			</tr>
			<tr>
				<td>活動照片:</td>
				<td><input type="file" name="act_pic" size="45" /></td>
			</tr>
			<tr>
				<td>活動照片名稱:</td>
				<td><input type="TEXT" name="act_pic_name" size="45"
					value="<%=(act_picVO == null) ? "" : act_picVO.getAct_pic_name()%>" /></td>
			</tr>
		</table>

		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</FORM>
</body>
</html>