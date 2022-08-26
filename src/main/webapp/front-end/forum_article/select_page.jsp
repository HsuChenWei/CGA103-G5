<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>IBM Forum_article: Home</title>

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
   <tr><td><h3>IBM Forum_article: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Forum_article: Home</p>

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
  <li><a href='listAllForum_article.jsp'>List</a> all Forum_articles.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="forum_article.do" >
        <b>��J�峹�s�� (�p7001):</b>
        <input type="text" name="frm_art_no" value="${param.frm_art_no}"><font color=red>${errorMsgs.frm_art_no}</font>
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="forum_article_Svc" scope="page" class="com.forum_article.model.Forum_article_Service" />
   
  <li>
     <FORM METHOD="post" ACTION="forum_article.do" >
       <b>��ܤ峹�s��:</b>
       <select size="1" name="frm_art_no">
         <c:forEach var="forum_article_VO" items="${forum_article_Svc.all}" > 
          <option value="${forum_article_VO.frm_art_no}">${forum_article_VO.frm_art_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="forum_article.do" >
       <b>��ܰQ�װϦW��:</b>
       <select size="1" name="frm_art_no">
         <c:forEach var="forum_article_VO" items="${forum_article_Svc.all}" > 
          <option value="${forum_article_VO.frm_art_no}">${forum_article_VO.frm_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
</ul>


<h3>�峹�޲z</h3>

<ul>
  <li><a href='addForum_article.jsp'>Add</a> a new Forum_article.</li>
</ul>

</body>
</html>