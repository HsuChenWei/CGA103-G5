<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.mem.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
  Mem_VO memVO = (Mem_VO) request.getAttribute("memVO"); //MemServlet.java(Concroller), �s�Jreq��empVO����
%>

<html>
<head>
<title>�|����� - listOneMem.jsp</title>

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
	<tr><td>
		 <h3>�|����� - ListOneMem.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�|���s��</th>
		<th>�|���b��</th>
		<th>�|���K�X</th>
		<th>�|���ʧO</th>
		<th>�|���m��</th>
		<th>�|���W�r</th>
		<th>�|���ʺ�</th>
		<th>�|���s���q��</th>
		<th>�|��������X</th>
		<th>�|���q�l�l��</th>
		<th>�|�������Ҧr��</th>
		<th>�|���ͤ�</th>
		<th>�|���a�}</th>
		<th>�|���v��</th>
		<th>�|�����A</th>
		<th>�|���Ыؤ��</th>
		<th>�{�Ҫ��A</th>
	</tr>
	<tr>
		<td><%=memVO.getMem_no()%></td>
		<td><%=memVO.getMem_account()%></td>
		<td><%=memVO.getMem_password()%></td>
		<td><%=memVO.getMem_gender()%></td>
		<td><%=memVO.getMem_last_name()%></td>
		<td><%=memVO.getMem_first_name()%></td>
		<td><%=memVO.getMem_nickname()%></td>
		<td><%=memVO.getMem_tel_no()%></td>
		<td><%=memVO.getMem_cel_no()%></td>
		<td><%=memVO.getMem_email()%></td>
		<td><%=memVO.getMem_id()%></td>
		<td><%=memVO.getMem_birth()%></td>
		<td><%=memVO.getMem_addr()%></td>
		<td><%=memVO.getMem_permission()%></td>
		<td><%=memVO.getStatus()%></td>
		<td><%=memVO.getMem_build_time()%></td>
		<td><%=memVO.getMem_cert_status()%></td>
	</tr>
</table>

</body>
</html>