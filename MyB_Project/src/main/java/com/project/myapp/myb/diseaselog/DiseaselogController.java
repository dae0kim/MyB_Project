package com.project.myapp.myb.diseaselog;

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

/**
 * 질병로그 데이터와 관련된 기능을 담는 컨트롤러클래스입니다.
 * 
 * @author 손일형,김대영
 * @since 2023.04.04
 *
 */
@Controller
public class DiseaselogController {
	
	@Autowired
	IDiseaselogService diseaselogService;
	
	/**
	 * 질병로그를 입력하기 위해 사용되는 메서드입니다
	 * 
	 * @param classroomId 반 식별번호를 입력합니다
	 * @param kindergartenId 어린이집 식별번호를 입력합니다
	 * @param kindergartenCity 어린이집 시를 입력합니다
	 * @param kindergartenGu 어린이집 구를 입력합니다
	 * @param childIds 자녀 식별번호를 배열로 입력합니다
	 * @param diseaseIds 질병 식별번호를 배열로 입력합니다
	 * @return 질병로그가 입력되면 교사 웹 메인을 반환합니다
	 */
	@RequestMapping(value="/teacher/mteacher_disease", method=RequestMethod.POST)
	public String insertDiseaseLog(@RequestParam("classroomId") int classroomId, 
								   @RequestParam("kindergartenId") int kindergartenId,
								   @RequestParam("kindergartenCity") String kindergartenCity,
								   @RequestParam("kindergartenGu") String kindergartenGu,	
								   @RequestParam("childId[]") int[] childIds,	
								   @RequestParam("diseaseId[]") int[] diseaseIds) {
		for (int i=0; i<diseaseIds.length; i++) {
	        DiseaselogVO diseaselogvo = new DiseaselogVO();
	        

	        if(diseaseIds[i] != 0) {
		        diseaselogvo.setClassroomId(classroomId);
		        diseaselogvo.setKindergartenId(kindergartenId);
		        diseaselogvo.setKindergartenCity(kindergartenCity);
		        diseaselogvo.setKindergartenGu(kindergartenGu);
		        diseaselogvo.setDiseaseId(diseaseIds[i]);
		        diseaselogvo.setChildId(childIds[i]);
		        diseaselogvo.setTotalPatient(i);
		        
		        
		        diseaselogService.insertDiseaseLog(diseaselogvo);
		    }
	    }
	    return "redirect:/teacher/mteacher_web_main";
	}
	
	
	
	/* -----------------------------웹 기능 : 김대영----------------------------- */
	/**
	 * 질병 통계화면으로 이동하기 전 사용자를 구분하기 위한 메서드입니다.
	 * 
	 * @param session 세션정보를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @return 접속을 시도한 사용자에 따라 화면을 반환합니다.
	 */
	@RequestMapping("/diseaselog/check")
	public String checkUser(HttpSession session, Model model) {
		
		// 1. 해당 페이지 접속 시도하는 사용자가 시스템 관리자인지, 원장인지 구분
		String adminLevel = (String) session.getAttribute("adminLevel");
		
		if(adminLevel.equals("admin")) {
			return "redirect:/diseaselog/chart";
		}else {
			// 접속 시도 사용자가 원장이라면
			String stat = (String) session.getAttribute("kindergartenStat");
			
			// 어린이집이 등록 된 원장인지, 아닌지 구분
			if(stat != null) {
				// stat이 null이 아니라면 Y=등록이 끝났거나, N=승인 대기중인 경우
				if(stat.equals("Y")) {
					return "redirect:/diseaselog/chart";
				}else {
					return "redirect:/kindergarten/check";					
				}
			}else {
				return "redirect:/kindergarten/check";
			}
		}
	}
		
	/**
	 * 질병 통계 화면 이동을 위한 메서드입니다.
	 * 
	 * @param session 세션정보를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @return 질병 통계 화면을 반환합니다.
	 */
	@RequestMapping("/diseaselog/chart")
	public String selectDiseaselog(HttpSession session, Model model) {
		
		List<DiseaselogVO> diseaselogVO = diseaselogService.countChildGuList();
		
		for (DiseaselogVO e : diseaselogVO) {
            
            String gu="";
            int count=0;
            
            switch (e.getKindergartenGu()) {
            	case "강남구":
            		gu="gangnam";
            		count=e.getTotalPatient();
            		
            		model.addAttribute("gangnamGu",gu);
            		model.addAttribute("gangnamCount",count);
            
            		break;
            	case "강동구":
            		gu="gangdong";
            		count=e.getTotalPatient();
            		
            		model.addAttribute("gangdongGu",gu);
            		model.addAttribute("gangdongCount",count);
            		
            		break;
            	case "강북구":
            		gu="gangbuk";
            		count=e.getTotalPatient();
            		
            		model.addAttribute("gangbukGu",gu);
            		model.addAttribute("gangbukCount",count);
            		
            		break;
            	case "강서구":
            		gu="gangseo";
            		count=e.getTotalPatient();
            		
            		model.addAttribute("gangseoGu",gu);
            		model.addAttribute("gangseoCount",count);
            		
            		break;
            	case "관악구":
            		gu="gwanak";
            		count=e.getTotalPatient();
            		
            		model.addAttribute("gwanakGu",gu);
            		model.addAttribute("gwanakCount",count);
            		
            		break;
            	case "광진구":
            		gu="gwangjin";
            		count=e.getTotalPatient();
            		
            		model.addAttribute("gwangjinGu",gu);
            		model.addAttribute("gwangjinCount",count);
            		
            		break;
            	case "구로구":
            		gu="guro";
            		count=e.getTotalPatient();
            		
            		model.addAttribute("guroGu",gu);
            		model.addAttribute("guroCount",count);
            		
            		break;
            	case "금천구":
            		gu="geumcheon";
            		count=e.getTotalPatient();
            		
            		model.addAttribute("geumcheonGu",gu);
            		model.addAttribute("geumcheonCount",count);
            		
            		break;
            	case "노원구":
            		gu="nowon";
            		count=e.getTotalPatient();
            		
            		model.addAttribute("nowonGu",gu);
            		model.addAttribute("nowonCount",count);
            		
            		break;
            	case "도봉구":
            		gu="dobong";
            		count=e.getTotalPatient();
            		
            		model.addAttribute("dobongGu",gu);
            		model.addAttribute("dobongCount",count);
            		
            		break;
            	case "동대문구":
            		gu="ddm";
            		count=e.getTotalPatient();
            		
            		model.addAttribute("ddmGu",gu);
            		model.addAttribute("ddmCount",count);
            		
            		break;
            	case "동작구":
            		gu="dongjak";
            		count=e.getTotalPatient();
            		
            		model.addAttribute("dongjakGu",gu);
            		model.addAttribute("dongjakCount",count);
            		
            		break;
            	case "마포구":
            		gu="mapo";
            		count=e.getTotalPatient();
            		
            		model.addAttribute("mapoGu",gu);
            		model.addAttribute("mapoCount",count);
            		
            		break;
            	case "서대문구":
            		gu="sdm";
            		count=e.getTotalPatient();
            		
            		model.addAttribute("sdmGu",gu);
            		model.addAttribute("sdmCount",count);
            		
            		break;
            	case "서초구":
            		gu="seocho";
            		count=e.getTotalPatient();
            		
            		model.addAttribute("seochoGu",gu);
            		model.addAttribute("seochoCount",count);
            		
            		break;
            	case "성동구":
            		gu="seongdong";
            		count=e.getTotalPatient();
            		
            		model.addAttribute("seongdongGu",gu);
            		model.addAttribute("seongdongCount",count);
            		
            		break;
            	case "성북구":
            		gu="seongbuk";
            		count=e.getTotalPatient();
            		
            		model.addAttribute("seongbukGu",gu);
            		model.addAttribute("seongbukCount",count);
            		
            		break;
            	case "송파구":
            		gu="songpa";
            		count=e.getTotalPatient();
            		
            		model.addAttribute("songpaGu",gu);
            		model.addAttribute("songpaCount",count);
            		
            		break;
            	case "양천구":
            		gu="yangcheon";
            		count=e.getTotalPatient();
            		
            		model.addAttribute("yangcheonGu",gu);
            		model.addAttribute("yangcheonCount",count);
            		
            		break;
            	case "영등포구":
            		gu="yeongdeungpo";
            		count=e.getTotalPatient();
            		
            		model.addAttribute("yeongdeungpoGu",gu);
            		model.addAttribute("yeongdeungpoCount",count);
            		
            		break;
            	case "용산구":
            		gu="yongsan";
            		count=e.getTotalPatient();
            		
            		model.addAttribute("yongsanGu",gu);
            		model.addAttribute("yongsanCount",count);
            		
            		break;
            	case "은평구":
            		gu="eunpyeong";
            		count=e.getTotalPatient();
            		
            		model.addAttribute("eunpyeongGu",gu);
            		model.addAttribute("eunpyeongCount",count);
            		
            		break;
            	case "종로구":
            		gu="jongno";
            		count=e.getTotalPatient();
            		
            		model.addAttribute("jongnoGu",gu);
            		model.addAttribute("jongnoCount",count);
            		
            		break;
            	case "중구":
            		gu="jung";
            		count=e.getTotalPatient();
            		
            		model.addAttribute("jungGu",gu);
            		model.addAttribute("jungCount",count);
            		
            		break;
            	case "중랑구":
            		gu="jungnang";
            		count=e.getTotalPatient();
            		
            		model.addAttribute("jungnangGu",gu);
            		model.addAttribute("jungnangCount",count);
            		
            		break;
            }
            
        }
		model.addAttribute("diseaselogVO",diseaselogService.countChildGuList());
		return "/admin/diseasechart";
	}
	
	/**
	 * 질병 통계정보를 그래프에 나타내기 위해 JSON객체로 반환하여 전달하기 위한 메서드입니다.
	 * 
	 * @param gu 구 이름을 입력합니다.
	 * @return JSON객체에 담긴 데이터를 반환합니다.
	 */
	@RequestMapping(value="/diseaselog/chart/json/{gu}")
	public @ResponseBody JSONObject getJSONMemberDiseaseList(@PathVariable String gu) {
		
		String temp = "";
		if(gu.equals("seongdong")) {
			temp="성동구";
		}else if(gu.equals("gangseo")) {
			temp="강서구";
		}else if(gu.equals("yangcheon")) {
			temp="양천구";
		}else if(gu.equals("guro")) {
			temp="구로구";
		}else if(gu.equals("geumcheon")) {
			temp="금천구";
		}else if(gu.equals("gwanak")) {
			temp="관악구";
		}else if(gu.equals("dongjak")) {
			temp="동작구";
		}else if(gu.equals("seocho")) {
			temp="서초구";
		}else if(gu.equals("gangnam")) {
			temp="강남구";
		}else if(gu.equals("songpa")) {
			temp="송파구";
		}else if(gu.equals("gangdong")) {
			temp="강동구";
		}else if(gu.equals("eunpyeong")) {
			temp="은평구";
		}else if(gu.equals("yeongdeungpo")) {
			temp="영등포구";
		}else if(gu.equals("jungnang")) {
			temp="중랑구";
		}else if(gu.equals("nowon")) {
			temp="노원구";
		}else if(gu.equals("dobong")) {
			temp="도봉구";
		}else if(gu.equals("gangbuk")) {
			temp="강북구";
		}else if(gu.equals("jongno")) {
			temp="종로구";
		}else if(gu.equals("sdm")) {
			temp="서대문구";
		}else if(gu.equals("mapo")) {
			temp="마포구";
		}else if(gu.equals("yongsan")) {
			temp="용산구";
		}else if(gu.equals("jung")) {
			temp="중구";
		}else if(gu.equals("seongbuk")) {
			temp="성북구";
		}else if(gu.equals("ddm")) {
			temp="동대문구";
		}else if(gu.equals("gwangjin")) {
			temp="광진구";
		}
		
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
