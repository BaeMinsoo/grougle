package kh.spring.grougle.eapproval.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.grougle.eapproval.dao.EapprovalDao;
import kh.spring.grougle.eapproval.domain.Eapproval;
import kh.spring.grougle.eforml.dao.EformDao;
import kh.spring.grougle.eforml.domain.Eform;

@Service
public class EapprovalServiceImpl implements EapprovalService {

	@Autowired
	private EapprovalDao dao;
	
	public Eform selectformandmake(Eform eform) {
		return dao.selectformandmake(eform);
	};
	public int makeapproval(Eapproval eapp) {
		return dao.makeapproval(eapp);
	};
	public List<Eapproval> selectapproval(int emp_no){
		return dao.selectapproval(emp_no);
	};
	public List<Eapproval> selectapproval2(int emp_no){
		return dao.selectapproval2(emp_no);
	};
	public List<Eapproval> selectapproval3(int emp_no){
		return dao.selectapproval3(emp_no);
	};
	public List<Eapproval> selectapproval4(int emp_no){
		return dao.selectapproval4(emp_no);
	};
	public Eapproval selectapprovaldo(int draft_no) {
		return dao.selectapprovaldo(draft_no);
	};
	public int updateapproval(Eapproval eapp) {
		return dao.updateapproval(eapp);
	};
}
