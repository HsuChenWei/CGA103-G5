<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.manager.model.*"%>

<%
  Manager_VO manager_VO = (Manager_VO) request.getAttribute("manager_VO"); //Manager_Servlet.java (Concroller) �s�Jreq��manager_VO���� (�]�A�������X��manager_VO, �]�]�A��J��ƿ��~�ɪ�manager_VO����)
%>
--%= manager_VO==null %--${manager_VO.mng_pic}--
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�޲z����ƭק� - update_manager_input.jsp</title>

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
	<tr><td>
		 <h3>�޲z����ƭק� - update_manager_input.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��ƭק�:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="manager.do" name="form1">
<table>
	<tr>
		<td>�޲z���s��:<font color=red><b>*</b></font></td>
		<td><%=manager_VO.getMng_no()%></td>
	</tr>
	<tr>
		<td>�޲z���b��:</td>
		<td><input type="TEXT" name="ename" size="45" value="<%=manager_VO.getMng_account()%>" /></td>
	</tr>
	<tr>
		<td>�޲z���K�X:</td>
		<td><input type="TEXT" name="job" size="45"	value="<%=manager_VO.getMng_password()%>" /></td>
	</tr>
	<tr>
		<td>�޲z���m�W:</td>
		<td><input type="TEXT" name="job" size="45"	value="<%=manager_VO.getMng_name()%>" /></td>
	</tr>
	<tr>
		<td>�޲z�����:</td>
		<td><input type="TEXT" name="job" size="45"	value="<%=manager_VO.getMng_phone()%>" /></td>
	</tr>
	<tr>
		<td>�޲z���Ϥ�:</td>
		<td colspan="3"><input class="btn btn-default"type="file" name="mng_pic"> <br> 
		<img class="img-rounded" width=100%	
			src="${manager_VO.mng_pic}"></td>
	</tr>
    <tr>
		<td>�޲z�����A:</td>
		<td><input type="checkbox" name="mng_status" value=1> </td>
		<td><input type="hidden" name="mng_status" value=0> </td>
	</tr>
	
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="mng_no" value="<%=manager_VO.getMng_no()%>">
<input type="submit" value="�e�X�ק�"></FORM>
</body>

</html>