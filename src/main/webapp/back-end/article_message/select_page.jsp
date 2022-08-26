<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>IBM Article_message: Home</title>

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
   <tr><td><h3>IBM Article_message: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Article_message: Home</p>

<h3>��Ƭd��:</h3>

<%-- ���~��C --%>
<%-- <c:if test="${not empty errorMsgs}"> --%>
<!-- 	<font style="color:red">�Эץ��H�U���~:</font> -->
<!-- 	<ul> -->
<%-- 		<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 			<li style="color:red">${message.value}</li> --%>
<%-- 		</c:forEach> --%>
<!-- 	</ul> -->
<%-- </c:if> --%>

<ul>
  <li><a href='listAllArticle_message.jsp'>List</a> all Article_messages.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="article_message.do" >
        <b>��J�d���s�� (�p7001):</b>
        <input type="text" name="art_msg_no" value="${param.art_msg_no}"><font color=red>${errorMsgs.art_msg_no}</font>
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="article_message_Svc" scope="page" class="com.article_message.model.Article_message_Service" />
   
  <li>
     <FORM METHOD="post" ACTION="article_message.do" >
       <b>��ܯd���s��:</b>
       <select size="1" name="art_msg_no">
         <c:forEach var="article_message_VO" items="${article_message_Svc.all}" > 
          <option value="${article_message_VO.art_msg_no}">${article_message_VO.art_msg_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="article_message.do" >
       <b>��ܤ峹�s��:</b>
       <select size="1" name="art_msg_no">
         <c:forEach var="article_message_VO" items="${article_message_Svc.all}" > 
          <option value="${article_message_VO.art_msg_no}">${article_message_VO.frm_art_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
</ul>


<h3>���u�޲z</h3>

<ul>
  <li><a href='addArticle_message.jsp'>Add</a> a new Article_message.</li>
</ul>

</body>
</html>