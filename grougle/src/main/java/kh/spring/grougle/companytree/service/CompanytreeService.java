package kh.spring.grougle.companytree.service;

import java.util.List;
import java.util.Map;

import kh.spring.grougle.companytree.domain.Companytree;
import kh.spring.grougle.companytree.domain.Companytree2;
import kh.spring.grougle.companytree.domain.CompanytreeEmployee;
import kh.spring.grougle.companytree.domain.CompanytreeEmployee2;

public interface CompanytreeService {
	public List<Companytree> selectCompanytreeList();
	public List<CompanytreeEmployee> selectCompanytreeEmployeeList();
	public List<CompanytreeEmployee> selectCompanytreeEmployeeAllList(String dept_name);	public List<CompanytreeEmployee> selectCompanytreeEmployeerealAllList();	public int insertdept(Companytree companytree);	public int selectdeptcheck(String dept_name);
	public int updatedeptname(Companytree2 companytree2);
	public int updatedeptplace(Companytree companytree);
	public int deletedept(String dept_name);
	public int selectdeptcheck2(String dept_no);
	public int selectdeptupdowncheck(Map map);
	public List<CompanytreeEmployee2> selectCompanytreeEmployeeAllList2(String dept_name);
}
