package com.project.myapp.myb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.myapp.myb.admin.AdminVO;
import com.project.myapp.myb.admin.IAdminService;
import com.project.myapp.myb.kindergarten.IKindergartenService;
import com.project.myapp.myb.kindergarten.KindergartenVO;

/**
 * 원장 사용자, 시스템 관리자와 관련된 기능을 담는 컨트롤러클래스입니다.
 * 
 * @author 김대영
 * @since 2023.04.04
 *
 */
@Controller
public class AdminController {
	
	@Autowired
	IAdminService adminService;
	
	@Autowired
	IKindergartenService kindergartenService;

	/**
	 * 로그인 페이지로 이동하는 메서드입니다.
	 * 
	 * @return 로그인 페이지를 반환합니다.
	 */
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "/login";
	}
	
	/**
	 * 로그인을 시도할 때 계정 정보 확인을 하는 메서드입니다.
	 * 
	 * @param email 이메일을 입력합니다.
	 * @param password 비밀번호를 입력합니다.
	 * @param session 세션정보를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @return 로그인에 실패했다면 다시 로그인화면을, 사용자가 원장이라면 원장 메인화면을, 시스템 관리자라면 관리자 메인화면을 반환합니다.
	 */
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(String email, String password, HttpSession session, Model model) {

		// 입력받은 email로 Admin객체 생성
		AdminVO member = adminService.selectAdmin(email);
		
		// 만약 반환 된 객체가 있다면 = admin테이블에 입력받은 email과 같은 row가 있다면
		if(member != null) {
			// 비밀번호 속성이 있는지 확인
			String dbPassword = member.getAdminPw();
				// 만약 비밀번호가 없다면 
				if(dbPassword == null) {
				//아이디가 없음
				model.addAttribute("message", "아이디 또는 비밀번호를 확인하세요.");
			}else {
				//아이디 있음
				if(dbPassword.equals(password)) {
					// 비밀번호 일치
					session.setAttribute("loginUser", member);
					session.setAttribute("adminLevel", member.getAdminLevel());
					session.setAttribute("adminEmail", member.getAdminEmail());
					session.setAttribute("adminId", member.getAdminId());
					
					
					//해당 아이디의 관리자 레벨이 admin인 경우 시스템 관리자로 인식
					if((member.getAdminLevel()).equals("admin")) {
						return "redirect:/admin/home";
					}else if((member.getAdminLevel()).equals("principal")){
						
						//관리자 레벨이 principal인 경우 원장 사용자로 인식
						KindergartenVO kindergartenVO = kindergartenService.selectKindergarten(member.getAdminId());
						
						if(kindergartenVO == null) {
							session.setAttribute("kindergartenId", null);
							session.setAttribute("kindergartenStat", null);
						}else {							
							int kindergartenId = kindergartenVO.getKindergartenId();
							String kindergartenStat = kindergartenVO.getKindergartenStat();	
							session.setAttribute("kindergartenId", kindergartenId);
							session.setAttribute("kindergartenStat", kindergartenStat);
						}
						
						return "redirect:/principal/home";
					}
				}else {
					//비밀번호 불일치
					model.addAttribute("message", "비밀번호를 확인하세요.");
				}
			}
		}else {
			model.addAttribute("message", "존재하지 않는 계정입니다.");
		}
		session.invalidate();	
		return "/login";
	}
	
	/**
	 * 로그아웃을 실행하는 메서드입니다.
	 * 
	 * @param session 세션정보를 입력합니다.
	 * @param request 요청정보를 입력합니다.
	 * @return 메인 화면을 반환합니다.
	 */
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate(); //세션 정보 삭제
		return "redirect:/";
	}

	/**
	 * 회원가입 페이지로 이동하는 메서드입니다.
	 * 
	 * @return 회원가입 화면을 반환합니다.
	 */
	@RequestMapping(value="/principal/joinform", method=RequestMethod.GET)
	public String joinForm() {
		return "/principal/joinform";
	}

	/**
	 * 회원가입을 통해 입력받은 가입자의 정보를 DB에 전달하는 메서드입니다.
	 * 
	 * @param member 가입자의 정보를 담은 객체를 입력합니다.
	 * @param session 세션정보를 입력합니다.
	 * @return 메인화면을 반환합니다.
	 */
	@RequestMapping(value="/principal/insert", method=RequestMethod.POST)
	public String memberInsert(AdminVO member, HttpSession session) {		
		adminService.insertAdmin(member);
		session.invalidate();
		return "redirect:/";
	}
		
	/**
	 * url을 통해 원장 권한이 없는 사용자의 접속을 방지하는 메서드입니다.
	 * 
	 * @param session 세션정보를 입력합니다.
	 * @param request 요청정보를 입력합니다.
	 * @return 권한이 없는 사용자의 경우 메인 화면을, 원장인 경우 원장 메인화면을 반환합니다.
	 */
	@RequestMapping(value="/principal/home")
	public String principalHome(HttpSession session, HttpServletRequest request) {
		
		String level = (String) session.getAttribute("adminLevel");
		
		// url로 로그인 없이 접근하는것을 방지
		if(level.equals("principal")) {
			return "/principal/home";
		}else {
			session.invalidate();
			return "redirect:/";
		}
	}
	
	/**
	 * url을 통해 시스템 관리자 권한이 없는 사용자의 접속을 방지하는 메서드입니다.
	 * 
	 * @param session 세션정보를 입력합니다.
	 * @param request 요청정보를 입력합니다.
	 * @return 권한이 없는 사용자의 경우 메인 화면을, 시스템 관리자인 경우 관리자 메인화면을 반환합니다.
	 */
	@RequestMapping(value="/admin/home")
	public String adminHome(HttpSession session, HttpServletRequest request) {
		
		String level = (String) session.getAttribute("adminLevel");
		
		// url로 관리자 기능으로 접근하는것을 방지
		if(level.equals("admin")) {
			return "/admin/home";
		}else {
			session.invalidate();
			return "redirect:/";
		}
		
	}
	
}
