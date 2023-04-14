package com.project.myapp.myb.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.myapp.myb.classroom.ClassroomVO;
import com.project.myapp.myb.classroom.IClassroomService;
import com.project.myapp.myb.kindergarten.IKindergartenService;
import com.project.myapp.myb.kindergarten.KindergartenVO;
import com.project.myapp.myb.uploadfile.UploadFileVO;

/**
 * 어린이집과 관련된 기능을 담는 컨트롤러클래스입니다.
 * 
 * @author 문수지,손일형,김대영
 * @since 2023.04.04
 *
 */
@Controller
public class KindergartenController {

	@Autowired
	IKindergartenService kindergartenService;

	@Autowired
	IClassroomService classroomService;

	/**
	 * 자녀정보 등록 시 어린이집 검색 페이지 이동을 위한 메서드입니다.
	 * 
	 * @return 어린이집 검색 페이지를 반환합니다.
	 */
	@RequestMapping(value = "/parent/mparent_select_kinder", method = RequestMethod.GET)
	public String kindergartenSearchForm() {
		return "parent/mparent_select_kinder";
	}

	/**
	 * 어린이집 검색을 위한 메서드입니다.
	 * 
	 * @param kindergartenNameKeyword 검색 키워드를 입력합니다.
	 * @param kindergartenCity 어린이집 주소 시를 입력합니다.
	 * @param kindergartenGu 어린이집 주소 구를 입력합니다.
	 * @param session 세션정보를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @return 검색 결과가 출력되는 페이지를 반환합니다.
	 */
	@RequestMapping(value = "/parent/mparent_select_kinder", method = RequestMethod.POST)
	public String kindergartenSearch(@RequestParam(required = false, defaultValue = "") String kindergartenNameKeyword,
			@Param(value = "kindergartenCity") String kindergartenCity,
			@Param(value = "kindergartenGu") String kindergartenGu, HttpSession session, Model model) {
		try {
			List<KindergartenVO> kindergartenList = kindergartenService.searchListByNameKeyword(kindergartenNameKeyword,
					kindergartenCity, kindergartenGu);
			model.addAttribute("kindergartenList", kindergartenList);
			model.addAttribute("kindergartenNameKeyword", kindergartenNameKeyword);
			model.addAttribute("kindergartenCity", kindergartenCity);
			model.addAttribute("kindergartenGu", kindergartenGu);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "parent/mparent_select_kinder";
	}

	/* -----------------------------웹 기능 : 김대영----------------------------- */
	/**
	 * 어린이집 등록 상태 확인 페이지 이동을 위한 메서드입니다.
	 * 
	 * @return 어린이집 등록 확인 화면을 반환합니다.
	 */
	@RequestMapping(value="/kindergarten/check", method=RequestMethod.GET)
	public String kindergartenCheck() {		
		return "/principal/kindergarten/kindergartencheck";			
	}

	/**
	 * 어린이집 등록 페이지 이동을 위한 메서드입니다.
	 * 
	 * @param session 세션정보를 입력합니다.
	 * @param request 요청정보를 입력합니다.
	 * @return 어린이집 등록 화면을 반환합니다.
	 */
	@RequestMapping(value="/kindergarten/form", method=RequestMethod.GET)
	public String kindergartenForm(HttpSession session, HttpServletRequest request) {		
		return "/principal/kindergarten/kindergarteninsertform";
	}
	
	/**
	 * 어린이집 등록 양식 제출을 위한 메서드입니다.
	 * 
	 * @param kindergartenVO 어린이집 정보가 담긴 객체를 입력합니다.
	 * @param results BindingResult객체를 입력합니다.
	 * @param redirectAttrs RedirectAttributes객체를 입력합니다. 
	 * @param session 세션정보를 입력합니다.
	 * @param request 요청정보를 입력합니다.
	 * @return 어린이집 등록 확인을 위한 화면을 반환합니다.
	 */
	@RequestMapping(value="/kindergarten/insert", method=RequestMethod.POST)
	public String kindergartenInsert(KindergartenVO kindergartenVO, BindingResult results, 
			RedirectAttributes redirectAttrs,HttpSession session, HttpServletRequest request) {
		
		try{
			MultipartFile mfile = kindergartenVO.getFile();
			if(mfile!=null && !mfile.isEmpty()) {
				UploadFileVO file = new UploadFileVO();
				file.setFileName(mfile.getOriginalFilename());
				file.setFileSize(mfile.getSize());
				file.setFileType(mfile.getContentType());
				file.setFileData(mfile.getBytes());
				kindergartenService.insertKindergarten(kindergartenVO, file);
				
				session.setAttribute("kindergartenStat", "N");
				
			}else {
				kindergartenService.insertKindergarten(kindergartenVO);
			}
		}catch(Exception e){
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message", e.getMessage());
		}
		session.setAttribute("kindergartenId", kindergartenVO.getKindergartenId());
		return "/principal/kindergarten/kindergartencheck";
	}

	/**
	 * 등록된 증명서류를 가져오기 위한 메서드입니다.
	 * 
	 * @param fileId 파일 식별번호를 입력합니다.
	 * @return 파일 데이터를 반환합니다.
	 */
	@RequestMapping("/file/{fileId}")
	public ResponseEntity<byte[]> getFile(@PathVariable int fileId) {
		UploadFileVO file = kindergartenService.getFile(fileId);
		final HttpHeaders headers = new HttpHeaders();
		String[] mtypes = file.getFileType().split("/");
		headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
		headers.setContentLength(file.getFileSize());
		try {
			String encodedFileName = URLEncoder.encode(file.getFileName(), "UTF-8");
			headers.setContentDispositionFormData("attachment", encodedFileName);
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e);
		}
		return new ResponseEntity<byte[]>(file.getFileData(), headers, HttpStatus.OK);
	}
	
	
	/**
	 * 어린이집 등록 요청 목록 리스트 출력을 위한 메서드입니다.
	 * 
	 * @param session 세션정보를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @return 어린이집 등록 요청목록 화면을 반환합니다.
	 */
	@RequestMapping("/kindergarten/request/list")
	public String getKindergartenList(HttpSession session, Model model) {
		List<KindergartenVO> kindergartenList = kindergartenService.selectKindergartenList();
		model.addAttribute("kindergartenList", kindergartenList);
		return "admin/kindergartenlist";
	}
	
	/**
	 * 어린이집 등록 요청 상세정보 조회를 위한 메서드입니다.
	 * 
	 * @param kindergartenId 어린이집 식별번호를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @return 어린이집 등록요청 상세정보 화면을 반환합니다.
	 */
	@RequestMapping("/kindergarten/info/{kindergartenId}")
	public String getKindergartenDetails(@PathVariable int kindergartenId,Model model) {
		KindergartenVO kindergartenVO = kindergartenService.selectKindergartenInfo(kindergartenId);
		model.addAttribute("kindergartenVO", kindergartenVO);
		return "admin/kindergarteninfo";
	}
	
	/**
	 * 어린이집 등록 승인을 위한 메서드입니다.
	 *  
	 * @param kindergartenId 어린이집 식별번호를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @return 어린이집 등록요청 상세정보 화면 이동 요청을 반환합니다.
	 */
	@RequestMapping(value="/kindergarten/approve/{kindergartenId}") 
	public String updateKindergartenStatus(@PathVariable int kindergartenId, Model model) { 
		kindergartenService.updateKindergartenApprove(kindergartenId); 
		return "redirect:/kindergarten/info/{kindergartenId}"; 
	}
	
	/**
	 * 어린이집 등록 거절을 위한 메서드입니다.
	 * 
	 * @param kindergartenId 어린이집 식별번호를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @return 어린이집 등록 요청목록 화면으로 이동하라는 요청을 반환합니다. 
	 */
	@RequestMapping(value="/kindergarten/disapprove/{kindergartenId}") 
	public String deleteKindergartenStatus(@PathVariable int kindergartenId, Model model) { 
		kindergartenService.deleteKindergartenDisapprove(kindergartenId); 
		return "redirect:/kindergarten/request/list"; 
	}
	
	/**
	 * 어린이집 통계 첫 화면 이동을 위한 메서드입니다.
	 * 
	 * @param adminId 사용자 식별번호를 입력받습니다.
	 * @param session 세션정보를 입력받습니다.
	 * @param model 모델객체를 입력받습니다.
	 * @return 사용자 상태에 따라 맞는 화면을 반환합니다.
	 */
	@RequestMapping("/kindergarten/chart/{adminId}")
	public String selectKindergartenChart(@PathVariable int adminId,HttpSession session, Model model) {
		
		String stat = (String) session.getAttribute("kindergartenStat");
		
		if(stat != null) {
			if(stat.equals("Y")) {
				List<ClassroomVO> classroomNameList = classroomService.getClassroomNameList(adminId);
				model.addAttribute("classroomNameList", classroomNameList);
				return "/principal/kindergarten/kindergartenchart";			
			}
		}else {
			return "redirect:/kindergarten/check";
		}
		return "redirect:/kindergarten/check";
	}
	
	/**
	 * 어린이집 통계 첫 화면의 각 반별 결원 현황 데이터를 JSON객체로 변환하여 그래프에 출력하기 위한 메서드입니다.
	 * 
	 * @param kindergartenId 어린이집 식별번호를 입력합니다.
	 * @return JSON객체 데이터를 반환합니다.
	 */
	@RequestMapping(value="/kindergarten/chart/json/{kindergartenId}")
	public @ResponseBody JSONObject getJSONAbsentList(@PathVariable int kindergartenId) {
		
		// 총 인원 데이터 전달
		List<Map<String, Object>> maplist = kindergartenService.countStudentList(kindergartenId);
		
		// 결석인원 데이터 전달
		List<Map<String, Object>> maplist2 = kindergartenService.countAbsentList(kindergartenId);

		// 출석인원 데이터 전달
		List<Map<String, Object>> maplist3 = kindergartenService.countAttendanceList(kindergartenId);
		
		
		JSONObject data = new JSONObject();
		JSONObject ajaxObjCols1 = new JSONObject();    //cols의 1번째 object를 담을 JSONObject
		JSONObject ajaxObjCols2 = new JSONObject();    //cols의 2번째 object를 담을 JSONObject - 총원
		JSONObject ajaxObjCols3 = new JSONObject();    //cols의 3번째 object를 담을 JSONObject - 결원
		JSONObject ajaxObjCols4 = new JSONObject();    //cols의 4번째 object를 담을 JSONObject
		
		
		JSONArray ajaxArryCols = new JSONArray();        //위의 N개의 JSONObject를 담을 JSONArray
	    JSONArray ajaxArryRows = new JSONArray();

		ajaxObjCols1.put("type", "string");
		ajaxObjCols1.put("label", "");
		
		ajaxObjCols2.put("type", "number");
		ajaxObjCols2.put("label", "총 인원");

		ajaxObjCols3.put("type", "number");
		ajaxObjCols3.put("label", "결석 인원");

		ajaxObjCols4.put("type", "number");
		ajaxObjCols4.put("label", "출석 인원");
		
		ajaxArryCols.add(ajaxObjCols1);
		ajaxArryCols.add(ajaxObjCols2);
		ajaxArryCols.add(ajaxObjCols3);
		ajaxArryCols.add(ajaxObjCols4);
		
				 
		for (int i=0; i<maplist.size(); i++){        //JSONArray의 size만큼 돌면서 형식을 만듭니다.
		    JSONObject legend = new JSONObject();
		    legend.put("v", maplist.get(i).get("CLASSROOMNAME"));
		    legend.put("f", null);
		    
		    JSONObject value = new JSONObject();
		    value.put("v", maplist.get(i).get("TOTALSTUDENT"));
		    value.put("f", null);

		    JSONObject value2 = new JSONObject();
		    value2.put("v", maplist2.get(i).get("TOTALPATIENT"));
		    value2.put("f", null);

		    JSONObject value3 = new JSONObject();
		    value3.put("v", maplist3.get(i).get("TOTALATTENDANCE"));
		    value3.put("f", null);
		    	    
		 
		    JSONArray cValueArry = new JSONArray();
		    cValueArry.add(legend);
		    cValueArry.add(value);
		    cValueArry.add(value2);
		    cValueArry.add(value3);
		 
		    JSONObject cValueObj = new JSONObject();
		    cValueObj.put("c", cValueArry);
		    
		    ajaxArryRows.add(cValueObj);
		}

		data.put("cols", ajaxArryCols);
		data.put("rows", ajaxArryRows);	
		
		return data;
	}

	/**
	 * 어린이집 각 반의 질병별 환자수 데이터를 JSON객체로 변환하여 그래프에 출력하기 위한 메서드입니다.
	 * @param classroomId 반 식별번호를 입력합니다.
	 * @return JSON객체 데이터를 반환합니다.
	 */
	@RequestMapping(value="/kindergarten/classroom/chart/json/{classroomId}")
	public @ResponseBody JSONObject getJSONClassroomDiseaseList(@PathVariable int classroomId) {
				
		// 총 인원 데이터 전달
		List<Map<String, Object>> maplist = kindergartenService.countClassroomDiseaseList(classroomId);
			
		JSONObject data = new JSONObject();
		JSONObject ajaxObjCols1 = new JSONObject();    //cols의 1번째 object를 담을 JSONObject
		JSONObject ajaxObjCols2 = new JSONObject();    //cols의 2번째 object를 담을 JSONObject
		
		
		JSONArray ajaxArryCols = new JSONArray();        //위의 N개의 JSONObject를 담을 JSONArray
		JSONArray ajaxArryRows = new JSONArray();
		
		ajaxObjCols1.put("type", "string");
		ajaxObjCols1.put("label", "각 반별 출결 현황");
		
		ajaxObjCols2.put("type", "number");
		ajaxObjCols2.put("label", "총 인원");
		
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
