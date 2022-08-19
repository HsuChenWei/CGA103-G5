package com.question_list.model;

import java.util.List;

public interface Question_list_DAO_interface {

	public void insert(Question_list_VO question_list_VO);

	public void update(Question_list_VO question_list_VO);

	public void delete(Integer question_no, Integer firm_survey_no);

	public Question_list_VO findByPrimaryKey(Integer question_no, Integer firm_survey_no);

	public List<Question_list_VO> getAll();
	// �U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//  public List<EmpVO> getAll(Map<String, String[]> map); 

}
