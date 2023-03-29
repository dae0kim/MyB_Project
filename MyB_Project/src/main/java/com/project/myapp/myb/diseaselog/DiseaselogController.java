package com.project.myapp.myb.diseaselog;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DiseaselogController {
	
	@Autowired
	IDiseaselogService diseaselogService;
	
	// (0329 합침 일형추가)
	@RequestMapping(value="/teacher/mteacher_disease", method=RequestMethod.POST)
	public String insertDiseaseLog(@RequestParam("classroomId") int classroomId, 
								   @RequestParam("kindergartenId") int kindergartenId,
								   @RequestParam("kindergartenCity") String kindergartenCity,
								   @RequestParam("kindergartenGu") String kindergartenGu,	
								   @RequestParam("childId[]") int[] childIds,	
								   @RequestParam("diseaseId[]") int[] diseaseIds) {
		System.out.println("diseaseId[]" + diseaseIds.length);
	    for (int i=0; i<diseaseIds.length; i++) {
	        DiseaselogVO diseaselogvo = new DiseaselogVO();
	        
	        // 고정으로 들어가는 요소
	        diseaselogvo.setClassroomId(classroomId);
	        diseaselogvo.setKindergartenId(kindergartenId);
	        diseaselogvo.setKindergartenCity(kindergartenCity);
	        diseaselogvo.setKindergartenGu(kindergartenGu);
	        
	        // 반복해서 들어가는 요소
	        diseaselogvo.setDiseaseId(diseaseIds[i]);
	        diseaselogvo.setChildId(childIds[i]);
	        
	        
	        diseaselogService.insertDiseaseLog(diseaselogvo);	        
	    }
	    return "redirect:/teacher/mteacher_web_main";
	}
	
	
	
	/* -----------------------------웹 기능----------------------------- */
	//관리자 통계 첫 화면
	@RequestMapping("/diseaselog/chart")
	public String selectDiseaselog(HttpSession session, Model model) {
		model.addAttribute("diseaselogVO",diseaselogService.countChildGuList());
		return "/admin/diseasechart";
	}
	
	@RequestMapping(value="/diseaselog/chart/json/{gu}")
	public @ResponseBody JSONObject getJSONMemberDiseaseList(@PathVariable String gu) {
		System.out.println(gu+"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		
		String temp = "";
		if(gu.equals("seongdong")) {
			temp="성동구";
			System.out.println(temp);
		}else if(gu.equals("gangseo")) {
			temp="강서구";
			System.out.println(temp);
		}else if(gu.equals("yangcheon")) {
			temp="양천구";
			System.out.println(temp);
		}else if(gu.equals("guro")) {
			temp="구로구";
			System.out.println(temp);
		}else if(gu.equals("geumcheon")) {
			temp="금천구";
			System.out.println(temp);
		}else if(gu.equals("gwanak")) {
			temp="관악구";
			System.out.println(temp);
		}else if(gu.equals("dongjak")) {
			temp="동작구";
			System.out.println(temp);
		}else if(gu.equals("seocho")) {
			temp="서초구";
			System.out.println(temp);
		}else if(gu.equals("gangnam")) {
			temp="강남구";
			System.out.println(temp);
		}else if(gu.equals("songpa")) {
			temp="송파구";
			System.out.println(temp);
		}else if(gu.equals("gangdong")) {
			temp="강동구";
			System.out.println(temp);
		}else if(gu.equals("eunpyeong")) {
			temp="은평구";
			System.out.println(temp);
		}else if(gu.equals("yeongdeungpo")) {
			temp="영등포구";
			System.out.println(temp);
		}else if(gu.equals("jungnang")) {
			temp="중랑구";
			System.out.println(temp);
		}else if(gu.equals("nowon")) {
			temp="노원구";
			System.out.println(temp);
		}else if(gu.equals("dobong")) {
			temp="도봉구";
			System.out.println(temp);
		}else if(gu.equals("gangbuk")) {
			temp="강북구";
			System.out.println(temp);
		}else if(gu.equals("jongno")) {
			temp="종로구";
			System.out.println(temp);
		}else if(gu.equals("sdm")) {
			temp="서대문구";
			System.out.println(temp);
		}else if(gu.equals("mapo")) {
			temp="마포구";
			System.out.println(temp);
		}else if(gu.equals("yongsan")) {
			temp="용산구";
			System.out.println(temp);
		}else if(gu.equals("jung")) {
			temp="중구";
			System.out.println(temp);
		}else if(gu.equals("seongbuk")) {
			temp="성북구";
			System.out.println(temp);
		}else if(gu.equals("ddm")) {
			temp="동대문구";
			System.out.println(temp);
		}else if(gu.equals("gwangjin")) {
			temp="광진구";
			System.out.println(temp);
		}

		System.out.println("맵리스트 : " + diseaselogService.countChildDiseaseList(temp));
		
		List<Map<String, Object>> maplist = diseaselogService.countChildDiseaseList(temp);
		
		JSONObject data = new JSONObject();
		JSONObject ajaxObjCols1 = new JSONObject();    //cols의 1번째 object를 담을 JSONObject
		JSONObject ajaxObjCols2 = new JSONObject();    //cols의 2번째 object를 담을 JSONObject
		JSONArray ajaxArryCols = new JSONArray();        //위의 두개의 JSONObject를 담을 JSONArray
	    JSONArray ajaxArryRows = new JSONArray();

		ajaxObjCols1.put("type", "string");
		ajaxObjCols2.put("type", "number");
		
		ajaxArryCols.add(ajaxObjCols1);
		ajaxArryCols.add(ajaxObjCols2);
				 
		for (int i=0; i<maplist.size(); i++){        //JSONArray의 size만큼 돌면서 형식을 만듭니다.
		    JSONObject legend = new JSONObject();
		    legend.put("v", maplist.get(i).get("DISEASENAME"));
		    legend.put("f", null);
		    
		    JSONObject value = new JSONObject();
		    value.put("v", maplist.get(i).get("TOTALPATIENT"));
		    value.put("f", null);
		 
		    JSONArray cValueArry = new JSONArray();
		    cValueArry.add(legend);
		    cValueArry.add(value);
		 
		    JSONObject cValueObj = new JSONObject();
		    cValueObj.put("c", cValueArry);
		    
		    ajaxArryRows.add(cValueObj);
		}

		data.put("cols", ajaxArryCols);
		data.put("rows", ajaxArryRows);
		
		return data;
	}
}
