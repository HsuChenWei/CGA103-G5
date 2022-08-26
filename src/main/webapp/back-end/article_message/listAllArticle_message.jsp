<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.article_message.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
Article_message_Service article_message_Svc = new Article_message_Service();
List<Article_message_VO> list = article_message_Svc.getAll();
pageContext.setAttribute("list", list);
%>


<html>
<head>
<title>�Ҧ��峹�d����� - listAllArticle_message.jsp</title>

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
	width: 800px;
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

	<h4>�����m�߱ĥ� EL ���g�k����:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>�Ҧ��峹�d����� - listAllArticle_message.jsp</h3>
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
		<%@ include file="page1.file"%>
		<c:forEach var="Article_message_VO" items="${list}"
			begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">

			<tr>
				<td>${article_message_VO.art_msg_no}</td>
				<td>${article_message_VO.mem_no}</td>
				<td>${article_message_VO.frm_art_no}</td>
				<td>${article_message_VO.msg_time}</td>
				<td>${article_message_VO.msg_content}</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/article_message/article_message.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="�ק�"> <input type="hidden"
							name="art_msg_no" value="${Article_message_VO.art_msg_no}">
						<input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/article_message/article_message.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="�R��"> <input type="hidden"
							name="empno" value="${article_message_VO.art_msg_no}"> <input
							type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="page2.file"%>

</body>
</html>