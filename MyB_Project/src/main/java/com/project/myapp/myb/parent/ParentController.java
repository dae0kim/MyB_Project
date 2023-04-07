package com.project.myapp.myb.parent;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.myapp.myb.alarm.AlarmVO;
import com.project.myapp.myb.alarm.IAlarmService;
import com.project.myapp.myb.child.ChildVO;
import com.project.myapp.myb.child.IChildService;
import com.project.myapp.myb.classroom.ClassroomVO;
import com.project.myapp.myb.classroom.IClassroomService;
import com.project.myapp.myb.disease.IDiseaseService;
import com.project.myapp.myb.kindergarten.IKindergartenService;
import com.project.myapp.myb.kindergarten.KindergartenVO;

/**
 * 부모 사용자와 관련된 기능을 담는 컨트롤러클래스입니다.
 * 
 * @author 문수지
 * @since 2023.03.22
 *
 */
@Controller
public class ParentController {
	   
	@Autowired
	IParentService parentService;
   
	@Autowired
	IChildService childService;

	@Autowired
	IKindergartenService kindergartenService;

	@Autowired
	IClassroomService classroomService;
   
	@Autowired
	IDiseaseService diseaseService;
   
	@Autowired
	IAlarmService alarmService;
	
	/**
	 * 회원가입 시 이용약관 페이지로 이동하는 메서드입니다.
	 * 
	 * @return 이용약관 페이지를 반환합니다.
	 */
	@RequestMapping(value="/parent/mparent_terms")
	public String moveTerms() {
		return "parent/mparent_terms";
	}
   
	/**
	 * 회원가입 시 부모 사용자 정보 입력 폼 페이지로 이동하는 메서드입니다.
	 * 
	 * @return 부모 사용자 정보 입력 폼 페이지를 반환합니다.
	 */
	@RequestMapping(value="/parent/mparent_join", method=RequestMethod.GET)
	public String joinForm() {
		return "parent/mparent_join";
	}

	/**
	 * 회원가입 시 부모 사용자 정보를 입력하는 메서드입니다.
	 * 
	 * @param parentEmail 부모 사용자 이메일을 입력합니다.
	 * @param parent 부모 사용자 정보가 담긴 객체를 입력합니다.
	 * @param session 세션정보를 입력합니다.
	 * @return 자녀정보 등록을 위한 어린이집 선택 페이지를 반환합니다.
	 */
	@RequestMapping(value="/parent/mparent_join", method=RequestMethod.POST)
	public String parentJoin(String parentEmail, ParentVO parent, HttpSession session) {
		parentService.insertParent(parent); // 사용자(부모) 테이블에 부모 정보 저장
		ParentVO parentId = parentService.selectParent(parentEmail);	// 폼에 입력한 이메일과 일치하는 정보 물러옴
		session.setAttribute("parentId", parentId.getParentId());  // 사용자 아이디를 세션에 저장
		session.setAttribute("parentEmail", parentEmail); // 사용자 이메일을 세션에 저장
		return "parent/mparent_select_kinder";
	}
	
	/**
	 * ajax 요청에 따른 로그인 시 입력한 부모 사용자의 이메일과 비밀번호가 일치하는 지 확인하는 메서드입니다.
	 * 
	 * @param parentEmail 부모 사용자의 이메일을 입력합니다.
	 * @param parentPw 부모 사용자의 비밀번호를 입력합니다.
	 * @return 로그인에 성공 시 "success"를, 실패 시 "fail"을 반환합니다.
	 */
	@RequestMapping(value="/parent/parentPwChk", method=RequestMethod.POST)
	@ResponseBody
	public String parentPwCheck(@Param(value="parentEmail")String parentEmail, @Param(value="parentPw")String parentPw) throws Exception {
		int result = parentService.pwChk(parentEmail, parentPw);
		if(result != 0) { // 입력된 이메일과 일치하는 정보가 1 이상일 경우
			return "success";	// 비밀번호 맞춤
		} else {
			return "fail"; // 비밀번호 틀림
		}
	}
   
	/**
	 * 부모 사용자 로그인 페이지로 이동하는 메서드입니다.
	 * 
	 * @return 부모 사용자 로그인 페이지를 반환합니다.
	 */
	@RequestMapping(value="/parent/mparent_login", method=RequestMethod.GET)
	public String parentLogin() {
		return "parent/mparent_login";
	}
   
	/**
	 * 부모 사용자가 로그인 시도 시 계정 정보를 확인하는 메서드입니다.
	 * 
	 * @param parentEmail 부모 사용자의 이메일을 입력합니다.
	 * @param parentPw 부모 사용자의 비밀번호를 입력합니다.
	 * @param session 세션정보를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @return 로그인 실패 시 다시 로그인 페이지를, 로그인 성공 시 부모 사용자 메인 페이지를 반환합니다.
	 */
	@RequestMapping(value="/parent/mparent_login", method=RequestMethod.POST)
	public String parentLogin(String parentEmail, String parentPw, HttpSession session, Model model) {
		ParentVO parent = parentService.selectParent(parentEmail);
		ChildVO child = childService.selectChild(parentEmail);
      
		if(parent != null) {
			String dbPassword = parent.getParentPw();
			if(dbPassword == null) {
				model.addAttribute("message", "아이디 또는 비밀번호를 확인하세요.");
			} else {
				if(dbPassword.equals(parentPw)) {
					session.setAttribute("parentEmail", parentEmail);
					session.setAttribute("parentRelation", parent.getParentRelation());
					session.setAttribute("parentId", parent.getParentId());  // 사용자 아이디를 세션에 저장
					session.setAttribute("childName", child.getChildName());// 자녀 이름
					session.setAttribute("parentName", parent.getParentName());	//부모 이름을 세션에 저장

					// 자녀 어린이집
					int kindergartenId = child.getKindergartenId();
					KindergartenVO kindergarten = kindergartenService.selectKindergartenById(kindergartenId);
					session.setAttribute("kindergartenName", kindergarten.getKindergartenName());
               
					// 자녀 어린이집 반
					int classroomId = child.getClassroomId();
					ClassroomVO classroom = classroomService.selectClassroom(classroomId);
					session.setAttribute("classroomName", classroom.getClassroomName());

					return "parent/mparent_web_main";
				} else {
					model.addAttribute("message", "비밀번호를 확인하세요.");
				}
			}
		} else {
			model.addAttribute("message", "존재하지 않는 계정입니다.");
		}
		session.invalidate();
		return "parent/mparent_login";
	}
	
	/**
	 * 로그아웃을 실행하는 메서드입니다.
	 * 
	 * @param session 세션정보를 입력합니다.
	 * @param request 요청정보를 입력합니다.
	 * @return 메인 페이지를 반환합니다.
	 */
	@RequestMapping(value="/parent/mparent_logout", method=RequestMethod.GET)
	public String parentLogout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		return "mindex";
	}
   
	/**
	 * 부모 사용자 메인 페이지로 이동하는 메서드입니다.
	 * 
	 * @return 부모 사용자 메인 페이지를 반환합니다.
	 */
	@RequestMapping(value="/parent/mparent_web_main", method=RequestMethod.GET)
	public String moveMain() {
		return "parent/mparent_web_main";
	}
   
	/**
	 * 부모 사용자의 내 정보 보기 페이지로 이동하는 메서드입니다.
	 * 
	 * @param session 세션정보를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @return 내 정보 보기 페이지를 반환합니다.
	 */
	@RequestMapping(value="/parent/mparent_sidemenu_info")
	public String parentMypageView(HttpSession session, Model model) {
		String parentEmail = (String) session.getAttribute("parentEmail");
		ParentVO parent = parentService.selectParent(parentEmail);
		model.addAttribute("parent", parent);
		return "parent/mparent_sidemenu_info";
	}
   
	/**
	 * 부모 사용자의 내 정보 수정하기 페이지로 이동하는 메서드입니다.
	 * 
	 * @param session 세션정보를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @return 내 정보 수정하기 페이지를 반환합니다.
	 */
	@RequestMapping(value="/parent/mparent_sidemenu_info_modify", method=RequestMethod.GET)
	public String parentMypageUpdateForm(HttpSession session, Model model) {
		String parentEmail = (String) session.getAttribute("parentEmail");
		ParentVO parent = parentService.selectParent(parentEmail);
		model.addAttribute("parent", parent);
		return "parent/mparent_sidemenu_info_modify";
	}
   
	/**
	 * 부모 사용자의 정보를 수정하는 메서드입니다.
	 * 
	 * @param parent 부모 사용자 정보를 담은 객체를 입력합니다.
	 * @return 내 정보 수정하기 페이지를 반환합니다.
	 */
	@RequestMapping(value="/parent/mparent_sidemenu_info_modify", method=RequestMethod.POST)
	public String parentMypageUpdate(ParentVO parent) {
		parentService.updateParent(parent);
		return "redirect:/parent/mparent_sidemenu_info";
	}
   
	/**
	 * 부모 사용자의 알람 목록 페이지로 이동하는 메서드입니다.
	 * 
	 * @param session 세션정보를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @return 알람 목록 페이지를 반환합니다.
	 */
	@RequestMapping(value="/parent/mparent_alarm")
	public String parentAlarm(HttpSession session, Model model) {
		int parentId = (int) session.getAttribute("parentId");
		List<AlarmVO> alarms = alarmService.getAlarm(parentId);
		model.addAttribute("alarms", alarms);
		return "parent/mparent_alarm";
	}
   
}