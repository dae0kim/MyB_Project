package com.project.myapp.myb.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.myapp.myb.alarm.IAlarmService;
import com.project.myapp.myb.child.ChildVO;
import com.project.myapp.myb.child.IChildService;
import com.project.myapp.myb.classroom.IClassroomService;
import com.project.myapp.myb.parent.IParentRepository;
import com.project.myapp.myb.parent.ParentVO;
import com.project.myapp.myb.request.IRequestRepository;
import com.project.myapp.myb.request.IRequestService;
import com.project.myapp.myb.request.RequestVO;

/**
 * 요청사항과 관련된 기능을 담는 컨트롤러
 * 
 * @author 손일형,문수지
 * @since 2023.04.04
 *
 */
@Controller
public class RequestController {

	@Autowired
	IRequestService requestService;

	@Autowired
	IChildService childService;

	@Autowired
	IClassroomService classroomService;

	@Autowired
	IParentRepository parentRepository;

	@Autowired
	IRequestRepository requestRepository;
	
	@Autowired
	IAlarmService alarmService;

	/**
	 * 요청하기 폼으로 이동하는 메서드입니다
	 * 
	 * @param session 세션정보를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @return 요청하기 화면을 반환합니다.
	 */
	@RequestMapping(value = "/parent/mparent_request", method = RequestMethod.GET)
	public String requestForm(HttpSession session, Model model) {
		String parentEmail = (String) session.getAttribute("parentEmail");
		List<ChildVO> childList = childService.selectAllChildList(parentEmail);
		model.addAttribute("childList", childList);

		return "parent/mparent_request";
	}

	/**
	 * 요청을 하는 메서드입니다.
	 * 
	 * @param request 요청내용을 입력합니다.
	 * @return 요청이 완료되면 메인화면으로 이동합니다.
	 */
	@RequestMapping(value = "/parent/mparent_request", method = RequestMethod.POST)
	public String request(RequestVO request) {
		requestService.insertRequest(request);
		return "parent/mparent_web_main";
	}

	/**
	 * 요청확인 폼으로 이동하는 메서드입니다.
	 * 
	 * @param session 세션정보를 입력합니다.
	 * @param model 모댈 객체를 입력합니다.
	 * @return 요청확인 페이지를 반환합니다.
	 */
	@RequestMapping(value = "/parent/mparent_request_check", method = RequestMethod.GET)
	public String requestCheckForm(HttpSession session, Model model) {
		String parentEmail = (String) session.getAttribute("parentEmail");
		List<ChildVO> childList = childService.selectAllChildList(parentEmail);
		model.addAttribute("childList", childList);

		return "parent/mparent_request_check";
	}

	/**
	 * 요청을 확인하는 메서드입니다.
	 * 
	 * @param childId 자녀 식별번호를 입력합니다.
	 * @param requestDate 요청날짜를 입력합니다.
	 * @param redirectAttributes 리다이렉트가 발생하기 전 모든 플래시 속성을 세션에 복사합니다.
	 * @return 요청확인을 반환합니다.
	 */
	@RequestMapping(value = "/parent/mparent_request_check", method = RequestMethod.POST)
	public String requestCheck(@Param("childId") int childId, @Param("requestDate") String requestDate,
			RedirectAttributes redirectAttributes) {

		RequestVO request = requestService.selectRequest(childId, requestDate);
		if (request == null) {
			// 예외 처리
		}
		redirectAttributes.addFlashAttribute("requestVO", request);
		return "redirect:/parent/mparent_request_check";
	}

	/**
	 * 자녀선택 시 필요한 정보를 불러오는 메서드입니다.
	 * 
	 * @param childId 자녀 식별번호를 입력합니다
	 * @return 식별번호에 맞는 childVO 형식으로 반환합니다
	 */
	@RequestMapping(value = "/parent/childIdChk", method = RequestMethod.POST)
	@ResponseBody
	public ChildVO childIdChk(@Param(value = "childId") int childId) throws Exception {
		ChildVO child = childService.selectChildById(childId);
		return child;
	}

	/**
	 * 요청사항 리스트를 불러오는 메서드입니다
	 * 
	 * @param teacherId 교사 식별번호를 입력합니다
	 * @param model 모델 객체를 입력합니다
	 * @return 요청 리스트를 반환합니다
	 */
	@RequestMapping(value = "/teacher/mteacher_requset_list/{teacherId}")
	public String getRequestList(@PathVariable int teacherId, Model model) {

		List<ParentVO> getParentId = parentRepository.getParentName(teacherId);
		model.addAttribute("getParentId", getParentId);

		return "/teacher/mteacher_requset_list";
	}

	/**
	 * 요청사항 상세페이지를 불러오는 메서드입니다.
	 * 
	 * @param requestId 요청 식별번호를 입력합니다.
	 * @param parentId 부모 식별번호를 입력합니다.
	 * @param model 모댈 객체를 입력합니다.
	 * @return 요청에 대한 상세를 반환합니다.
	 */
	@RequestMapping(value = "/teacher/mteacher_requset_check/{requestId}")
	public String getCheckDetail(@PathVariable int requestId, @Param(value = "parentId") int parentId, Model model) {	//(0401 수지 parmeter 추가)
		RequestVO getCheckDetail = requestService.getCheckDetail(requestId);
		model.addAttribute("getCheckDetail", getCheckDetail);
		model.addAttribute("requestId", requestId);
		
	    if (parentId != 0) {	//(0401 수지 추가)
	        model.addAttribute("parentId", parentId);
	    }

		return "/teacher/mteacher_requset_check";
	}

	/**
	 * 요청사항의 상태를 업데이트하는 메서드입니다.
	 * 
	 * @param requestvo 요청VO를 입력합니다.
	 * @param parentId 부모 식별번호를 입력합니다.
	 * @param model 모델 객체를 입력합니다. 
	 * @param session 세션 정보를 입력합니다.
	 * @return 요청사항 리스트 페이지를 반환합니다.
	 */
	@RequestMapping(value = "/teacher/mteacher_requset_check", method = RequestMethod.POST)
	public String updateRequest(RequestVO requestvo, @RequestParam("parentId") int parentId, @RequestParam("childId") int childId, Model model, HttpSession session) {	//(0401 수지 parameter 추가)

		String alarmMessage="요청사항이 답변되었습니다.";	//(0401 수지 추가) 알람 메세지 설정
		
		if (requestvo.getRequestStat1() == null) {
			requestvo.setRequestStat1("N");
		} else{
			requestvo.setRequestStat1("Y");
			alarmService.insertAlarm(parentId, alarmMessage, childId); //(0401 수지 추가) insertAlarm 실행 (DB에 알람 정보 생성)
		}

		if (requestvo.getRequestStat2() == null) {
			requestvo.setRequestStat2("N");
		} else {
			requestvo.setRequestStat2("Y");
			alarmService.insertAlarm(parentId, alarmMessage, childId);
		} 
		
		if (requestvo.getRequestStat3() == null) {
			requestvo.setRequestStat3("N");
		} else {
			requestvo.setRequestStat3("Y");
			alarmService.insertAlarm(parentId, alarmMessage, childId);
		}

		if (requestvo.getRequestStat4() == null) {
			requestvo.setRequestStat4("N");
		} else {
			requestvo.setRequestStat4("Y");
			alarmService.insertAlarm(parentId, alarmMessage, childId);
		}

		if (requestvo.getRequestStat5() == null) {
			requestvo.setRequestStat5("N");
		} else {
			requestvo.setRequestStat5("Y");
			alarmService.insertAlarm(parentId, alarmMessage, childId);
		}

		model.addAttribute("requestvo", requestvo);
		System.out.println("requestvo : " + requestvo);

		requestRepository.updateRequest(requestvo);

		int teacherId = ((Integer) session.getAttribute("teacherId")).intValue();

		return "redirect:/teacher/mteacher_requset_list/" + teacherId;
	}

}
