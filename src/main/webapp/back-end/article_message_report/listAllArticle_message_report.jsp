<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.article_message_report.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
Article_message_report_Service article_message_report_Svc = new Article_message_report_Service();
List<Article_message_report_VO> list = article_message_report_Svc.getAll();
pageContext.setAttribute("list", list);
%>


<html>
<head>
<title>�Ҧ��d�����|��� - listAllArticle_message_report.jsp</title>

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
				<h3>�Ҧ��d�����|��� - listAllArticle_message_report.jsp</h3>
				<h4>
					<a href="select_page.jsp"><img src="images/back1.gif"
						width="100" height="32" border="0">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>���|�d���s��</th>
			<th>�|���s��</th>
			<th>�d���s��</th>
			<th>���|�ɶ�</th>
			<th>���|�d�����e</th>
			<th>�޲z���s��</th>
			<th>�B�z�����ɶ�</th>
			<th>�B�z���p</th>
			<th>�B�z���G</th>
			<th>�B�z���O</th>
		</tr>
		<%@ include file="page1.file"%>
		<c:forEach var="article_message_report_VO" items="${list}"
			begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">

			<tr>
				<td>${article_message_report_VO.art_msg_rpt}</td>
				<td>${article_message_report_VO.mem_no}</td>
				<td>${article_message_report_VO.art_msg_no}</td>
				<td>${article_message_report_VO.rpt_time}</td>
				<td>${article_message_report_VO.rpt_msg_content}</td>
				<td>${article_message_report_VO.mng_no}</td>
				<td>${article_message_report_VO.msg_done_time}</td>
				<td>${article_message_report_VO.msg_states}</td>
				<td>${article_message_report_VO.msg_states}</td>
				<td>${article_message_report_VO.msg_note}</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/emp/emp.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="�ק�"> <input type="hidden"
							name="art_msg_rpt"
							value="${article_message_report_VO.art_msg_rpt}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/emp/emp.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="�R��"> <input type="hidden"
							name="art_msg_rpt"
							value="${article_message_report_VO.art_msg_rpt}"> <input
							type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="page2.file"%>

</body>
</html>