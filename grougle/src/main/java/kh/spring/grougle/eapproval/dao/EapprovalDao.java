package kh.spring.grougle.eapproval.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.grougle.eapproval.domain.Eapproval;
import kh.spring.grougle.eforml.domain.Eform;

@Repository
public class EapprovalDao {

	@Autowired
	private SqlSession sqlsession;
	
	public Eform selectformandmake(Eform eform) {
		return sqlsession.selectOne("Eapproval.selectformandmake", eform);
	};
	public int makeapproval(Eapproval eapp) {
		return sqlsession.insert("Eapproval.makeapproval", eapp);
	};
	public List<Eapproval> selectapproval(int emp_no) {
		return sqlsession.selectList("Eapproval.selectapproval", emp_no);
	};
	public List<Eapproval> selectapproval2(int emp_no) {
		return sqlsession.selectList("Eapproval.selectapproval2", emp_no);
	};
	public List<Eapproval> selectapproval3(int emp_no) {
		return sqlsession.selectList("Eapproval.selectapproval3", emp_no);
	};
	public List<Eapproval> selectapproval4(int emp_no) {
		return sqlsession.selectList("Eapproval.selectapproval4", emp_no);
	};
	public Eapproval selectapprovaldo(int draft_no) {
		return sqlsession.selectOne("Eapproval.selectapprovaldo", draft_no);
	};
	public int updateapproval(Eapproval eapp) {
		return sqlsession.update("Eapproval.updateapproval", eapp);
	};
}
