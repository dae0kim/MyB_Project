package com.project.myapp.myb.request;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.myapp.myb.child.ChildVO;
import com.project.myapp.myb.child.IChildService;
import com.project.myapp.myb.classroom.IClassroomService;
import com.project.myapp.myb.parent.IParentRepository;
import com.project.myapp.myb.parent.ParentVO;
import com.project.myapp.myb.request.RequestVO;
import com.project.myapp.myb.teacher.TeacherVO;

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

	// 요청하기 폼으로 이동 (0328 문수지)
	@RequestMapping(value = "/parent/mparent_request", method = RequestMethod.GET)
	public String requestForm(HttpSession session, Model model) {
		String parentEmail = (String) session.getAttribute("parentEmail");
		List<ChildVO> childList = childService.selectAllChildList(parentEmail);
		model.addAttribute("childList", childList);

		return "parent/mparent_request";
	}

	// 요청하기 (0328 문수지)
	@RequestMapping(value = "/parent/mparent_request", method = RequestMethod.POST)
	public String request(RequestVO request) {
		requestService.insertRequest(request);
		return "parent/mparent_request";
	}

	// 요청확인 폼으로 이동 (0330 문수지)
	@RequestMapping(value = "/parent/mparent_request_check", method = RequestMethod.GET)
	public String requestCheckForm(HttpSession session, Model model) {
		String parentEmail = (String) session.getAttribute("parentEmail");
		List<ChildVO> childList = childService.selectAllChildList(parentEmail);
		model.addAttribute("childList", childList);

		return "parent/mparent_request_check";
	}

	// 요청확인 (0330 문수지)
	@RequestMapping(value = "/parent/mparent_request_check", method = RequestMethod.POST)
	public String requestCheck(@Param("childId") int childId, @Param("requestDate") String requestDate, Model model,
			RedirectAttributes redirectAttributes) {

		RequestVO request = requestService.selectRequest(childId, requestDate);
		if (request == null) {
			// 예외 처리
		}
		redirectAttributes.addFlashAttribute("requestVO", request);
		return "redirect:/parent/mparent_request_check";
	}

	// 자녀선택 시 필요한 정보 불러오기 (0329 문수지)
	@RequestMapping(value = "/parent/childIdChk", method = RequestMethod.POST)
	@ResponseBody
	public ChildVO childIdChk(@Param(value = "childId") int childId) throws Exception {
		ChildVO child = childService.selectChildById(childId);
		return child;
	}

	// (0329 합침 일형추가)
	@RequestMapping(value = "/teacher/mteacher_requset_list/{teacherId}")
	public String getRequestList(@PathVariable int teacherId, Model model) {

		List<ParentVO> getParentName = parentRepository.getParentName(teacherId);
		model.addAttribute("getParentName", getParentName);

		return "/teacher/mteacher_requset_list";
	}

	// (0329 합침 일형추가)
	@RequestMapping(value = "/teacher/mteacher_requset_check/{requestId}")
	public String getCheckDetail(@PathVariable int requestId, Model model) {
		RequestVO getCheckDetail = requestService.getCheckDetail(requestId);
		model.addAttribute("getCheckDetail", getCheckDetail);
		model.addAttribute("requestId", requestId);

		return "/teacher/mteacher_requset_check";
	}

	@RequestMapping(value = "/teacher/mteacher_requset_check", method = RequestMethod.POST)
	public String updateRequest(RequestVO requestvo, Model model, HttpSession session) {

		if (requestvo.getRequestStat1() == null) {
			requestvo.setRequestStat1("N");
		} else {
			requestvo.setRequestStat1("Y");
		}

		if (requestvo.getRequestStat2() == null) {
			requestvo.setRequestStat2("N");
		} else {
			requestvo.setRequestStat2("Y");
		}

		if (requestvo.getRequestStat3() == null) {
			requestvo.setRequestStat3("N");
		} else {
			requestvo.setRequestStat3("Y");
		}

		if (requestvo.getRequestStat4() == null) {
			requestvo.setRequestStat4("N");
		} else {
			requestvo.setRequestStat4("Y");
		}

		if (requestvo.getRequestStat5() == null) {
			requestvo.setRequestStat5("N");
		} else {
			requestvo.setRequestStat5("Y");
		}

		model.addAttribute("requestvo", requestvo);
		System.out.println("requestvo : " + requestvo);

		requestRepository.updateRequest(requestvo);

		int teacherId = ((Integer) session.getAttribute("teacherId")).intValue();

		return "redirect:/teacher/mteacher_requset_list/" + teacherId;
	}

}
