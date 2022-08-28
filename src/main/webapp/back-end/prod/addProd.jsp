<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.prod.model.*"%>

<%
	Prod_Service_H prodSvc = new Prod_Service_H();
	List<Prod> list = prodSvc.getAll();
	pageContext.setAttribute("list",list);
%>

<!DOCTYPE html>
<html lang="zh">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>�gĿ LonelyBar�i��ݡj</title>
<!-- base:css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back-end/vendors/typicons.font/font/typicons.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back-end/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
<!-- endinject -->
<!-- plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back-end/css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/back-end/images/favicon.png" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	let path = window.location.pathname.substring(0, window.location.pathname
			.lastIndexOf("/"));
	path = path.substring(0, path.lastIndexOf("/"));
</script>
</head>

<body>
	<!-- �D���� -->
	<div class="container-scroller">
		<!-- �ޤJnav(�����t�s�i) -->
		<script src="<%=request.getContextPath()%>/back-end/js/nav.js"></script>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_settings-panel.html -->
			<!-- �ޤJ�B�ʵ��� -->
			<script
				src="<%=request.getContextPath()%>/back-end/js/floating_window.js"></script>
			<!-- partial -->
			<!-- partial:partials/_sidebar.html -->
			<nav class="sidebar sidebar-offcanvas" id="sidebar"></nav>
			<!-- �ޤJsidebar ��JQ�覡 -->
			<script>
				$(function() {
					$("#sidebar").load(
							window.location.pathname.substring(0,
									window.location.pathname.indexOf('/', 2))
									+ "/back-end/partials/_sidebar.html");
				});
			</script>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<!--�A�n�g������  -->
					<table id="dataTables" class="stripe" style="width: 100%" enctype="multipart/form-data">
						<thead>
							<tr>
								<th>�ӫ~�s��</th>
								<th>�ӫ~����</th>
								<th>�ӫ~�W��</th>
								<th>�ӫ~�Ӥ�</th>
								<th>�ӫ~���</th>
								<th>�w�s�ƶq</th>
								<th>�ӫ~���A</th>
								<th>�W�[�ɶ�</th>
								<th>�U�[�ɶ�</th>
								<th>�� �z</th>	
							</tr>
						</thead>
						<tbody>
							<c:forEach var="prod" items="${list}">
								<tr>
									<td>${prod.prod_no}</td>
									<td>${prod.prod_typeVO.prod_type}</td>
									<td>${prod.prod_name}</td>
									<td>${prod.prod_picVO.prod_pic}</td>
									<td>${prod.prod_stock}</td>
									<td>${prod.prod_price}</td>
									<td>${prod.prod_status?"�W�[":"�U�["}</td>
									<td>${prod.launch_time}</td>
									<td>${prod.off_time}</td>
									<td>			  
									<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/pages/prod/prod.do" style="margin-bottom: 0px;">
			     						<input type="submit" value="�޲z">
			     						<input type="hidden" name="prod_no"  value="${prod.prod_no}">
			     						<input type="hidden" name="action"	value="getOne_For_Update">
			     					</FORM>
			     					</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th>�ӫ~�s��</th>
								<th>�ӫ~����</th>
								<th>�ӫ~�W��</th>
								<th>�ӫ~�Ӥ�</th>
								<th>�ӫ~���</th>
								<th>�w�s�ƶq</th>
								<th>�ӫ~���A</th>
								<th>�W�[�ɶ�</th>
								<th>�U�[�ɶ�</th>
								<th>�� �z</th>
							</tr>
						</tfoot>
					</table>

					<script>
						$(document).ready(function() {
							$('#dataTables').DataTable();
						});
					</script>
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.html -->
				<!-- �ޤJfooter ��JQ�覡 -->
				<footer class="footer"></footer>
				<script>
					$(function() {
						$(".footer").load(
								window.location.pathname.substring(0,
										window.location.pathname
												.indexOf('/', 2))
										+ "/back-end/partials/_footer.html");
					});
				</script>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- base:js -->
	<script
		src="<%=request.getContextPath()%>/back-end/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page-->
	<!-- End plugin js for this page-->
	<!-- inject:js -->
	<script src="<%=request.getContextPath()%>/back-end/js/off-canvas.js"></script>
	<script
		src="<%=request.getContextPath()%>/back-end/js/hoverable-collapse.js"></script>
	<script src="<%=request.getContextPath()%>/back-end/js/template.js"></script>
	<script src="<%=request.getContextPath()%>/back-end/js/settings.js"></script>
	<script src="<%=request.getContextPath()%>/back-end/js/todolist.js"></script>
	<!-- endinject -->
	<!-- plugin js for this page -->
	<script
		src="<%=request.getContextPath()%>/back-end/vendors/progressbar.js/progressbar.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/back-end/vendors/chart.js/Chart.min.js"></script>
	<!-- End plugin js for this page -->
	<!-- Custom js for this page-->

	<script src="<%=request.getContextPath()%>/back-end/js/dashboard.js"></script>
	<script
		src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
	<!-- End custom js for this page-->
</body>

</html>