<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.manager.model.Manager_VO"%>
<%@page import="com.manager.model.Manager_Service"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<nav class="sidebar sidebar-offcanvas" id="sidebar">
  <ul class="nav">
    <li class="nav-item">
      <div class="d-flex sidebar-profile">
        <div class="sidebar-profile-image">

          <img src="" alt="image" id="mem_img">
          <script>
          
            try {
              getContextPath()
            } catch (error) {
              function getContextPath() {
                let path = "http://";
                let hostname = window.location.host;
                let pathname = window.location.pathname.substring(0, window.location.pathname.indexOf('/', 2));
                return path + hostname + pathname;
              }
            }
            <c:if test="${sessionScope.mng != null}">
            document.querySelector("#mem_img").setAttribute("src",
              getContextPath() + "/ManagerImage?mng_no=1")
              </c:if>
            <c:if test="${sessionScope.mng == null}">
            document.querySelector("#mem_img").setAttribute("src",
              getContextPath() + "/ManagerImage?mng_no=")
              </c:if>
          </script>
        </div>
        <div class="sidebar-profile-name">
        <c:if test="${sessionScope.mng != null}">
          <p class="sidebar-name">${sessionScope.mng !=null ? "醉拳甘迺迪" : ""}</p>
          <p class="sidebar-designation"> Welcome</p>
          </c:if>
          
          <c:if test="${sessionScope.mng == null}">
          <p class="sidebar-name">請登入</p>
          <p class="sidebar-designation"></p>
          </c:if>
        </div>
      </div>
      <p class="sidebar-menu-title">目錄</p>
    </li>
<!--     <li class="nav-item"><a class="nav-link" href="index.html"> <i class="typcn typcn-device-desktop menu-icon"></i> -->
<!--         <span class="menu-title">Dashboard <span class="badge badge-primary ml-3">New</span></span> -->
<!--       </a></li> -->
<!--     <li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" -->
<!--         aria-controls="ui-basic"> -->
<!--         <i class="typcn typcn-briefcase menu-icon"></i> <span class="menu-title">UI Elements</span> <i -->
<!--           class="typcn typcn-chevron-right menu-arrow"></i> -->
<!--       </a> -->
<!--       <div class="collapse" id="ui-basic"> -->
<!--         <ul class="nav flex-column sub-menu"> -->
<!--           <li class="nav-item"><a class="nav-link" href="pages/ui-features/buttons.html">Buttons</a></li> -->
<!--           <li class="nav-item"><a class="nav-link" href="pages/ui-features/dropdowns.html">Dropdowns</a></li> -->
<!--           <li class="nav-item"><a class="nav-link" href="pages/ui-features/typography.html">Typography</a></li> -->
<!--         </ul> -->
<!--       </div> -->
<!--     </li> -->
<!--     <li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" -->
<!--         aria-controls="form-elements"> <i class="typcn typcn-film menu-icon"></i> <span class="menu-title">Form -->
<!--           elements</span> <i class="menu-arrow"></i> -->
<!--       </a> -->
<!--       <div class="collapse" id="form-elements"> -->
<!--         <ul class="nav flex-column sub-menu"> -->
<!--           <li class="nav-item"><a class="nav-link" href="pages/forms/basic_elements.html">Basic Elements</a></li> -->
<!--         </ul> -->
<!--       </div> -->
<!--     </li> -->
<!--     <li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" -->
<!--         aria-controls="charts"> <i class="typcn typcn-chart-pie-outline menu-icon"></i> <span -->
<!--           class="menu-title">Charts</span> <i class="menu-arrow"></i> -->
<!--       </a> -->
<!--       <div class="collapse" id="charts"> -->
<!--         <ul class="nav flex-column sub-menu"> -->
<!--           <li class="nav-item"><a class="nav-link" href="pages/charts/chartjs.html">ChartJs</a></li> -->
<!--         </ul> -->
<!--       </div> -->
<!--     </li> -->
<!--     <li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" -->
<!--         aria-controls="tables"> <i class="typcn typcn-th-small-outline menu-icon"></i> <span -->
<!--           class="menu-title">Tables</span> <i class="menu-arrow"></i> -->
<!--       </a> -->
<!--       <div class="collapse" id="tables"> -->
<!--         <ul class="nav flex-column sub-menu"> -->
<!--           <li class="nav-item"><a class="nav-link" href="pages/tables/basic-table.html">Basic table</a></li> -->
<!--         </ul> -->
<!--       </div> -->
<!--     </li> -->
<!--     <li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#icons" aria-expanded="false" -->
<!--         aria-controls="icons"> <i class="typcn typcn-compass menu-icon"></i> <span class="menu-title">Icons</span> -->
<!--         <i class="menu-arrow"></i> -->
<!--       </a> -->
<!--       <div class="collapse" id="icons"> -->
<!--         <ul class="nav flex-column sub-menu"> -->
<!--           <li class="nav-item"><a class="nav-link" href="pages/icons/mdi.html">Mdi icons</a></li> -->
<!--         </ul> -->
<!--       </div> -->
<!--     </li> -->
<!--     <li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" -->
<!--         aria-controls="auth"> <i class="typcn typcn-user-add-outline menu-icon"></i> <span class="menu-title">User -->
<!--           Pages</span> <i class="menu-arrow"></i> -->
<!--       </a> -->
<!--       <div class="collapse" id="auth"> -->
<!--         <ul class="nav flex-column sub-menu"> -->
<!--           <li class="nav-item"><a class="nav-link" href="pages/samples/login.html"> Login </a></li> -->
<!--           <li class="nav-item"><a class="nav-link" href="pages/samples/register.html"> Register </a></li> -->
<!--         </ul> -->
<!--       </div> -->
<!--     </li> -->
<!--     <li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#error" aria-expanded="false" -->
<!--         aria-controls="error"> <i class="typcn typcn-globe-outline menu-icon"></i> <span class="menu-title">Error -->
<!--           pages</span> <i class="menu-arrow"></i> -->
<!--       </a> -->
<!--       <div class="collapse" id="error"> -->
<!--         <ul class="nav flex-column sub-menu"> -->
<!--           <li class="nav-item"><a class="nav-link" href="pages/samples/error-404.html"> 404 </a></li> -->
<!--           <li class="nav-item"><a class="nav-link" href="pages/samples/error-500.html"> 500 </a></li> -->
<!--         </ul> -->
<!--       </div> -->
<!--     </li> -->
<!--     <li class="nav-item"><a class="nav-link" href="pages/documentation/documentation.html"> <i -->
<!--           class="typcn typcn-document-text menu-icon"></i> <span class="menu-title">Documentation</span> -->
<!--       </a></li> -->

    <li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#mem" aria-expanded="false"
        aria-controls="mem"> <i class="typcn typcn-user-add-outline menu-icon"></i> <span
          class="menu-title">會員管理</span>
        <i class="menu-arrow"></i>
      </a>
            <div class="collapse" id="mem">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"><a id="mem_list" class="nav-link" href=""> 會員資料管理 </a></li>
          <script>
            document.querySelector("#mem_list").setAttribute("href",
            	getContextPath() + "/back-end/mem/listAllMem.jsp");
          </script>
        </ul>
      </div>
    </li>
    <li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#coupon" aria-expanded="false"
        aria-controls="coupon"> <i class="typcn typcn-user-add-outline menu-icon"></i> <span
          class="menu-title">優惠券管理</span>
        <i class="menu-arrow"></i>
      </a>
            <div class="collapse" id="coupon">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"><a id="coupon_list" class="nav-link" href=""> 優惠券資料管理 </a></li>
          <script>
            document.querySelector("#coupon_list").setAttribute("href",
            	getContextPath() + "/back-end/coupon/listAllCoupon.jsp");
          </script>
        </ul>
      </div>
    </li>
        <li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#act" aria-expanded="false"
        aria-controls="act"> <i class="typcn typcn-user-add-outline menu-icon"></i> <span
          class="menu-title">活動管理</span>
        <i class="menu-arrow"></i>
      </a>
            <div class="collapse" id="act">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"><a id="act_list" class="nav-link" href=""> 活動資料管理 </a></li>
          <li class="nav-item"><a id="act_pic" class="nav-link" href=""> 活動圖片管理 </a></li>
          <li class="nav-item"><a id="act_sign_up" class="nav-link" href=""> 活動報名管理 </a></li>
          <li class="nav-item"><a id="firm_survey" class="nav-link" href=""> 活動問卷管理 </a></li>
          <li class="nav-item"><a id="question" class="nav-link" href=""> 問卷問題管理 </a></li>
          <script>
            document.querySelector("#act_list").setAttribute("href",
            	getContextPath() + "/back-end/act/listAllAct.jsp");
            document.querySelector("#act_pic").setAttribute("href",
                	getContextPath() + "/back-end/act_pic/listAllAct_pic.jsp");
            document.querySelector("#act_sign_up").setAttribute("href",
                	getContextPath() + "/back-end/act_sign_up/listAllAct_sign_up.jsp");
            document.querySelector("#firm_survey").setAttribute("href",
                	getContextPath() + "/back-end/firm_survey/listAllFirm_survey.jsp");
            document.querySelector("#question").setAttribute("href",
                	getContextPath() + "/back-end/question/listAllQuestion.jsp");
          </script>
        </ul>
      </div>
    </li>
    <li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#prod" aria-expanded="false"
        aria-controls="prod"> <i class="typcn typcn-user-add-outline menu-icon"></i> <span
          class="menu-title">商品管理</span>
        <i class="menu-arrow"></i>
      </a>
      <div class="collapse" id="prod">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"><a id="prod_list" class="nav-link" href=""> 商品清單管理 </a></li>
          <li class="nav-item"><a id="prod_type" class="nav-link" href=""> 商品類別管理 </a></li>
          <li class="nav-item"><a id="prod_pic" class="nav-link" href=""> 商品圖片管理 </a></li>
          <li class="nav-item"><a id="order_list" class="nav-link" href=""> 商品訂單明細 </a></li>
          <script>
            document.querySelector("#prod_list").setAttribute("href",
            	getContextPath() + "/back-end/prod/listAllProd.jsp");
            document.querySelector("#prod_type").setAttribute("href",
            	getContextPath() + "/back-end/prod_type/listAllProd_type.jsp");
            document.querySelector("#prod_pic").setAttribute("href",
            	getContextPath() + "/back-end/prod_pic/listAllProd_pic.jsp");
            document.querySelector("#order_list").setAttribute("href",
            	getContextPath() + "/back-end/order/listAllOrder.jsp");   
          </script>
        </ul>
      </div>
    </li>

    <li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#pub" aria-expanded="false"
        aria-controls="pub"> <i class="typcn typcn-user-add-outline menu-icon"></i> <span class="menu-title">酒吧管理</span>
        <i class="menu-arrow"></i>
      </a>
      <div class="collapse" id="pub">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"><a id="pub_check" class="nav-link" href="pages/samples/login.html"> 酒吧審核 </a></li>
          <li class="nav-item"><a id="pub_list" class="nav-link" href="/pages/samples/register.html"> 酒吧清單 </a></li>
          <script>
            document.querySelector("#pub_list").setAttribute("href",
              getContextPath() + "/pub/getlist");
            document.querySelector("#pub_check").setAttribute("href",
              getContextPath() + "/pub/pub_check");

          </script>
        </ul>
      </div>
    </li>
    
    <li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#mng" aria-expanded="false"
        aria-controls="mng"> <i class="typcn typcn-user-add-outline menu-icon"></i> <span
          class="menu-title">管理員管理</span>
        <i class="menu-arrow"></i>
      </a>
            <div class="collapse" id="mng">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"><a id="mng_list" class="nav-link" href=""> 管理員資料管理 </a></li>
          <li class="nav-item"><a id="mng_auth" class="nav-link" href=""> 管理員權限管理 </a></li>
          <script>
            document.querySelector("#mng_list").setAttribute("href",
                getContextPath() + "/back-end/manager/listAllMng.jsp");
            document.querySelector("#mng_auth").setAttribute("href",
                getContextPath() + "/back-end/manager_auth/listAllMngAuth.jsp");
          </script>
        </ul>
      </div>
    </li>
    
  </ul>
</nav>