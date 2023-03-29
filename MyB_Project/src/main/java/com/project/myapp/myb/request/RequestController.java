package com.project.myapp.myb.request;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.myapp.myb.child.ChildVO;
import com.project.myapp.myb.child.IChildService;
import com.project.myapp.myb.classroom.IClassroomService;
import com.project.myapp.myb.parent.IParentRepository;
import com.project.myapp.myb.parent.ParentVO;

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

	// 요청하기 폼으로 이동 (0328 문수지)
	@RequestMapping(value="/parent/mparent_request", method=RequestMethod.GET)
	public String requestForm(HttpSession session, Model model) {
		String parentEmail = (String) session.getAttribute("parentEmail");
		List<ChildVO> childList = childService.selectAllChildList(parentEmail);
		model.addAttribute("childList", childList);
		
		return "parent/mparent_request";
	}

	// 요청하기 (0328 문수지)
	@RequestMapping(value="/parent/mparent_request", method=RequestMethod.POST)
	public String request(RequestVO request) {
		requestService.insertRequest(request);
		return "parent/mparent_request";
	}
	
	// (0329 합침 일형추가)
	@RequestMapping(value="/teacher/mteacher_requset_list/{teacherId}")
	public String getRequestList(@PathVariable int teacherId, Model model) {
		
		List<ParentVO> getParentName = parentRepository.getParentName(teacherId);
		model.addAttribute("getParentName", getParentName);
		
		List<RequestVO> getRequestIdList = requestService.getRequestIdList(teacherId);
		model.addAttribute("getRequestIdList", getRequestIdList);
			
		return "/teacher/mteacher_requset_list";
	}

	// (0329 합침 일형추가)
	@RequestMapping(value="/teacher/mteacher_requset_check/{requestId}")
	public String getCheckDetail(@PathVariable int requestId, Model model) {
		
		RequestVO getCheckDetail = requestService.getCheckDetail(requestId);
		model.addAttribute("getCheckDetail", getCheckDetail);
		
		return "/teacher/mteacher_requset_check";
	}
}
