package kh.spring.grougle.eapproval.service;

import java.util.List;

import kh.spring.grougle.eapproval.domain.Eapproval;
import kh.spring.grougle.eforml.domain.Eform;

public interface EapprovalService {

	public Eform selectformandmake(Eform eform);
	public int makeapproval(Eapproval eapp);
	public List<Eapproval> selectapproval(int emp_no);
	public List<Eapproval> selectapproval2(int emp_no);
	public List<Eapproval> selectapproval3(int emp_no);
	public List<Eapproval> selectapproval4(int emp_no);
	public Eapproval selectapprovaldo(int draft_no);
	public int updateapproval(Eapproval eapp);
}
