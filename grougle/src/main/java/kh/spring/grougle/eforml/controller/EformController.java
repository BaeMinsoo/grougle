package kh.spring.grougle.eforml.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.grougle.companytree.domain.Companytree;
import kh.spring.grougle.companytree.domain.CompanytreeEmployee;
import kh.spring.grougle.eforml.domain.Eform;
import kh.spring.grougle.eforml.domain.Eform2;
import kh.spring.grougle.eforml.domain.EformRe;
import kh.spring.grougle.eforml.domain.EformRe2;
import kh.spring.grougle.eforml.service.EformService;

@Controller
@RequestMapping("/eform")
public class EformController {

	@Autowired
	private EformService service;
	
	@GetMapping("/main")
	public ModelAndView selectformsList(ModelAndView mv) {
		List<Eform> eformlist = service.selectformsList();
		mv.addObject("eformlist", eformlist);
		mv.setViewName("eforms/eformmain");
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/formtreeajax")
	public List<Eform> selectformtreeList(ModelAndView mv) {
		List<Eform> formtreelist = service.selectformtreeList();
		return formtreelist;
	}
	
	@ResponseBody
	@GetMapping("/detaillist")
	public ModelAndView selectdetailformList(ModelAndView mv
			, @RequestParam(name="category_no", required = true) String category_no) {
		List<Eform> eformlist = service.selectdetailformList(category_no);
		mv.addObject("eformlist", eformlist);
		mv.setViewName("eforms/formspage");
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/detaillist2")
	public ModelAndView selectdetailformList2(ModelAndView mv
			, @RequestParam(name="category_name", required = true) String category_name) {
		List<Eform> eformlist = service.selectdetailformList2(category_name);
		mv.addObject("eformlist", eformlist);
		mv.setViewName("eforms/formspage");
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/detaillist3")
	public ModelAndView selectdetailformList3(ModelAndView mv
			, @RequestParam(name="parent", required = true) String parent) {
		List<Eform> eformlist = service.selectdetailformList3(parent);
		mv.addObject("eformlist", eformlist);
		mv.setViewName("eforms/formspage");
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/detaillistall")
	public ModelAndView selectdetailformallList(ModelAndView mv) {
		List<Eform> eformlist = service.selectdetailformallList();
		mv.addObject("eformlist", eformlist);
		mv.setViewName("eforms/formspage");
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/checkcategoryname")
	public int selectcategorynamecheck(@RequestParam(name="category_name", required = true) String category_name) {
		int result = service.selectcategorynamecheck(category_name);
		return result;
	}
	
	@PostMapping("/addcategory")
	public ModelAndView insertcategory(ModelAndView mv
			, Eform eform) {
		int result = service.insertcategory(eform);
		mv.setViewName("redirect:/eform/main");
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/checkcategoryname2")
	public int selectcategorynamecheck2(@RequestParam(name="category_name", required = true) String category_name) {
		int result = service.selectcategorynamecheck2(category_name);
		return result;
	}
	
	@PostMapping("/updatecategoryname")
	public ModelAndView updatecategoryname(ModelAndView mv
			, @RequestParam(name="category_name", required = true) String category_name
			, @RequestParam(name="category_no", required = true) String category_no
			, @RequestParam(name="category_name_new", required = true) String category_name_new) {
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("category_name", category_name);
		map.put("category_no", category_no);
		map.put("category_name_new", category_name_new);
		int result = service.updatecategoryname(map);
		mv.setViewName("redirect:/eform/main");
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/categoryupdowncheck")
	public int categoryupdowncheck(@RequestParam(name="category_no1", required = true) int category_no1
			, @RequestParam(name="category_no2", required = true) int category_no2) {
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("category_no1", category_no1);
		map.put("category_no2", category_no2);
		int result = service.categoryupdowncheck(map);
		return result;
	}
	
	@ResponseBody
	@GetMapping("/formplacechange")
	public int updateformplace(ModelAndView mv
			, @RequestParam(name="category_name", required = true) String category_name
			, @RequestParam(name="new_upper_category_no", required = true) int new_upper_category_no) {
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("category_name", category_name);
		map.put("new_upper_category_no", new_upper_category_no);
		int result = service.updateformplace(map);
		return result;
	}
	
	@PostMapping("/updatecategoryplace")
	public ModelAndView updatecategoryplace(ModelAndView mv
			, @RequestParam(name="category_no", required = true) String category_no
			, @RequestParam(name="upper_category_no", required = true) String upper_category_no) {
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("category_no", category_no);
		map.put("upper_category_no", upper_category_no);
		int result = service.updatecategoryplace(map);
		mv.setViewName("redirect:/eform/main");
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/checkdowncategory")
	public int selectdowncategorycheck(@RequestParam(name="category_no", required = true) String category_no) {
		int result = service.selectdowncategorycheck(category_no);
		return result;
	}
	
	@PostMapping("/deletecategory")
	public ModelAndView deletecategory(ModelAndView mv
			, Eform eform) {
		int result = service.deletecategory(eform);
		mv.setViewName("redirect:/eform/main");
		return mv;
	}
	
	@PostMapping("/deleteform")
	public ModelAndView deleteform(ModelAndView mv
			, Eform eform) {
		int result = service.deleteform(eform);
		mv.setViewName("redirect:/eform/main");
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/preview")
	public ModelAndView selectpreview(ModelAndView mv
			, Eform eform) {
		Eform eformpreview = service.selectpreview(eform);
		mv.addObject("eformpreview", eformpreview);
		mv.setViewName("eforms/formpreview");
		return mv;
	}
	
	@GetMapping("/makeformspage")
	public ModelAndView makeformpage(ModelAndView mv
			, HttpSession httpSession, HttpServletRequest req) {
		mv.setViewName("eforms/makeforms");
		return mv;
	}
	
	@PostMapping("/makeform")
	public ModelAndView makeform(ModelAndView mv
			, EformRe eformre) {
		int result = service.makeform(eformre);
		mv.setViewName("redirect:/eform/main");
		return mv;
	}
	
	@GetMapping("/editformspage")
	public ModelAndView editformpage(ModelAndView mv
			, Eform eform
			, HttpSession httpSession
			, HttpServletRequest req) {
		Eform draftInfo = service.selectformtoedit(eform);
		mv.addObject("draftInfo", draftInfo);
		mv.setViewName("eforms/editforms");
		return mv;
	}
	
	@PostMapping("/updateform")
	public ModelAndView updateform(ModelAndView mv
			, EformRe2 eformre) {
		int result = service.updateform(eformre);
		mv.setViewName("redirect:/eform/main");
		return mv;
	}
}
