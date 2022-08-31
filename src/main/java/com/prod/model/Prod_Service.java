package com.prod.model;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

public class Prod_Service {
	
	private Prod_DAO_interface dao;
	
	public Prod_Service() {
		dao = new Prod_DAO();
	}
	
	public Prod_VO addProd(Integer prod_type_no, String prod_name, Integer prod_pic_no, Integer prod_price, 
			Integer prod_stock, Timestamp off_time, String prod_detail) {
		
		Prod_VO prodVO = new Prod_VO();
		prodVO.setProd_type_no(prod_type_no);
		prodVO.setProd_name(prod_name);		
		prodVO.setProd_pic_no(prod_pic_no);		
		prodVO.setProd_price(prod_price);
		prodVO.setProd_stock(prod_stock);
		prodVO.setOff_time(off_time);
		prodVO.setProd_detail(prod_detail);
		dao.insert(prodVO);
		return prodVO;
	}

	public Prod_VO updateProd(Integer prod_no, Integer prod_type_no, String prod_name, Integer prod_pic_no, Integer prod_price, 
			Integer prod_stock, Integer prod_status, Timestamp off_time, String prod_detail) {

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

		dao.update(prodVO);

		return prodVO;
	}

	public void delete(Integer prod_no) {
		dao.delete(prod_no);
	}

	public Prod_VO getOneProd(Integer prod_no) {
		return dao.findByPrimaryKey(prod_no);
	}

	public List<Prod_VO> getAll() {
		return dao.getAll();
	}
	
	public List<Prod_VO> getAll(Map<String, String[]> map) {
		return dao.getAll(map);
	}
}