package kh.spring.grougle.eforml.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.grougle.eforml.domain.Eform;
import kh.spring.grougle.eforml.domain.Eform2;
import kh.spring.grougle.eforml.domain.EformRe;
import kh.spring.grougle.eforml.domain.EformRe2;

@Repository
public class EformDao {

	@Autowired
	private SqlSession sqlsession;
	
	public List<Eform> selectformsList(){
		return sqlsession.selectList("Eform.selectformsList");
	};
	public List<Eform> selectformtreeList(){
		return sqlsession.selectList("Eform.selectformtreeList");
	};
	public List<Eform> selectdetailformList(String category_no){
		return sqlsession.selectList("Eform.selectdetailformList", category_no);
	};
	public List<Eform> selectdetailformList2(String category_name){
		return sqlsession.selectList("Eform.selectdetailformList2", category_name);
	};
	public List<Eform> selectdetailformList3(String parent){
		return sqlsession.selectList("Eform.selectdetailformList3", parent);
	};
	public List<Eform> selectdetailformallList(){
		return sqlsession.selectList("Eform.selectdetailformallList");
	};
	public int selectcategorynamecheck(String category_name){
		return sqlsession.selectOne("Eform.selectcategorynamecheck", category_name);
	};
	public int insertcategory(Eform eform){
		return sqlsession.insert("Eform.insertcategory", eform);
	};
	public int selectcategorynamecheck2(String category_name){
		return sqlsession.selectOne("Eform.selectcategorynamecheck2", category_name);
	};
	public int updatecategoryname(Map map){
		return sqlsession.update("Eform.updatecategoryname", map);
	};
	public int categoryupdowncheck(Map map){
		return sqlsession.selectOne("Eform.categoryupdowncheck", map);
	};
	public int updateformplace(Map map){
		return sqlsession.update("Eform.updateformplace", map);
	};
	public int updatecategoryplace(Map map){
		return sqlsession.update("Eform.updatecategoryplace", map);
	};
	public int selectdowncategorycheck(String category_no) {
		return sqlsession.selectOne("Eform.selectdowncategorycheck", category_no);
	};
	public int deletecategory(Eform eform) {
		return sqlsession.delete("Eform.deletecategory", eform);
	};
	public int deleteform(Eform eform) {
		return sqlsession.delete("Eform.deleteform", eform);
	};
	public Eform selectpreview(Eform eform){
		return sqlsession.selectOne("Eform.selectpreview", eform);
	};
	public int makeform(EformRe eformre) {
		return sqlsession.insert("Eform.makeform", eformre);
	};
	public Eform selectformtoedit(Eform eform){
		return sqlsession.selectOne("Eform.selectformtoedit", eform);
	};
	public int updateform(EformRe2 eformre) {
		return sqlsession.update("Eform.updateform", eformre);
	};
}
