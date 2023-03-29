package com.project.myapp.myb.child;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.myapp.myb.classroom.ClassroomVO;
import com.project.myapp.myb.classroom.IClassroomService;
import com.project.myapp.myb.kindergarten.IKindergartenService;
import com.project.myapp.myb.kindergarten.KindergartenVO;

@Controller
public class ChildController {
	@Autowired
	IChildService childService;
	
	@Autowired
	IClassroomService classroomService;
	
	@Autowired
	IKindergartenService kindergartenService;
	
	
	
	// 반&자녀 정보 등록 페이지로 이동 (0323 문수지 작성)
	@RequestMapping(value="/parent/mparent_select_class/{kindergartenId}", method=RequestMethod.GET)
	public String kindergartenClassForm(@PathVariable int kindergartenId, HttpSession session, Model model) {
		List<ClassroomVO> classroomList = classroomService.selectClassroomList(kindergartenId);
		model.addAttribute("classroomList", classroomList);
		KindergartenVO kindergarten = kindergartenService.selectKindergartenById(kindergartenId);
		model.addAttribute("kindergartenName", kindergarten.getKindergartenName());
		model.addAttribute("kindergarten", kindergarten);
		return "parent/mparent_select_class";
	}
	
	// 반&자녀 정보 등록 (0324 문수지 작성) (0327 문수지 수정)
	@RequestMapping(value="/parent/mparent_select_class", method=RequestMethod.POST)
	public String kindergartenChildInsert(ChildVO child, HttpSession session) {
		childService.insertChild(child);
		
		String parentEmail = (String) session.getAttribute("parentEmail");
		
		if(parentEmail!=null) { // 세션에 저장한 값이 있으면 로그인 한 경우
			return "parent/mparent_web_main";
		} else {
			return "parent/mparent_login";
		}
	}
}
