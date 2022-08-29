<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>IBM Manager: Home</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>IBM Manager: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Manager: Home</p>

<h3>��Ƭd��:</h3>
	
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='listAllManager.jsp'>List</a> all Managers.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="manager.do" >
        <b>��J�޲z���s�� (�p1):</b>
        <input type="text" name="mng_no">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="manager_Svc" scope="page" class="com.manager.model.Manager_Service" />
   
  <li>
     <FORM METHOD="post" ACTION="manager.do" >
       <b>��ܺ޲z���s��:</b>
       <select size="1" name="mng_no">
         <c:forEach var="manager_VO" items="${manager_Svc.allManager}" > 
          <option value="${manager_VO.mng_no}">${manager_VO.mng_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="manager.do" >
       <b>��ܺ޲z���m�W:</b>
       <select size="1" name="mng_no">
         <c:forEach var="manager_VO" items="${manager_Svc.allManager}" > 
          <option value="${manager_VO.mng_no}">${manager_VO.mng_name}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
</ul>


<h3>�޲z���޲z</h3>

<ul>
  <li><a href='addManager.jsp'>Add</a> a new Manager.</li>
</ul>

</body>
</html>