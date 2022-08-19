package com.act_sign_up.model;

import java.util.List;

public interface Act_sign_up_DAO_interface {

	public void insert(Act_sign_up_VO act_sign_up_VO);

	public void update(Act_sign_up_VO act_sign_up_VO);

	public void delete(Integer sign_up_no);

	public Act_sign_up_VO findByPrimaryKey(Integer sign_up_no);

	public List<Act_sign_up_VO> getAll();
	// �U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//  public List<EmpVO> getAll(Map<String, String[]> map); 
}
