package com.prod.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.prod.model.Prod_Service;
import com.prod.model.Prod_VO;

@WebServlet("/Prod_Servlet")
@MultipartConfig
public class Prod_Servlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
	@SuppressWarnings("null")
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("prod_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入商品編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/prod/selectProd.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer prod_no = null;
				try {
					prod_no = Integer.valueOf(str);
				} catch (Exception e) {
					errorMsgs.add("商品編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/prod/selectProd.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				Prod_Service prodSvc = new Prod_Service();
				Prod_VO prodVO = prodSvc.getOneProd(prod_no);
				if (prodVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/prod/selectProd.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("prodVO", prodVO); // 資料庫取出的empVO物件,存入req
				String url = "/back-end/prod/listOneProd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);
		}		
		
		if ("getOne_For_Update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
				/***************************1.接收請求參數****************************************/
				Integer prod_no = Integer.valueOf(req.getParameter("prod_no"));
				
				/***************************2.開始查詢資料****************************************/
				Prod_Service prodSvc = new Prod_Service();
				Prod_VO prodVO = prodSvc.getOneProd(prod_no);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("prodVO", prodVO);         // 資料庫取出的prod_picVO物件,存入req
				String url = "/back-end/prod/updateProd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_prod_pic_input.jsp
				successView.forward(req, res);
		}
		
		
		if ("update".equals(action)) { // 來自update_prod_pic_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer prod_no = Integer.valueOf(req.getParameter("prod_no").trim());
				
				Integer prod_type_no = null;
				try {
					prod_type_no = Integer.valueOf(req.getParameter("prod_type_no").trim());
				} catch (NumberFormatException e) {
					prod_type_no = 0;
					errorMsgs.add("商品種類編號請填數字");
				}	
						
				String prod_name = req.getParameter("prod_name");
				String prod_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (prod_name == null ||prod_name.trim().length() == 0) {
					errorMsgs.add("商品照片名稱: 請勿空白");
				} else if(!prod_name.trim().matches(prod_nameReg)) {
					errorMsgs.add("商品照片名稱: 只能是中、英文字母、數字和底線, 且長度必需在2到10之間");
	            }
				
				Integer prod_pic_no = null;
				try {
					prod_pic_no = Integer.valueOf(req.getParameter("prod_pic_no").trim());
				} catch (NumberFormatException e) {
					prod_pic_no = 0;
					errorMsgs.add("商品照片編號請填數字");
				}
				
				Integer prod_price = null;
				try {
					prod_price = Integer.valueOf(req.getParameter("prod_price").trim());
				} catch (NumberFormatException e) {
					prod_price = 0;
					errorMsgs.add("商品價格請填數字");
				}
				
				Integer prod_stock = null;
				try {
					prod_stock = Integer.valueOf(req.getParameter("prod_stock").trim());
				} catch (NumberFormatException e) {
					prod_stock = 0;
					errorMsgs.add("商品庫存請填數字");
				}
				
				Integer prod_status = null;
				if (prod_status != 0 || prod_status != 1) {
					errorMsgs.add("商品狀態請填0或1");
				} 
				
				Timestamp off_time = null;
				
				String prod_detail = null;				

				Prod_VO prodVO = new Prod_VO();
				prodVO.setProd_no(prod_no);
				prodVO.setProd_type_no(prod_type_no);
				prodVO.setProd_name(prod_name);
				prodVO.setProd_pic_no(prod_pic_no);
				prodVO.setProd_price(prod_price);
				prodVO.setProd_stock(prod_stock);
				prodVO.setProd_status(prod_status);
				prodVO.setOff_time(off_time);
				prodVO.setProd_detail(prod_detail);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("prodVO", prodVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/prod/updateProd.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				Prod_Service prodSvc = new Prod_Service();
				prodVO = prodSvc.updateProd(prod_no, prod_type_no, prod_name, prod_pic_no, prod_price, prod_stock, prod_status, off_time, prod_detail);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("prodVO", prodVO);
				String url = "/back-end/prod/listAllProd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
		}

        if ("insert".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/

			Integer prod_type_no = null;
			try {
				prod_type_no = Integer.valueOf(req.getParameter("prod_type_no").trim());
			} catch (NumberFormatException e) {
				prod_type_no = 0;
				errorMsgs.add("商品種類編號請填數字");
			}	
					
			String prod_name = req.getParameter("prod_name");
			String prod_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
			if (prod_name == null ||prod_name.trim().length() == 0) {
				errorMsgs.add("商品照片名稱: 請勿空白");
			} else if(!prod_name.trim().matches(prod_nameReg)) {
				errorMsgs.add("商品照片名稱: 只能是中、英文字母、數字和底線, 且長度必需在2到10之間");
            }
			
			Integer prod_pic_no = null;
			try {
				prod_pic_no = Integer.valueOf(req.getParameter("prod_pic_no").trim());
			} catch (NumberFormatException e) {
				prod_pic_no = 0;
				errorMsgs.add("商品照片編號請填數字");
			}
			
			Integer prod_price = null;
			try {
				prod_price = Integer.valueOf(req.getParameter("prod_price").trim());
			} catch (NumberFormatException e) {
				prod_price = 0;
				errorMsgs.add("商品價格請填數字");
			}
			
			Integer prod_stock = null;
			try {
				prod_stock = Integer.valueOf(req.getParameter("prod_stock").trim());
			} catch (NumberFormatException e) {
				prod_stock = 0;
				errorMsgs.add("商品庫存請填數字");
			}
			
			Timestamp off_time = null;
			
			String prod_detail = null;

				Prod_VO prodVO = new Prod_VO();
				prodVO.setProd_type_no(prod_type_no);
				prodVO.setProd_name(prod_name);
				prodVO.setProd_pic_no(prod_pic_no);
				prodVO.setProd_price(prod_price);
				prodVO.setProd_stock(prod_stock);
				prodVO.setOff_time(off_time);
				prodVO.setProd_detail(prod_detail);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("prodVO", prodVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/prod/addProd.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				Prod_Service prodSvc = new Prod_Service();
				prodVO = prodSvc.addProd(prod_type_no, prod_name, prod_pic_no, prod_price, prod_stock, off_time, prod_detail);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/back-end/prod_pic/listAllProd_pic.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
		}
        
		
		if ("delete".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
				/***************************1.接收請求參數***************************************/
				Integer prod_no = Integer.valueOf(req.getParameter("prod_no"));
				
				/***************************2.開始刪除資料***************************************/
				Prod_Service prodSvc = new Prod_Service();
				prodSvc.delete(prod_no);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/back-end/prod/listAllProd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
		}
	}
}