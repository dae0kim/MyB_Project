package com.project.myapp.myb.teacher;

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

	// 교사 웹 메인 이동
	@RequestMapping(value = "/teacher/mteacher_web_main")
	public String moveTeacherMain(Model model) {

		List<NoticeVO> noticelist = noticeService.getNoticeList();
		model.addAttribute("noticelist", noticelist);

		return "/teacher/mteacher_web_main";
	}

	// 원생 질병관리 이동 + 질병정보 입력 + 반 정보 입력
	@RequestMapping(value = "/teacher/mteacher_disease/{teacherId}")
	public String moveDisease(@PathVariable int teacherId, Model model, HttpSession session) {

		// 질병명 리스트
		List<DiseaseVO> diseaseList = diseaseService.getDiseaseList();
		model.addAttribute("diseaseList", diseaseList);

		// 반 원생 리스트
		List<ChildVO> getChildNameList = childService.getChildNameList(teacherId);
		model.addAttribute("getChildNameList", getChildNameList);

		// 반 이름
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

	// 로그인 관련
	@RequestMapping(value = "/teacher/mteacher_login", method = RequestMethod.GET)
	public String teacherLogin() {
		return "teacher/mteacher_login";
	}

	@RequestMapping(value = "/teacher/mteacher_login", method = RequestMethod.POST)
	public String teacherLogin(String teacherEmail, String teacherPw, HttpSession session, Model model) {
		System.out.println(teacherEmail);
		TeacherVO teacher = teacherService.selectTeacher(teacherEmail);
		ClassroomVO classroom = classroomService.getClassName(teacherEmail);
		KindergartenVO kindergarten = kindergartenService.getKindergartenName(teacherEmail);

		if (teacher != null) {
			String dbPassword = teacher.getTeacherPw();
			if (dbPassword == null) {
				model.addAttribute("message", "NOT_VALID_TEACHER");
			} else {
				System.out.println(teacherPw);
				if (dbPassword.equals(teacherPw)) {
					session.setAttribute("teacherEmail", teacherEmail);
					session.setAttribute("loginUser", teacher);
					session.setAttribute("teacherId", teacher.getTeacherId());
					session.setAttribute("classroom", classroom);
					session.setAttribute("kindergarten", kindergarten);

					return "redirect:/teacher/mteacher_web_main";
				} else {
					model.addAttribute("message", "WRONG_PASSWORD");
				}
			}
		} else {
			model.addAttribute("message", "TEACHER_NOT_FOUND");
		}
		session.invalidate();
		return "teacher/mteacher_login";
	}// 로그인 관련 끝

	// 로그아웃
	@RequestMapping(value = "/teacher/mteacher_logout", method = RequestMethod.GET)
	public String teacherLogout(HttpSession session, HttpServletRequest request) {
		session.invalidate();

		return "mindex";
	}

	// login email check
	@ResponseBody
	@RequestMapping(value = "/teacher/teacherEmailChk", method = RequestMethod.POST)
	public String teacherEmailCheck(String teacherEmail) throws Exception {
		int result = teacherService.emailChk(teacherEmail);
		if (result != 0) {
			return "fail"; // 중복된 이메일
		} else {
			return "success"; // 중복된 이메일X
		}
	}

	// login password check
	@ResponseBody
	@RequestMapping(value = "/teacher/teacherPwChk", method = RequestMethod.POST)
	public String teacherPwCheck(@Param(value = "teacherEmail") String teacherEmail,
			@Param(value = "teacherPw") String teacherPw) throws Exception {
		int result = teacherService.pwChk(teacherEmail, teacherPw);
		System.out.println("결과값 = " + result);
		if (result != 0) {
			return "fail"; // 비밀번호 틀림
		} else {
			return "success"; // 비밀번호 맞춤
		}
	}

	/* -----------------------------웹 기능----------------------------- */
	// 교사 목록 출력
	@RequestMapping(value = "/teacher/list/{adminId}")
	public String getAllTeacher(@PathVariable int adminId, Model model, HttpSession session,
			HttpServletRequest request) {

		String stat = (String) session.getAttribute("kindergartenStat");

		if (stat != null) {
			int kindergartenId = ((Integer) session.getAttribute("kindergartenId")).intValue();
			int classroomCount = classroomService.getClassroomCount(kindergartenId);

			if (stat.equals("Y")) {
				if (classroomCount > 0) {
					List<TeacherVO> teacherList = teacherService.selectTeacherList(adminId);
					model.addAttribute("teacherList", teacherList);
					return "/principal/teacher/teacherlist";
				} else {
					return "redirect:/classroom/check";
				}
			}
		} else {
			return "redirect:/kindergarten/check";
		}
		return "redirect:/kindergarten/check";
	}

	// 교사 등록 페이지 이동
	@RequestMapping(value = "/teacher/insert", method = RequestMethod.GET)
	public String insertTeacher(Model model, HttpSession session, HttpServletRequest request) {

		int adminId = ((Integer) session.getAttribute("adminId")).intValue();
		List<ClassroomVO> classroomList = classroomService.getClassroomNameList(adminId);

		model.addAttribute("classroomList", classroomList);

		return "/principal/teacher/teacherinsertform";
	}

	// 교사 정보 등록
	@RequestMapping(value = "/teacher/insert", method = RequestMethod.POST)
	public String insertTeacher(TeacherVO teacherVO, HttpSession session, HttpServletRequest request) {
		teacherService.insertTeacher(teacherVO);

		int adminId = ((Integer) session.getAttribute("adminId")).intValue();

		return "redirect:/teacher/list/" + adminId;
	}

	// 폰번호 중복체크
	@RequestMapping(value = "/teacher/teacherPhoneChk", method = RequestMethod.POST)
	@ResponseBody
	public String teacherPhoneCheck(String teacherPhone) throws Exception {
		int result = teacherService.phoneChk(teacherPhone);
		System.out.println("번호:" + teacherPhone);
		System.out.println("결과값:" + result);
		if (result != 0) {
			return "fail"; // 중복된 폰번호
		} else {
			return "success"; // 중복된 폰번호X
		}
	}

	// 교사 상세정보 조회
	@RequestMapping(value = "/teacher/info/{teacherId}")
	public String getTeacherIdInfo(@PathVariable int teacherId, Model model, HttpSession session,
			HttpServletRequest request) {

		TeacherVO teacherInfo = teacherService.selectTeacherInfo(teacherId);

		model.addAttribute("teacherInfo", teacherInfo);

		return "/principal/teacher/teacherinfo";
	}

	// 교사 정보 수정 페이지로 이동
	@RequestMapping(value = "/teacher/update/{teacherId}", method = RequestMethod.GET)
	public String updateTeacher(@PathVariable int teacherId, Model model, HttpSession session,
			HttpServletRequest request) {

		int adminId = ((Integer) session.getAttribute("adminId")).intValue();
		List<ClassroomVO> classroomList = classroomService.getClassroomNameList(adminId);
		TeacherVO teacherInfo = teacherService.selectTeacherInfo(teacherId);

		model.addAttribute("classroomList", classroomList);
		model.addAttribute("teacherInfo", teacherInfo);

		return "/principal/teacher/teacherupdate";
	}

	// 교사 정보 수정
	@RequestMapping(value = "/teacher/update", method = RequestMethod.POST)
	public String updateTeacher(TeacherVO teacherVO, HttpSession session, HttpServletRequest request) {
		System.out.println(teacherVO.getTeacherId());
		teacherService.updateTeacher(teacherVO);
		return "redirect:/teacher/info/" + teacherVO.getTeacherId();
	}

	// 교사 정보 삭제 페이지 이동
	@RequestMapping(value = "/teacher/delete/{teacherId}", method = RequestMethod.GET)
	public String deleteTeacher(@PathVariable int teacherId, Model model) {

		TeacherVO teacherInfo = teacherService.selectTeacherInfo(teacherId);
		model.addAttribute("teacherInfo", teacherInfo);

		return "/principal/teacher/teacherdelete";
	}

	// 교사 정보 삭제
	@RequestMapping(value = "/teacher/delete/{teacherId}", method = RequestMethod.POST)
	public String deleteTeacher(@PathVariable int teacherId, HttpSession session, HttpServletRequest request) {
		teacherService.deleteTeacher(teacherId);
		int adminId = ((Integer) session.getAttribute("adminId")).intValue();

		return "redirect:/teacher/list/" + adminId;
	}

}
