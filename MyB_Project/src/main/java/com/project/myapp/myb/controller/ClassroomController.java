package com.project.myapp.myb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.myapp.myb.classroom.ClassroomListVO;
import com.project.myapp.myb.classroom.ClassroomSeqVO;
import com.project.myapp.myb.classroom.ClassroomVO;
import com.project.myapp.myb.classroom.IClassroomService;

/**
 * 반과 관련된 기능을 담는 컨트롤러클래스입니다.
 * 
 * @author 김대영
 * @since 2023.04.04
 *
 */
@Controller
public class ClassroomController {
	
	@Autowired
	IClassroomService classroomService;
	
	/* -----------------------------웹 기능 : 김대영----------------------------- */
	/**
	 * 반 등록 상태 확인을 위한 메서드입니다.
	 * 
	 * @param model 모델객체를 입력합니다.
	 * @param session 세션정보를 입력합니다.
	 * @param request 요청정보를 입력합니다.
	 * @return 반 등록이 되었는지 확인하는 페이지를 반환합니다.
	 */
	@RequestMapping(value="/classroom/check", method=RequestMethod.GET)
	public String classroomCheck(Model model,HttpSession session, HttpServletRequest request) {
		int kindergartenId = ((Integer)session.getAttribute("kindergartenId")).intValue();
		int classroomCount = classroomService.getClassroomCount(kindergartenId);
		model.addAttribute("classroomCount", classroomCount);
		return "/principal/classroom/classroomcheck";			
	}
	
	/**
	 * 반 이름 목록 출력을 위한 메서드입니다.
	 * 
	 * @param adminId 사용자 식별번호를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @param session 세션정보를 입력합니다.
	 * @param request 요청정보를 입력합니다.
	 * @return 어린이집 등록이 완료된 사용자라면 반 목록을 보여주는 페이지를, 아니라면 어린이집 등록 여부를 확인하는 페이지를 반환합니다.
	 */
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

	/**
	 * 반 상세정보 조회를 위한 메서드입니다. 
	 * 
	 * @param classroomId 반 식별번호를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @param session 세션정보를 입력합니다.
	 * @param request 요청정보를 입력합니다.
	 * @return 반 상세정보 페이지를 반환합니다.
	 */
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
	
	/**
	 * 반 등록 페이지 이동을 위한 메서드입니다.
	 * 
	 * @return 반 등록 페이지를 반환합니다.
	 */
	@RequestMapping(value="/classroom/insert", method=RequestMethod.GET)
	public String insertClassroom() {
		return "/principal/classroom/classroominsertform";
	}
	
	/**
	 * 반 정보 등록을 위한 메서드입니다.
	 * 
	 * @param classroomVO 반 정보를 담은 객체를 입력합니다.
	 * @param session 세션정보를 입력합니다.
	 * @param request 요청정보를 입력합니다.
	 * @return 반 목록으로 이동하라는 요청을 반환합니다.
	 */
	@RequestMapping(value="/classroom/insert", method=RequestMethod.POST)
	public String insertClassroom(ClassroomVO classroomVO,HttpSession session, HttpServletRequest request) {
		classroomService.insertClassroom(classroomVO);
		
		int adminId = ((Integer)session.getAttribute("adminId")).intValue();
		
		return "redirect:/classroom/namelist/"+adminId;
	}
	
	/**
	 * 반 정보 수정 페이지 이동을 위한 메서드입니다.
	 * 
	 * @param classroomSeq 반 식별번호를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @param session 세션정보를 입력합니다.
	 * @param request 요청정보를 입력합니다.
	 * @return 반 정보 수정 페이지를 반환합니다.
	 */
	@RequestMapping(value="/classroom/update/{classroomSeq}", method=RequestMethod.GET)
	public String updateClassroom(@PathVariable int classroomSeq,Model model,HttpSession session, HttpServletRequest request) {
		
		ClassroomListVO classroomInfo = classroomService.getClassroomInfo(classroomSeq);
		String classroomName = classroomService.getClassroomName(classroomSeq);

		model.addAttribute("classroomInfo", classroomInfo);
		model.addAttribute("classroomName",classroomName);
		model.addAttribute("classroomSeq",classroomSeq);
		return "/principal/classroom/classroomupdate";				
	}
	
	
	/**
	 * 반 정보 수정사항 반영을 위한 메서드입니다.
	 * 
	 * @param classroom 수정된 반 정보를 담은 객체를 입력합니다.
	 * @param session 세션정보를 입력합니다.
	 * @param request 요청정보를 입력합니다.
	 * @return 반 상세정보 페이지로 이동하라는 요청을 반환합니다.
	 */
	@RequestMapping(value="/classroom/update", method=RequestMethod.POST)
	public String updateClassroom(ClassroomVO classroom,HttpSession session, HttpServletRequest request) {
		classroomService.updateClassroom(classroom);	
		return "redirect:/classroom/info/"+classroom.getClassroomId();
	}
	
	
}
