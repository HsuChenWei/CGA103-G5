<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.prod.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.order_detail.model.*"%>
<%@ page import="com.order.model.*"%>

<%
    Order_Service orderSvc = new Order_Service();
    List<Order_VO> orderlist = orderSvc.getAll();
    pageContext.setAttribute("orderlist",orderlist);
%>

<%
Prod_Service prodSvc = new Prod_Service();
List<Prod_VO> list = prodSvc.getAll();
pageContext.setAttribute("list", list);

Object Objuser = session.getAttribute("user");
Mem_VO user = (Mem_VO) Objuser;

String url = request.getRequestURL().toString() + "?" + request.getQueryString();
session.setAttribute("url", url);
%>

<!DOCTYPE html>
<html lang="zh-Hant">
<!-- Basic(head都不用動) -->

<head>
    <meta charset="utf-8">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>朧醴 LonelyBar</title>
    <meta name="keywords" content="LonelyBar Index">
    <meta name="description" content="This is template from Theme Wagon.">
    <meta name="author" content="Theme Wagon">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon">
    <link rel="lonelybar-icon" href="../images/Logo2.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="../css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="../css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/custom.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

	<style>
		.btn {
    		width: auto;
    		height: auto;
			}		
	
	</style>
	
</head>

<body>

	<div id=top_nav_mainTop>
		<%@ include file="/front-end/partials/_mainTop.jsp"%>
	</div>

	<!-- !!!!!! 從以下開始修改到Start Instagram Feed" !!!!!!-->

    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>歷史訂單</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/front-end/mem/my-account.jsp">會員專區</a></li>
                        <li class="breadcrumb-item active">歷史訂單</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Cart  -->
    <div class="cart-box-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-main table-responsive">
						<table id="dataTables" class="stripe table-hover" style="width: 100%; font-size: 12px">
							<thead>
								<tr style="font-size:16px">
									<th>訂單編號</th>
									<th>訂單建立時間</th>
									<th>支付金額</th>
									<th>訂單狀態</th>
									<th>運費</th>
									<th>取貨人姓名</th>
									<th>取貨人地址</th>
									<th>取貨人電話</th>
									<th>訂單明細</th>
									<th>取消訂單</th>
								</tr>
							</thead>
							<c:forEach var="orderVO" items="${orderlist}">
							<c:if test="${orderVO.mem_no == user.mem_no}">
								<tr>
									<td>${orderVO.order_no}</td>
									<td>${orderVO.order_time}</td>
									<td>${orderVO.dis_price_total}</td>
									<td>
										<c:if test="${orderVO.order_status == 0}">
											<div>未出貨</div>
										</c:if>
										<c:if test="${orderVO.order_status == 1}">
											<div>已出貨</div>
										</c:if>
										<c:if test="${orderVO.order_status == 2}">
											<div>已完成</div>
										</c:if>
										<c:if test="${orderVO.order_status == 3}">
											<div>取消</div>
										</c:if>
									</td>
									<td>
										<c:if test="${orderVO.shipping_fee == 0}">
											<div>免運</div>
										</c:if>
										<c:if test="${orderVO.shipping_fee == 1}">
											<div>超商60元</div>
										</c:if>
										<c:if test="${orderVO.shipping_fee == 2}">
											<div>宅配100元</div>
										</c:if>
									</td>
									<td>${orderVO.receiver_name}</td>
									<td>${orderVO.receiver_address}</td>
									<td>${orderVO.receiver_phone}</td>
									<td>
										<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/prod/detail.do"
											style="margin-bottom: 0px;">
											<input type="submit" value="查詢">
											<input type="hidden" name="order_no" value="${orderVO.order_no}">
											<input type="hidden" name="action" value="listFrontOrder_details">
										</FORM>
									</td>
									<td>
										<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/prod/detail.do"
											style="margin-bottom: 0px;">
											<input type="submit" value="取消" style="color:red;" onclick="confirmTest11()">
											<input type="hidden" name="order_no" value="${orderVO.order_no}">
											<input type="hidden" name="action" value="cancelOrder">
										</FORM>
									</td>
								</tr>
							</c:if>
							</c:forEach>
						</table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Cart -->

	<!-- !!!!!!此行以下都不要修改!!!!!!-->
	<!-- Start Instagram Feed  -->
<!-- 	<div class="instagram-box"> -->
<%-- 		<%@ include file="/front-end/partials/_InstagramBox.jsp"%> --%>
<!-- 	</div> -->
	<!-- End Instagram Feed  -->
	<!-- Start Footer  -->
	<footer>
		<%@ include file="/front-end/partials/_footer.jsp"%>
	</footer>
	<!-- End Footer  -->

	<!-- Start copyright  -->
	<div class="footer-copyright">
		<p class="footer-company">
			All Rights Reserved. &copy; 2022 <a href="#">LonelyBar</a> Design By
			: <a href="https://html.design/">CGA103G5</a>
		</p>
	</div>
	<!-- End copyright  -->

	<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

	<!-- ALL JS FILES -->
	<script src="<%=request.getContextPath()%>/front-end/js/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<!-- ALL PLUGINS -->
	<script
		src="<%=request.getContextPath()%>/front-end/js/owl.carousel.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front-end/js/form-validator.min.js"></script>
	<script src="<%=request.getContextPath()%>/front-end/js/bootsnav.js"></script>
	<script
		src="<%=request.getContextPath()%>/front-end/js/baguetteBox.min.js"></script>
	<script src="<%=request.getContextPath()%>/front-end/js/inewsticker.js"></script>
	<script src="<%=request.getContextPath()%>/front-end/js/isotope.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front-end/js/jquery.superslides.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front-end/js/bootstrap-select.js"></script>
	<script
		src="<%=request.getContextPath()%>/front-end/js/images-loded.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front-end/js/contact-form-script.js"></script>
	<!-- 該文件需部屬較慢 -->
	<script id="customjs"
		src="<%=request.getContextPath()%>/front-end/js/custom.js"></script>
</body>

</html>