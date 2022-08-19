package com.ans_list.model;

import java.util.List;

public interface Ans_list_DAO_interface {

	public void insert(Ans_list_VO ans_list_VO);

	public void update(Ans_list_VO ans_list_VO);

	public void delete(Integer question_no, Integer firm_survey_no, Integer mem_no);

	public Ans_list_VO findByPrimaryKey(Integer question_no, Integer firm_survey_no, Integer mem_no);

	public List<Ans_list_VO> getAll();
	// �U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//  public List<EmpVO> getAll(Map<String, String[]> map); 

}
