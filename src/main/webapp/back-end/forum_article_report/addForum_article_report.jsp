<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.forum_article_report.model.*"%>

<%
	Forum_article_report_VO forum_article_report_VO = (Forum_article_report_VO) request.getAttribute("forum_article_report_VO");
%>
--<%= forum_article_report_VO==null %>--${forum_article_report_VO.mem_no}-- --${forum_article_report_VO.frm_art_no}-- --${forum_article_report_VO.mng_no}--
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�Q�װϤ峹���|��Ʒs�W - addForum_article_report.jsp</title>

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
		 <h3>�Q�װϤ峹���|��Ʒs�W - addForum_article_report.jsp</h3></td><td>
		 <h4><a href="select_page.jsp"><img src="images/tomcat.png" width="100" height="100" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��Ʒs�W:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="forum_article_report.do" name="form1">
<table>
	<tr>
		<td>�峹���|�s��:</td>
		<td><input type="TEXT" name="frm_art_rpt_no" size="45" 
			 value="<%= (forum_article_report_VO==null)? 1 : forum_article_report_VO.getFrm_art_rpt_no()%>" /></td>
	</tr>
	<tr>
		<td>���|�ɶ�:</td>
		<td><input name="rpt_time" id="f_date1" type="text"></td>
	</tr>
	<tr>
		<td>���|�峹���e:</td>
		<td><input type="TEXT" name="rpt_content" size="45"
			 value="<%= (forum_article_report_VO==null)? "�����r��,���y�ɤO" : forum_article_report_VO.getRpt_content()%>" /></td>
	</tr>
	<tr>
		<td>�峹�B�z�����ɶ�:</td>
		<td><input name="rpt_done_time" id="f_date1" type="text"></td>
	</tr>
		<tr>
		<td>�峹�B�z���A:</td>
		<td><input type="TEXT" name="rpt_status" size="45"
			 value="<%= (forum_article_report_VO==null)? 0 : forum_article_report_VO.getRpt_status()%>" /></td>
	</tr>
		<tr>
		<td>�峹�B�z���G:</td>
		<td><input type="TEXT" name="rpt_result" size="45"
			 value="<%= (forum_article_report_VO==null)? 0 : forum_article_report_VO.getRpt_result()%>" /></td>
	</tr>
		<tr>
		<td>�峹�B�z���O:</td>
		<td><input type="TEXT" name="rpt_note" size="45"
			 value="<%= (forum_article_report_VO==null)? "�|���^��" : forum_article_report_VO.getRpt_note()%>" /></td>
	</tr>

	<jsp:useBean id="mem_Svc" scope="page" class="com.mem.modelMem_Service" />
	<tr>
		<td>�|���s��:<font color=red><b>*</b></font></td>
		<td><select size="1" name="mem_no">
			<c:forEach var="deptVO" items="${mem_Svc.all}">
				<option value="${mem_VO.mem_no}" ${(forum_article_report_VO.mem_no==mem_VO.mem_no)? 'selected':'' } >${mem_VO.mem_account}
			</c:forEach>
		</select></td>
	</tr>
		<jsp:useBean id="forum_article_tSvc" scope="page" class="com.forum_article.model.Forum_article_Service" />
	<tr>
		<td>�峹�s��:<font color=red><b>*</b></font></td>
		<td><select size="1" name="frm_art_no">
			<c:forEach var="forum_article_VO" items="${forum_article_tSvc.all}">
				<option value="${forum_article_VO.frm_art_no}" ${(forum_article_report_VO.frm_art_no==forum_article_VO.frm_art_no)? 'selected':'' } >${forum_article_VO.mem_no}
			</c:forEach>
		</select></td>
	</tr>
		<jsp:useBean id="manager_Svc" scope="page" class="com.manager.model.Manager_Service" />
	<tr>
		<td>�޲z���s��:<font color=red><b>*</b></font></td>
		<td><select size="1" name="mng_no">
			<c:forEach var="manager_VO" items="${manager_Svc.all}">
				<option value="${manager_VO.mng_no}" ${(forum_article_report_VO.mng_no==manager_VO.mng_no)? 'selected':'' } >${manager_VO.mng_account}
			</c:forEach>
		</select></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>
</body>



<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->

<% 
  java.sql.Timestamp rpt_time = null;
  try {
	  rpt_time = forum_article_report_VO.getRpt_time();
   } catch (Exception e) {
	  rpt_time = new java.sql.Timestamp(System.currentTimeMillis());
   }
  java.sql.Timestamp rpt_done_time = null;
  try {
	  rpt_done_time = forum_article_report_VO.getRpt_done_time();
   } catch (Exception e) {
	   rpt_done_time = new java.sql.Timestamp(System.currentTimeMillis());
   }
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=rpt_time%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
           //startDate:	            '2017/07/10',  // �_�l��
           //minDate:               '-1970-01-01', // �h������(���t)���e
           //maxDate:               '+1970-01-01'  // �h������(���t)����
        });
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=rpt_done_time%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
           //startDate:	            '2017/07/10',  // �_�l��
           //minDate:               '-1970-01-01', // �h������(���t)���e
           //maxDate:               '+1970-01-01'  // �h������(���t)����
        });
        
        
   
        // ----------------------------------------------------------�H�U�ΨӱƩw�L�k��ܪ����-----------------------------------------------------------

        //      1.�H�U���Y�@�Ѥ��e������L�k���
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.�H�U���Y�@�Ѥ��᪺����L�k���
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {e
        //      }});


        //      3.�H�U����Ӥ�����~������L�k��� (�]�i���ݭn������L���)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>
</html>