<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.manager.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    Manager_Service manager_Svc = new Manager_Service();
    List<Manager_VO> list = manager_Svc.getAllManager();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>�Ҧ��޲z����� - listAllManager.jsp</title>

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
	<tr><td>
		 <h3>�Ҧ��޲z����� - listAllManager.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�޲z���s��</th>
		<th>�޲z���b��</th>
		<th>�޲z���K�X</th>
		<th>�޲z���m�W</th>
		<th>�޲z�����</th>
		<th>�޲z���Ӥ�</th>
		<th>�޲z�����A</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="manager_VO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${manager_VO.mng_no}</td>
			<td>${manager_VO.mng_account}</td>
			<td>${manager_VO.mng_password}</td>
			<td>${manager_VO.mng_name}</td>
			<td>${manager_VO.mng_phone}</td>
			<td><img src="<%=request.getContextPath()%>/ManagerImage?mng_no=${manager_VO.mng_no}" width=150px height=100px></td>
			<td>${manager_VO.mng_status}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/manager/manager.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="mng_no"  value="${manager_VO.mng_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/manager/manager.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="mng_no"  value="${manager_VO.mng_no}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>