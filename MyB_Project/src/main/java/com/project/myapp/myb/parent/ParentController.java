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

import com.project.myapp.myb.child.ChildVO;
import com.project.myapp.myb.child.IChildService;
import com.project.myapp.myb.classroom.ClassroomVO;
import com.project.myapp.myb.classroom.IClassroomService;
import com.project.myapp.myb.disease.IDiseaseService;
import com.project.myapp.myb.kindergarten.IKindergartenService;
import com.project.myapp.myb.kindergarten.KindergartenVO;
import com.project.myapp.myb.notice.INoticeService;
import com.project.myapp.myb.notice.NoticeVO;
/***
 * 
 * @author 문수지
 * @since 2023-03-22
 * 부모 계정 회원가입/로그인 하기 위한 컨트롤러 클래스입니다.
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
	   INoticeService noticeService;
	   
	   /***
	    * @author 문수지
	    * 이용약관 페이지로 이동
	    */
	   @RequestMapping(value="/parent/mparent_terms")
	   public String moveTerms() {
	      return "parent/mparent_terms";
	   }
	   
	   /***
	    * @author 문수지
	    * 사용자(부모) 정보를 입력하는 폼으로 이동
	    */
	   @RequestMapping(value="/parent/mparent_join", method=RequestMethod.GET)
	   public String joinForm() {
	      return "parent/mparent_join";
	   }
	   
	   /***
	    * @author 문수지
	    * 사용자(부모) 정보 입력 후 유치원 선택 폼으로 이동
	    */
	   @RequestMapping(value="/parent/mparent_join", method=RequestMethod.POST)
	   public String parentJoin(String parentEmail, ParentVO parent, HttpSession session) {
	      parentService.insertParent(parent); // 사용자(부모) 테이블에 부모 정보 저장
	      ParentVO parentId = parentService.selectParent(parentEmail);	// 폼에 입력한 이메일과 일치하는 정보 물러옴
	      session.setAttribute("parentId", parentId.getParentId()); // 사용자 이메일을 세션에 저장
	      return "parent/mparent_select_kinder";
	   }
	   
	   /***
	    * @author 문수지
	    * 사용자(부모) 정보 입력 시 중복된 이메일 확인
	    */
	   @RequestMapping(value="/parent/parentEmailChk", method=RequestMethod.POST)
	   @ResponseBody
	   public String parentEmailCheck(String parentEmail) throws Exception {
		   int result = parentService.emailChk(parentEmail);
		   if(result != 0) { // 중복된 이메일이 있을 경우 (입력된 이메일과 일치하는 정보가 1 이상일 경우)
			   return "fail";	// 중복된 이메일
		   } else {
			   return "success"; // 중복된 이메일X
		   }
	   }
	   
	   /***
	    * @author 문수지
	    * 사용자(부모) 정보 입력 시 중복된 전화번호 확인
	    */
	   @RequestMapping(value="/parent/parentPhoneChk", method=RequestMethod.POST)
	   @ResponseBody
	   public String parentPhoneCheck(String parentPhone) throws Exception {
		   int result = parentService.phoneChk(parentPhone);
		   if(result != 0) { // 중복된 전화번호가 있을 경우 (입력된 전화번호과 일치하는 정보가 1 이상일 경우)
			   return "fail";	// 중복된 전화번호
		   } else {
			   return "success"; // 중복된 전화번호X
		   }
	   }
	   
	   /***
	    * @author 문수지
	    * 로그인할 경우 입력한 이메일(아이디)와 일치하는 비밀번호인지 확인
	    */
	   @RequestMapping(value="/parent/parentPwChk", method=RequestMethod.POST)
	   @ResponseBody
	   public String parentPwCheck(@Param(value="parentEmail")String parentEmail, @Param(value="parentPw")String parentPw) throws Exception {
		   int result = parentService.pwChk(parentEmail, parentPw);
		   if(result != 0) { // 중복된 비밀번호가 있을 경우 (입력된 이메일과 일치하는 정보가 1 이상일 경우)
			   return "success";	// 비밀번호 맞춤
		   } else {
			   return "fail"; // 비밀번호 틀림
		   }
	   }
	   
	   /***
	    * @author 문수지
	    * 로그인 페이지로 이동
	    */
	   @RequestMapping(value="/parent/mparent_login", method=RequestMethod.GET)
	   public String parentLogin() {
	      return "parent/mparent_login";
	   }
	   
	   /***
	    * @author 문수지
	    * 로그인 성공했을 경우 앱 메인페이지로 이동, 실패할 경우 로그인 페이지
	    */
	   @RequestMapping(value="/parent/mparent_login", method=RequestMethod.POST)
	   public String parentLogin(String parentEmail, String parentPw, HttpSession session, Model model) {
	      ParentVO parent = parentService.selectParent(parentEmail);
	      ChildVO child = childService.selectChild(parentEmail);
	      
	      if(parent != null) {
	         String dbPassword = parent.getParentPw();
	         if(dbPassword == null) {
	            model.addAttribute("message", "NOT_VALID_PARENT");
	         } else {
	        	 if(dbPassword.equals(parentPw)) {
	               session.setAttribute("parentEmail", parentEmail);
	               session.setAttribute("parentRelation", parent.getParentRelation());
	               session.setAttribute("childName", child.getChildName());// 자녀 이름
	               
	               // 자녀 어린이집
	               int kindergartenId = child.getKindergartenId();
	               KindergartenVO kindergarten = kindergartenService.selectKindergartenById(kindergartenId);
	               session.setAttribute("kindergartenName", kindergarten.getKindergartenName());
	               
	               // 자녀 어린이집 반
	               int classroomId = child.getClassroomId();
	               ClassroomVO classroom = classroomService.selectClassroom(classroomId);
	               session.setAttribute("classroomName", classroom.getClassroomName());
	               
	               // 공지사항
	               List<NoticeVO> noticelist = noticeService.getNoticeList();
	               model.addAttribute("noticelist", noticelist);
	        
	               return "parent/mparent_web_main";
	            } else {
	               model.addAttribute("message", "WRONG_PASSWORD");
	            }
	         }
	      } else {
	         model.addAttribute("message", "PARENT_NOT_FOUND");
	      }
	      session.invalidate();
	      return "parent/mparent_login";
	   }
	   
	   /***
	    * @author 문수지
	    * 로그아웃
	    */
	   @RequestMapping(value="/parent/mparent_logout", method=RequestMethod.GET)
	   public String parentLogout(HttpSession session, HttpServletRequest request) {
	      session.invalidate();
	      return "mindex";
	   }
	   
	   /***
	    * @author 문수지
	    * 앱 메인페이지로 이동
	    */
	   @RequestMapping(value="/parent/mparent_web_main", method=RequestMethod.GET)
	   public String moveMain() {
	      return "parent/mparent_web_main";
	   }
	   
	   // 내정보 보기로 이동
	   @RequestMapping(value="/parent/mparent_sidemenu_info")
	   public String parentMypageView(HttpSession session, Model model) {
		   String parentEmail = (String) session.getAttribute("parentEmail");
		   ParentVO parent = parentService.selectParent(parentEmail);
		   model.addAttribute("parent", parent);
		   return "parent/mparent_sidemenu_info";
	   }
	   
	   // 내정보 수정하기로 이동
	   @RequestMapping(value="/parent/mparent_sidemenu_info_modify", method=RequestMethod.GET)
	   public String parentMypageUpdateForm(HttpSession session, Model model) {
		   String parentEmail = (String) session.getAttribute("parentEmail");
		   ParentVO parent = parentService.selectParent(parentEmail);
		   model.addAttribute("parent", parent);
		   return "parent/mparent_sidemenu_info_modify";
	   }
	   
	   // 내정보 수정하기
	   @RequestMapping(value="/parent/mparent_sidemenu_info_modify", method=RequestMethod.POST)
	   public String parentMypageUpdate(ParentVO parent) {
		   parentService.updateParent(parent);
		   return "redirect:/parent/mparent_sidemenu_info";
	   }
   
}