package kh.spring.grougle.companytree.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.grougle.companytree.domain.Companytree;
import kh.spring.grougle.companytree.domain.Companytree2;
import kh.spring.grougle.companytree.domain.CompanytreeEmployee;
import kh.spring.grougle.companytree.domain.CompanytreeEmployee2;

@Repository
public class CompanytreeDao {
	@Autowired
	private SqlSession sqlsession;
	
	public List<Companytree> selectCompanytreeList(){
		return sqlsession.selectList("Companytree.selectCompanytreeList");
	};
	
	public List<CompanytreeEmployee> selectCompanytreeEmployeeList(){
		return sqlsession.selectList("Companytree.selectCompanytreeEmployeeList");
	};
	
	public List<CompanytreeEmployee> selectCompanytreeEmployeeAllList(String dept_name){
		return sqlsession.selectList("Companytree.selectCompanytreedeptEmployeeList", dept_name);
	};
	public List<CompanytreeEmployee> selectCompanytreeEmployeerealAllList(){
		return sqlsession.selectList("Companytree.selectCompanytreeEmployeeList");
	};
	public int insertdept(Companytree companytree) {
		return sqlsession.insert("Companytree.insertdept", companytree);
	};
	public int selectdeptcheck(String dept_name) {
		return sqlsession.selectOne("Companytree.selectdeptnamecheck", dept_name);
	};
	public int updatedeptname(Companytree2 companytree2) {
		return sqlsession.update("Companytree.updatedeptname", companytree2);
	};
	public int updatedeptplace(Companytree companytree) {
		return sqlsession.update("Companytree.updatedeptplace", companytree);
	};
	public int deletedept(String dept_name) {
		return sqlsession.delete("Companytree.deletedept", dept_name);
	};
	public int selectdeptcheck2(String dept_no) {
		return sqlsession.selectOne("Companytree.selectdeptnamecheck2", dept_no);
	};
	public int selectdeptupdowncheck(Map map)  {
		return sqlsession.selectOne("Companytree.selectdeptupdowncheck", map);
	};
	public List<CompanytreeEmployee2> selectCompanytreeEmployeeAllList2(String dept_name){
		return sqlsession.selectList("Companytree.selectCompanytreeEmployeeAllList2", dept_name);
	};
}
