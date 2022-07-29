package kh.spring.grougle.companytree.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.grougle.companytree.dao.CompanytreeDao;
import kh.spring.grougle.companytree.domain.Companytree;
import kh.spring.grougle.companytree.domain.Companytree2;
import kh.spring.grougle.companytree.domain.CompanytreeEmployee;
import kh.spring.grougle.companytree.domain.CompanytreeEmployee2;

@Service
public class CompanytreeServiceImpl implements CompanytreeService{

	@Autowired
	private CompanytreeDao dao;
	
	public List<Companytree> selectCompanytreeList(){
		return dao.selectCompanytreeList();
	};
	
	public List<CompanytreeEmployee> selectCompanytreeEmployeeList(){
		return dao.selectCompanytreeEmployeeList();
	};
	
	public List<CompanytreeEmployee> selectCompanytreeEmployeeAllList(String dept_name){
		return dao.selectCompanytreeEmployeeAllList(dept_name);
	};
	public List<CompanytreeEmployee> selectCompanytreeEmployeerealAllList(){
		return dao.selectCompanytreeEmployeerealAllList();
	};
	public int insertdept(Companytree companytree) {
		return dao.insertdept(companytree);
	};
	public int selectdeptcheck(String dept_name) {
		return dao.selectdeptcheck(dept_name);
	};
	public int updatedeptname(Companytree2 companytree2) {
		return dao.updatedeptname(companytree2);
	};
	public int updatedeptplace(Companytree companytree) {
		return dao.updatedeptplace(companytree);
	};
	public int deletedept(String dept_name) {
		return dao.deletedept(dept_name);
	};
	public int selectdeptcheck2(String dept_no) {
		return dao.selectdeptcheck2(dept_no);
	};
	public int selectdeptupdowncheck(Map map)  {
		return dao.selectdeptupdowncheck(map);
	};
	public List<CompanytreeEmployee2> selectCompanytreeEmployeeAllList2(String dept_name){
		return dao.selectCompanytreeEmployeeAllList2(dept_name);
	};
}
