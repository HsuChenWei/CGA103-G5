<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.forum_article.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	Forum_article_Service forum_article_Svc = new Forum_article_Service();
    List<Forum_article_VO> list = forum_article_Svc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有討論區文章資料 - listAllForum_article.jsp</title>

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

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>所有討論區文章資料 - listAllForum_article.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>文章編號</th>
		<th>討論區編號</th>
		<th>會員編號</th>
		<th>文章發布時間</th>
		<th>文章主旨</th>
		<th>文章內容</th>
		<th>圖片訊息</th>
		<th>文章狀態</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="empVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${forum_article_VO.frm_art_no}</td>
			<td>${forum_article_VO.frm_no}</td>
			<td>${forum_article_VO.mem_no}</td>
			<td>${forum_article_VO.art_time}</td>
			<td>${forum_article_VO.art_title}</td>
			<td>${forum_article_VO.art_content}</td> 
			<td>${forum_article_VO.art_img}</td>
			<td>${forum_article_VO.art_status}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/forum_article/forum_article.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="frm_art_no"  value="${forum_article_VO.frm_art_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/forum_article/forum_article.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="frm_art_no"  value="${forum_article_VO.frm_art_no}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>