package kh.spring.grougle.eforml.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kh.spring.grougle.eforml.domain.Eform;
import kh.spring.grougle.eforml.domain.Eform2;
import kh.spring.grougle.eforml.domain.EformRe;
import kh.spring.grougle.eforml.domain.EformRe2;

public interface EformService {
	public List<Eform> selectformsList();
	public List<Eform> selectformtreeList();
	public List<Eform> selectdetailformList(String category_no);
	public List<Eform> selectdetailformList2(String category_name);
	public List<Eform> selectdetailformList3(String parent);
	public List<Eform> selectdetailformallList();
	public int selectcategorynamecheck(String category_name);
	public int insertcategory(Eform eform);
	public int selectcategorynamecheck2(String category_name);
	public int updatecategoryname(Map map);
	public int categoryupdowncheck(Map map);
	public int updateformplace(Map map);
	public int updatecategoryplace(Map map);
	public int selectdowncategorycheck(String category_no);
	public int deletecategory(Eform eform);
	public int deleteform(Eform eform);
	public Eform selectpreview(Eform eform);
	public int makeform(EformRe eformre);
	public Eform selectformtoedit(Eform eform);
	public int updateform(EformRe2 eformre);
}
