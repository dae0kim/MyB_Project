package com.project.myapp.myb.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.myapp.myb.kindergarten.IKindergartenService;
import com.project.myapp.myb.kindergarten.KindergartenVO;

@Controller
public class AdminController {
	
	@Autowired
	IAdminService adminService;
	
	@Autowired
	IKindergartenService kindergartenService;

	// 로그인 페이지 이동
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "/login";
	}
	
	// 로그인
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
	
	// 로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate(); //세션 정보 삭제
		return "redirect:/";
	}

	
	// 회원가입 약관 페이지 이동
	@RequestMapping(value="/principal/join")
	public String join() {
		return "/principal/join";
	}

	// 회원가입 정보 기입 페이지 이동
	@RequestMapping(value="/principal/joinform", method=RequestMethod.GET)
	public String joinForm() {
		return "/principal/joinform";
	}

	// 회원가입 완료버튼 동작
	@RequestMapping(value="/principal/insert", method=RequestMethod.POST)
	public String memberInsert(AdminVO member, HttpSession session) {
		adminService.insertAdmin(member);
		session.invalidate();
		return "redirect:/";
	}
	
   // 이메일 중복체크
   @RequestMapping(value="/principal/adminEmailChk", method=RequestMethod.POST)
   @ResponseBody
   public String adminEmailCheck(String adminEmail) throws Exception {
	   int result = adminService.emailChk(adminEmail);
	   if(result != 0) {
		   return "fail";	// 중복된 이메일
	   } else {
		   return "success"; // 중복된 이메일X
	   }
   }
   
   // 폰번호 중복체크
   @RequestMapping(value="/principal/adminPhoneChk", method=RequestMethod.POST)
   @ResponseBody
   public String adminPhoneCheck(String adminPhone) throws Exception {
	   int result = adminService.phoneChk(adminPhone);
	   if(result != 0) {
		   return "fail";	// 중복된 폰번호
	   } else {
		   return "success"; // 중복된 폰번호X
	   }
   }
	
	
	
	
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
