package com.project.myapp.myb.controller;

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

import com.project.myapp.myb.alarm.AlarmVO;
import com.project.myapp.myb.alarm.IAlarmService;
import com.project.myapp.myb.child.ChildVO;
import com.project.myapp.myb.child.IChildService;
import com.project.myapp.myb.classroom.ClassroomVO;
import com.project.myapp.myb.classroom.IClassroomService;
import com.project.myapp.myb.disease.DiseaseVO;
import com.project.myapp.myb.disease.IDiseaseService;
import com.project.myapp.myb.diseaselog.DiseaselogEtcVO;
import com.project.myapp.myb.diseaselog.IDiseaselogService;
import com.project.myapp.myb.kindergarten.IKindergartenService;
import com.project.myapp.myb.kindergarten.KindergartenVO;
import com.project.myapp.myb.notice.INoticeService;
import com.project.myapp.myb.notice.NoticeVO;
import com.project.myapp.myb.teacher.ITeacherService;
import com.project.myapp.myb.teacher.TeacherVO;

/**
 * 교사와 관련된 기능을 담는 컨트롤러클래스입니다.
 * 
 * @author 손일형,김대영,문수지
 * @since 2023.04.04
 *
 */
@Controller
public class TeacherController {

	@Autowired
	ITeacherService teacherService;

	@Autowired
	IDiseaseService diseaseService;

	@Autowired
	IClassroomService classroomService;

	@Autowired
	IChildService childService;

	@Autowired
	INoticeService noticeService;

	@Autowired
	IKindergartenService kindergartenService;

	@Autowired
	IDiseaselogService diseaselogService;
	
	@Autowired
	IAlarmService alarmService;

	/**
	 * 교사 웹 메인으로 이동하는 메서드입니다
	 * 
	 * @param model 모델객체를 통해 데이터를 넘겨줍니다.
	 * @param session teacherId를 세션으로 넘겨줍니다
	 * @return 교사 웹 메인화면을 반환합니다.
	 */
	@RequestMapping(value = "/teacher/mteacher_web_main")
	public String moveTeacherMain(Model model, HttpSession session) {
		
		
		//0410 일형추가
		int teacherId = ((Integer)session.getAttribute("teacherId")).intValue();
		List<NoticeVO> noticelist = noticeService.getNoticeList(teacherId);
		model.addAttribute("noticelist", noticelist);
		model.addAttribute("teacherId", teacherId);

		return "/teacher/mteacher_web_main";
	}

	/**
	 * 원생 질병관리 이동시 데이터를 넘겨주는 메서드입니다
	 * 
	 * @param teacherId 교사 식별번호를 입력합니다.
	 * @return 원생 질병관리 화면을 반환합니다
	 */
	@RequestMapping(value = "/teacher/mteacher_disease/{teacherId}")
	public String moveDisease(@PathVariable int teacherId, Model model, HttpSession session) {

		List<DiseaseVO> diseaseList = diseaseService.getDiseaseList();
		model.addAttribute("diseaseList", diseaseList);

		List<ChildVO> getChildNameList = childService.getChildNameList(teacherId);
		model.addAttribute("getChildNameList", getChildNameList);

		ClassroomVO teacherclass = classroomService.getTeacherClass(teacherId);
		model.addAttribute("teacherclass", teacherclass);

		int classroomIdd = teacherclass.getClassroomId();
		System.out.println("classroomIdd : " + classroomIdd);

		int teacherid = ((Integer) session.getAttribute("teacherId")).intValue();
		List<DiseaselogEtcVO> diseaselogetcvo = diseaselogService.test(teacherid);
		model.addAttribute("diseaselogetcvo", diseaselogetcvo);
		System.out.println("diseaselogetcvo : " + diseaselogetcvo);

		return "/teacher/mteacher_disease";
	}

	/**
	 * 교사 로그인 페이지로 이동하는 메서드입니다
	 * 
	 * @return 교사 로그인 화면을 반환합니다.
	 */
	@RequestMapping(value = "/teacher/mteacher_login", method = RequestMethod.GET)
	public String teacherLogin() {
		return "teacher/mteacher_login";
	}
	
	/**
	 * 교사 로그인시 사용되는 메서드입니다
	 * 
	 * @param teacherEmail 교사 이메일을 입력합니다
	 * @param teacherPw 교사 비밀번호를 입력합니다
	 * @param session 세션을 넘겨줍니다
	 * @param model 을 통하여 메세지를 출력합니다
	 * @return 로그인 성공/실패 여부에 따른 페이지가 나옵니다.
	 */
	@RequestMapping(value = "/teacher/mteacher_login", method = RequestMethod.POST)
	public String teacherLogin(String teacherEmail, String teacherPw, HttpSession session, Model model) {
		TeacherVO teacher = teacherService.selectTeacher(teacherEmail);
		ClassroomVO classroom = classroomService.getClassName(teacherEmail);
		KindergartenVO kindergarten = kindergartenService.getKindergartenName(teacherEmail);

		if (teacher != null) {
			String dbPassword = teacher.getTeacherPw();
			if (dbPassword == null) {
				model.addAttribute("message", "아이디 또는 비밀번호를 확인하세요.");
			} else {
				if (dbPassword.equals(teacherPw)) {
					session.setAttribute("teacherEmail", teacherEmail);
					session.setAttribute("loginUser", teacher);
					session.setAttribute("teacherId", teacher.getTeacherId());
					session.setAttribute("teacherName", teacher.getTeacherName());
					session.setAttribute("classroom", classroom);
					session.setAttribute("kindergarten", kindergarten);
					

					return "redirect:/teacher/mteacher_web_main";
				} else {
					model.addAttribute("message", "비밀번호를 확인하세요.");
				}
			}
		} else {
			model.addAttribute("message", "존재하지 않는 계정입니다.");
		}
		session.invalidate();
		return "teacher/mteacher_login";
	}

	/**
	 * 로그아웃시 사용되는 메서드입니다
	 * 
	 * @param session 세션정보를 입력합니다
	 * @param request 모델 객체를 입력합니다
	 * @return 인덱스 화면으로 이동합니다.
	 */
	@RequestMapping(value = "/teacher/mteacher_logout", method = RequestMethod.GET)
	public String teacherLogout(HttpSession session, HttpServletRequest request) {
		session.invalidate();

		return "mindex";
	}

	/**
	 * 교사의 비밀번호 일치 여부를 확인합니다
	 * 
	 * @param teacherEmail 이메일을 입력합니다
	 * @param teacherPw 비밀번호를 입력합니다
	 * @return 일치여부에 따른 결과를 표시합니다
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/teacher/teacherPwChk", method = RequestMethod.POST)
	public String teacherPwCheck(@Param(value = "teacherEmail") String teacherEmail,
			@Param(value = "teacherPw") String teacherPw) throws Exception {
		int result = teacherService.pwChk(teacherEmail, teacherPw);
		if (result != 0) {
			return "fail"; 
		} else {
			return "success"; 
		}
	}

	/**
	 * 교사 사용자의 알람 목록 페이지로 이동하는 메서드입니다.
	 * 
	 * @param session 세션정보를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @return 알람 목록 페이지를 반환합니다.
	 */
	@RequestMapping(value="/teacher/mteacher_alarm")
	public String parentAlarm(HttpSession session, Model model) {
		int teacherId = (int) session.getAttribute("teacherId");
		List<AlarmVO> alarms = alarmService.getTeacherAlarm(teacherId);
		model.addAttribute("alarms", alarms);
		return "teacher/mteacher_alarm"; 
	}

	/* -----------------------------웹 기능 : 김대영----------------------------- */
	/**
	 * 교사 목록 출력을 위한 메서드입니다.
	 * 
	 * @param adminId 사용자 식별번호를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @param session 세션정보를 입력합니다.
	 * @param request 요청정보를 입력합니다.
	 * @return 사용자 상태에 맞는 화면을 반환합니다.
	 */
	@RequestMapping(value="/teacher/list/{adminId}")
	public String getAllTeacher(@PathVariable int adminId,Model model,HttpSession session, HttpServletRequest request) {
		
		String stat = (String) session.getAttribute("kindergartenStat");
		
		if(stat != null) {
			int kindergartenId = ((Integer)session.getAttribute("kindergartenId")).intValue();
			int classroomCount = classroomService.getClassroomCount(kindergartenId);

			if(stat.equals("Y")) {
				if(classroomCount > 0) {
					List<TeacherVO> teacherList = teacherService.selectTeacherList(adminId);
					model.addAttribute("teacherList", teacherList);
					return "/principal/teacher/teacherlist";								
				}else {
					return "redirect:/classroom/check";					
				}
			}
		}else {
			return "redirect:/kindergarten/check";
		}
		return "redirect:/kindergarten/check";
	}
	
	/**
	 * 교사 등록 페이지 이동을 위한 메서드입니다.
	 * 
	 * @param model 모델객체를 입력합니다.
	 * @param session 세션정보를 입력합니다.
	 * @param request 요청정보를 입력합니다.
	 * @return 교사 등록 화면을 반환합니다.
	 */
	@RequestMapping(value="/teacher/insert", method=RequestMethod.GET)
	public String insertTeacher(Model model, HttpSession session, HttpServletRequest request) {		
		
		int adminId = ((Integer)session.getAttribute("adminId")).intValue();
		List<ClassroomVO> classroomList = classroomService.getClassroomNameList(adminId); 
		
		model.addAttribute("classroomList",classroomList);
		
		return "/principal/teacher/teacherinsertform";
	}
	
	/**
	 * 교사 정보 등록을 위한 메서드입니다.
	 * 
	 * @param teacherVO 교사 정보가 담긴 객체를 입력합니다.
	 * @param session 세션정보를 입력합니다.
	 * @param request 요청정보를 입력합니다.
	 * @return 교사 목록 화면으로 이동하는 요청을 반환합니다.
	 */
	@RequestMapping(value="/teacher/insert", method=RequestMethod.POST)
	public String insertTeacher(TeacherVO teacherVO,HttpSession session, HttpServletRequest request) {
		teacherService.insertTeacher(teacherVO);
		
		int adminId = ((Integer)session.getAttribute("adminId")).intValue();
		
		return "redirect:/teacher/list/"+adminId;
	}
	
	/**
	 * 교사 상세정보 조회를 위한 메서드입니다.
	 * 
	 * @param teacherId 교사 식별번호를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @param session 세션정보를 입력합니다.
	 * @param request 요청정보를 입력합니다.
	 * @return 교사 상세정보 화면을 반환합니다.
	 */
	@RequestMapping(value="/teacher/info/{teacherId}")
	public String getTeacherIdInfo(@PathVariable int teacherId,Model model,HttpSession session, HttpServletRequest request) {
		
		TeacherVO teacherInfo = teacherService.selectTeacherInfo(teacherId);
		
		model.addAttribute("teacherInfo",teacherInfo);
		
		return "/principal/teacher/teacherinfo";				
	}
	
	/**
	 * 교사 정보 수정 페이지로 이동하기 위한 메서드입니다.
	 * 
	 * @param teacherId 교사 식별번호를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @param session 세션정보를 입력합니다.
	 * @param request 요청정보를 입력합니다.
	 * @return 교사 정보 수정 화면을 반환합니다.
	 */
	@RequestMapping(value="/teacher/update/{teacherId}", method=RequestMethod.GET)
	public String updateTeacher(@PathVariable int teacherId,Model model,HttpSession session, HttpServletRequest request) {
		
		int adminId = ((Integer)session.getAttribute("adminId")).intValue();
		List<ClassroomVO> classroomList = classroomService.getClassroomNameList(adminId); 
		TeacherVO teacherInfo = teacherService.selectTeacherInfo(teacherId);
				
		model.addAttribute("classroomList",classroomList);
		model.addAttribute("teacherInfo",teacherInfo);
				
		return "/principal/teacher/teacherupdate";				
	}
	
	
	/**
	 * 교사 정보 수정을 위한 메서드입니다.
	 * 
	 * @param teacherVO 수정된 교사정보가 담긴 객체를 입력합니다.
	 * @param session 세션정보를 입력합니다.
	 * @param request 요청정보를 입력합니다.
	 * @return 교사 상세정보 화면으로 이동하는 요청을 반환합니다.
	 */
	@RequestMapping(value="/teacher/update", method=RequestMethod.POST)
	public String updateTeacher(TeacherVO teacherVO,HttpSession session, HttpServletRequest request) {
		teacherService.updateTeacher(teacherVO);	
		return "redirect:/teacher/info/"+teacherVO.getTeacherId();
	}
	
	/**
	 * 교사정보 삭제를 위한 메서드입니다.
	 * 
	 * @param teacherId 교사 식별번호를 입력합니다.
	 * @param session 세션정보를 입력합니다.
	 * @param request 요청정보를 입력합니다.
	 * @return 교사 목록 화면으로 이동하는 요청을 반환합니다.
	 */
	@RequestMapping(value = "/teacher/delete/{teacherId}")
	public String deleteTeacher(@PathVariable int teacherId,HttpSession session, HttpServletRequest request) {
		teacherService.deleteTeacher(teacherId);
		int adminId = ((Integer)session.getAttribute("adminId")).intValue();

		return "redirect:/teacher/list/"+adminId;
	}
}
