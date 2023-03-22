package com.project.myapp.myb.teacher;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TeacherController {
	
	@Autowired
	ITeacherService teacherService;
	
	

	@RequestMapping(value="/teacher/mteacher_disease")
	public String moveDisease(Model model) {
		return "/teacher/mteacher_disease";
	}
	
	@RequestMapping(value="/teacher/mteacher_web_main")
	public String moveTeacherMain(Model model) {
		return "/teacher/mteacher_web_main";
	}
	
	
	
	
	/*
	 * @RequestMapping(value="/teacher/mteacher_web_main/{teacherId}") public String
	 * getTeacherInfo(@PathVariable("teacherId") String teacherId, Model model) {
	 * 
	 * 
	 * TeacherVO teachervo = teacherService.getTeacherInfo(teacherId);
	 * 
	 * System.out.println("■■■■■■■■■■■■■■■■■■■" + teachervo);
	 * 
	 * model.addAttribute("teachervo", teachervo);
	 * 
	 * System.out.println("■■■■■■■■■■■■■■■■■■■" + teachervo);
	 * 
	 * 
	 * return "teacher/mteacher_web_main"; }
	 * 
	 */
	
	
	
	
	//로그인 관련
	@RequestMapping(value="/teacher/mteacher_login", method=RequestMethod.GET)
	public String teacherLogin() {
		return "teacher/mteacher_login";
	}
	
	@RequestMapping(value="/teacher/mlogin_teacher", method=RequestMethod.POST)
	public String teacherLogin(String teacherEmail, String teacherPw, HttpSession session, Model model) {
		System.out.println(teacherEmail);
		TeacherVO teacher = teacherService.selectTeacher(teacherEmail);
		if(teacher != null) {
			String dbPassword = teacher.getTeacherPw();
			if(dbPassword == null) {
				model.addAttribute("message", "NOT_VALID_TEACHER");
			} else {
				System.out.println(teacherPw);
				if(dbPassword.equals(teacherPw)) {
					session.setAttribute("teacherEmail", teacherEmail);
					session.setAttribute("loginUser", teacher);
					return "/teacher/mteacher_web_main";
				} else {
					model.addAttribute("message", "WRONG_PASSWORD");
				}
			}
		} else {
			model.addAttribute("message", "TEACHER_NOT_FOUND");
		}
		session.invalidate();
		return "teacher/mlogin_teacher";
	}//로그인 관련 끝
	
	
	//로그아웃
	@RequestMapping(value="/teacher/mteacher_logout", method=RequestMethod.GET)
	public String teacherLogout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
	
		return "mindex";
	}
	
	

	
	
	

}
