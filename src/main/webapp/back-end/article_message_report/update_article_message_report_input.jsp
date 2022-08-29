<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.article_message_report.model.*"%>

<%
	Article_message_report_VO article_message_report_VO = (Article_message_report_VO) request.getAttribute("article_message_report_VO"); //EmpServlet.java (Concroller) �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>
--<%= article_message_report_VO==null %>--${article_message_report_VO.mem_no}-- --${article_message_report_VO.mng_no}-- --${article_message_report_VO.art_msg_no}--
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�d�����|��ƭק� - update_article_message_report_input.jsp</title>

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
		 <h3>�d�����|��ƭק� - update_article_message_report_input.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��ƭק�:</h3>

<%-- ���~���C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="article_message_report.do" name="form1">
<table>
	<tr>
		<td>���|�d���s��:</td>
		<td><input type="TEXT" name="art_msg_rpt" size="45" 
			 value="<%= (article_message_report_VO==null)? 1 : article_message_report_VO.getArt_msg_rpt()%>" /></td>
	</tr>
<!-- 	<tr> -->
<!-- 		<td>�|���s��:</td> -->
<!-- 		<td><input type="TEXT" name="mem_no" size="45" -->
<%-- 			 value="<%= (article_message_report_VO==null)? 1 : article_message_report_VO.getMem_no()%>" /></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>�d���s��:</td> -->
<!-- 		<td><input type="TEXT" name="art_msg_no" size="45" -->
<%-- 			 value="<%= (article_message_report_VO==null)? 1 : article_message_report_VO.getArt_msg_no()%>" /></td> --%>
<!-- 	</tr> -->
	<tr>
		<td>���|�ɶ�:</td>
		<td><input name="rpt_time" id="f_date1" type="text"></td>
	</tr>
	<tr>
		<td>���|�d�����e:</td>
		<td><input type="TEXT" name="rpt_msg_content" size="45"
			 value="<%= (article_message_report_VO==null)? "���먥��" : article_message_report_VO.getRpt_msg_content()%>" /></td>
	</tr>
<!-- 	<tr> -->
<!-- 		<td>�޲z���s��:</td> -->
<!-- 		<td><input type="TEXT" name="mng_no" size="45" -->
<%-- 			 value="<%= (article_message_report_VO==null)?1 : article_message_report_VO.getMng_no()%>" /></td> --%>
<!-- 	</tr> -->
	<tr>
		<td>�B�z�����ɶ�:</td>
		<td><input name="msg_done_time" id="f_date1" type="text"></td>
	</tr>
	<tr>
		<td>�B�z���p:</td>
		<td><input type="TEXT" name="mng_no" size="45"
			 value="<%= (article_message_report_VO==null)? 0 : article_message_report_VO.getMsg_states()%>" /></td>
	</tr>
	<tr>
		<td>�B�z���G:</td>
		<td><input type="TEXT" name="mng_no" size="45"
			 value="<%= (article_message_report_VO==null)? 0 : article_message_report_VO.getMsg_states()%>" /></td>
	</tr>
	<tr>
		<td>�B�z���O:</td>
		<td><input type="TEXT" name="mng_no" size="45"
			 value="<%= (article_message_report_VO==null)? "�|���B�z" : article_message_report_VO.getMsg_note()%>" /></td>
	</tr>

			<jsp:useBean id="mem_Svc" scope="page" class="com.mem.model.DeptService" />
			<tr>
				<td>�|���s��:<font color=red><b>*</b></font></td>
				<td><select size="1" name="mem_no">
					<c:forEach var="mem_VO" items="${mem_Svc.all}">
						<option value="${mem_VO.mem_no}" ${(article_message_report_VO.mem_no==mem_VO.mem_no)?'selected':'' } >${mem_VO.mem_account}
					</c:forEach>
				</select></td>
			</tr>
			<jsp:useBean id="article_message_Svc" scope="page" class="com.article_message.model.Article_message_Service" />
			<tr>
				<td>�d���s��:<font color=red><b>*</b></font></td>
				<td><select size="1" name="art_msg_no">
					<c:forEach var="article_message_VO" items="${article_message_Svc.all}">
						<option value="${article_message_VO.art_msg_no}" ${(article_message_report_VO.art_msg_no==article_message_VO.art_msg_no)?'selected':'' } >${article_message_VO.mem_no}
					</c:forEach>
				</select></td>
			</tr>
			<jsp:useBean id="manager_Svc" scope="page" class="com.manager.model.Manager_Service" />
			<tr>
				<td>�޲z���s��:<font color=red><b>*</b></font></td>
				<td><select size="1" name="mng_no">
					<c:forEach var="manager_VO" items="${manager_Svc.all}">
						<option value="${manager_VO.mng_no}" ${(article_message_report_VO.mng_no==manager_VO.mng_no)?'selected':'' } >${manager_VO.mng_account}
					</c:forEach>
				</select></td>
			</tr>

		</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="art_msg_rpt" value="<%=article_message_report_VO.getArt_msg_rpt()%>">
<input type="submit" value="�e�X�ק�"></FORM>
</body>



<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->

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
 		   value: '<%=article_message_report_VO.getRpt_time()%>', // value:   new Date(),
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
 		   value: '<%=article_message_report_VO.getMsg_done_time()%>', // value:   new Date(),
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
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
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