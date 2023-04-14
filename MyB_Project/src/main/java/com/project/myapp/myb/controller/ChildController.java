package com.project.myapp.myb.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.myapp.myb.child.ChildVO;
import com.project.myapp.myb.child.IChildService;
import com.project.myapp.myb.classroom.ClassroomVO;
import com.project.myapp.myb.classroom.IClassroomService;
import com.project.myapp.myb.kindergarten.IKindergartenService;
import com.project.myapp.myb.kindergarten.KindergartenVO;

/**
 * 자녀와 관련된 기능을 담는 컨트롤러클래스입니다.
 * 
 * @author 문수지
 * @since 2023.03.23
 *
 */
@Controller
public class ChildController {
	
   @Autowired
   IChildService childService;
   
   @Autowired
   IClassroomService classroomService;
   
   @Autowired
   IKindergartenService kindergartenService;
   
   /**
    * 자녀의 반을 선택하고 자녀정보를 입력하는 페이지로 이동하는 메서드입니다.
    * 
    * @param kindergartenId 유치원 식별번호를 입력합니다.
    * @param session 세션정보를 입력합니다.
    * @param model 모델객체를 입력합니다.
    * @return 자녀의 반을 선택하고 자녀정보를 입력하는 페이지를 반환합니다.
    */
   @RequestMapping(value="/parent/mparent_select_class/{kindergartenId}", method=RequestMethod.GET)
   public String kindergartenClassForm(@PathVariable int kindergartenId, HttpSession session, Model model) {
      List<ClassroomVO> classroomList = classroomService.selectClassroomList(kindergartenId);
      model.addAttribute("classroomList", classroomList);
      KindergartenVO kindergarten = kindergartenService.selectKindergartenById(kindergartenId);
      model.addAttribute("kindergartenName", kindergarten.getKindergartenName());
      model.addAttribute("kindergarten", kindergarten);

      return "parent/mparent_select_class";
   }
   
   /**
    * 자녀의 반을 선택하고 자녀정보를 입력하는 메서드입니다.
    * 
    * @param child 자녀정보가 담긴 객체를 입력합니다.
    * @param session 세션정보를 입력합니다.
    * @return 부모 사용자 전용 로그인 페이지를 반환합니다.
    */
   @RequestMapping(value="/parent/mparent_select_class", method=RequestMethod.POST)
   public String kindergartenChildInsert(ChildVO child, HttpSession session) {
      childService.insertChild(child);
      
      if (session.getAttribute("childName")==null) { // 회원가입 시 자녀등록할 경우
    	  session.invalidate();
          return "parent/mparent_login";
      } else { // 로그인한 부모 사용자가 자녀등록 추가할 경우
    	  return "parent/mparent_web_main";
      }
   }

}