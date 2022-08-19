package com.firm_survey.model;

import java.util.List;

public interface Firm_survey_DAO_interface {

	public void insert(Firm_survey_VO firm_survey_VO);

	public void update(Firm_survey_VO firm_survey_VO);

	public void delete(Integer firm_survey_no);

	public Firm_survey_VO findByPrimaryKey(Integer firm_survey_no);

	public List<Firm_survey_VO> getAll();
	// �U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//  public List<EmpVO> getAll(Map<String, String[]> map); 

}
