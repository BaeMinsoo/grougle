package kh.spring.grougle.eforml.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.grougle.eforml.dao.EformDao;
import kh.spring.grougle.eforml.domain.Eform;
import kh.spring.grougle.eforml.domain.Eform2;
import kh.spring.grougle.eforml.domain.EformRe;
import kh.spring.grougle.eforml.domain.EformRe2;

@Service
public class EformServiceImpl implements EformService{

	@Autowired
	private EformDao dao;
	
	public List<Eform> selectformsList(){
		return dao.selectformsList();
	};
	public List<Eform> selectformtreeList(){
		return dao.selectformtreeList();
	};
	public List<Eform> selectdetailformList(String category_no){
		return dao.selectdetailformList(category_no);
	};
	public List<Eform> selectdetailformList2(String category_name){
		return dao.selectdetailformList2(category_name);
	};
	public List<Eform> selectdetailformList3(String parent){
		return dao.selectdetailformList3(parent);
	};
	public List<Eform> selectdetailformallList(){
		return dao.selectdetailformallList();
	};
	public int selectcategorynamecheck(String category_name){
		return dao.selectcategorynamecheck(category_name);
	};
	public int insertcategory(Eform eform){
		return dao.insertcategory(eform);
	};
	public int selectcategorynamecheck2(String category_name){
		return dao.selectcategorynamecheck2(category_name);
	};
	public int updatecategoryname(Map map){
		return dao.updatecategoryname(map);
	};
	public int categoryupdowncheck(Map map){
		return dao.categoryupdowncheck(map);
	};
	public int updateformplace(Map map){
		return dao.updateformplace(map);
	};
	public int updatecategoryplace(Map map){
		return dao.updatecategoryplace(map);
	};
	public int selectdowncategorycheck(String category_no) {
		return dao.selectdowncategorycheck(category_no);
	};
	public int deletecategory(Eform eform) {
		return dao.deletecategory(eform);
	};
	public int deleteform(Eform eform) {
		return dao.deleteform(eform);
	};
	public Eform selectpreview(Eform eform){
		return dao.selectpreview(eform);
	};
	public int makeform(EformRe eformre) {
		return dao.makeform(eformre);
	};
	public Eform selectformtoedit(Eform eform){
		return dao.selectformtoedit(eform);
	};
	public int updateform(EformRe2 eformre) {
		return dao.updateform(eformre);
	};
}
