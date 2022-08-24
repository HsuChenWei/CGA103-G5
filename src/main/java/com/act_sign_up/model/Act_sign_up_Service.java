package com.act_sign_up.model;

import java.util.List;

public class Act_sign_up_Service {

	private Act_sign_up_DAO_interface dao;

	public Act_sign_up_Service() {
		dao = new Act_sign_up_DAO();
	}

	public Act_sign_up_VO addAct_sign_up(Integer act_no, Integer mem_no, Integer accompany_count,
			Integer sign_up_status) {

		Act_sign_up_VO act_sign_up_VO = new Act_sign_up_VO();

		act_sign_up_VO.setAct_no(act_no);
		act_sign_up_VO.setMem_no(mem_no);
		act_sign_up_VO.setAccompany_count(accompany_count);
		act_sign_up_VO.setSign_up_status(sign_up_status);

		dao.insert(act_sign_up_VO);

		return act_sign_up_VO;
	}

	public Act_sign_up_VO updateAct_sign_up(Integer act_no, Integer mem_no, Integer accompany_count,
			Integer sign_up_status, Integer sign_up_no) {

		Act_sign_up_VO act_sign_up_VO = new Act_sign_up_VO();

		act_sign_up_VO.setAct_no(act_no);
		act_sign_up_VO.setMem_no(mem_no);
		act_sign_up_VO.setAccompany_count(accompany_count);
		act_sign_up_VO.setSign_up_status(sign_up_status);
		act_sign_up_VO.setSign_up_no(sign_up_no);

		dao.update(act_sign_up_VO);

		return act_sign_up_VO;
	}

	public void deleteAct_sign_up(Integer sign_up_no) {
		dao.delete(sign_up_no);
	}

	public Act_sign_up_VO getOneAct_sign_up(Integer sign_up_no) {
		return dao.findByPrimaryKey(sign_up_no);
	}

	public List<Act_sign_up_VO> getAll() {
		return dao.getAll();
	}

}