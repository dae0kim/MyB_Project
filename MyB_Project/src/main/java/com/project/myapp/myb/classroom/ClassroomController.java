package com.project.myapp.myb.classroom;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ClassroomController {
	
	@Autowired
	IClassroomService classroomService;
	
	// 반 등록 상태 확인을 위한 페이지 이동
	@RequestMapping(value="/classroom/check", method=RequestMethod.GET)
	public String classroomCheck(Model model,HttpSession session, HttpServletRequest request) {
		int kindergartenId = ((Integer)session.getAttribute("kindergartenId")).intValue();
		int classroomCount = classroomService.getClassroomCount(kindergartenId);
		model.addAttribute("classroomCount", classroomCount);
		return "/principal/classroom/classroomcheck";			
	}
	
	// 반 이름 목록 페이지 이동
	@RequestMapping(value="/classroom/namelist/{adminId}")
	public String getAllClassroomName(@PathVariable int adminId,Model model,HttpSession session, HttpServletRequest request) {
		
		String stat = (String) session.getAttribute("kindergartenStat");
		
		if(stat != null) {
			if(stat.equals("Y")) {
				List<ClassroomVO> classroomNameList = classroomService.getClassroomNameList(adminId);
				model.addAttribute("classroomNameList", classroomNameList);
				return "/principal/classroom/classroomlist";			
			}
		}else {
			return "redirect:/kindergarten/check";
		}
		return "redirect:/kindergarten/check";
		
	}

	// 반 상세정보 조회
	@RequestMapping(value="/classroom/info/{classroomId}")
	public String getClassroomInfo(@PathVariable int classroomId,Model model,HttpSession session, HttpServletRequest request) {
		
		ClassroomListVO classroomInfo = classroomService.getClassroomInfo(classroomId);
		String classroomName = classroomService.getClassroomName(classroomId);
		
		int adminId = ((Integer)session.getAttribute("adminId")).intValue();
		
		ClassroomSeqVO classroomSeqVO = new ClassroomSeqVO();
		classroomSeqVO.setAdminId(adminId);
		classroomSeqVO.setClassroomName(classroomName);
		int classroomSeq = classroomService.getClassroomSeq(classroomSeqVO);
		
		model.addAttribute("classroomInfo", classroomInfo);
		model.addAttribute("classroomName",classroomName);
		model.addAttribute("classroomSeq",classroomSeq);
		return "/principal/classroom/classroominfo";				
	}
	
	// 반 등록 페이지 이동
	@RequestMapping(value="/classroom/insert", method=RequestMethod.GET)
	public String insertClassroom() {
		return "/principal/classroom/classroominsertform";
	}
	
	// 반 정보 등록
	@RequestMapping(value="/classroom/insert", method=RequestMethod.POST)
	public String insertClassroom(ClassroomVO classroomVO,HttpSession session, HttpServletRequest request) {
		classroomService.insertClassroom(classroomVO);
		
		int adminId = ((Integer)session.getAttribute("adminId")).intValue();
		
		return "redirect:/classroom/namelist/"+adminId;
	}
	
	// 반 정보(이름) 수정 페이지로 이동
	@RequestMapping(value="/classroom/update/{classroomSeq}", method=RequestMethod.GET)
	public String updateClassroom(@PathVariable int classroomSeq,Model model,HttpSession session, HttpServletRequest request) {
		
		ClassroomListVO classroomInfo = classroomService.getClassroomInfo(classroomSeq);
		String classroomName = classroomService.getClassroomName(classroomSeq);

		model.addAttribute("classroomInfo", classroomInfo);
		model.addAttribute("classroomName",classroomName);
		model.addAttribute("classroomSeq",classroomSeq);
		return "/principal/classroom/classroomupdate";				
	}
	
	
	// 반 정보(이름) 수정
	@RequestMapping(value="/classroom/update", method=RequestMethod.POST)
	public String updateClassroom(ClassroomVO classroom,HttpSession session, HttpServletRequest request) {
		classroomService.updateClassroom(classroom);	
		return "redirect:/classroom/info/"+classroom.getClassroomId();
	}
	
	
}
