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
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DiseaselogController {
	
	@Autowired
	IDiseaselogService diseaselogService;
	
	//관리자 통계 첫 화면
	@RequestMapping("/diseaselog/chart")
	public String selectDiseaselog(HttpSession session, Model model) {
		//기본 출력 구 설정
		/*
		 * String gu = "seongbuk"; model.addAttribute("gu",gu);
		 */
		model.addAttribute("diseaselogVO",diseaselogService.countChildGuList());
		return "/admin/diseasechart";
	}
	
	//지도에서 구 눌렀을 때 처음 동작 - 어떤 구가 눌렸는지 인식하고 구 명칭을 전달
	/*
	 * @RequestMapping("/diseaselog/{gu}") public String selectChart(@PathVariable
	 * String gu,Model model) { System.out.println(gu+"@@@@@@@@@@@@@@@@@@@@@@@");
	 * return "redirect:/diseaselog/chart/"+gu; }
	 * 
	 * @RequestMapping("/diseaselog/chart/{gu}") public String
	 * selectChart1(@PathVariable String gu,Model model) {
	 * model.addAttribute("gu",gu);
	 * model.addAttribute("diseaselogVO",diseaselogService.countChildGuList());
	 * 
	 * return "/admin/diseasechart"; //return "/admin/chartmain"; }
	 */
	
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
