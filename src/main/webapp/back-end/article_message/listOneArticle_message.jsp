<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.article_message.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
	Article_message_VO article_message_VO = (Article_message_VO) request.getAttribute("article_message_VO"); //EmpServlet.java(Concroller), �s�Jreq��empVO����
%>

<html>
<head>
<title>�峹�d����� - listOneArticle_message.jsp</title>

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
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>

</head>
<body bgcolor='white'>

	<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>�峹�d����� - ListOneArticle_message.jsp</h3>
				<h4>
					<a href="select_page.jsp"><img src="images/back1.gif"
						width="100" height="32" border="0">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>�d���s��</th>
			<th>�|���s��</th>
			<th>�峹�s��</th>
			<th>�d���o���ɶ�</th>
			<th>�d�����e</th>
		</tr>
		<tr>
			<td>${article_message_VO.art_msg_no}</td>
			<td>${article_message_VO.mem_no}</td>
			<td>${article_message_VO.frm_art_no}</td>
			<td>${article_message_VO.msg_time}</td>
			<td>${article_message_VO.msg_content}</td>
		</tr>
	</table>

</body>
</html>