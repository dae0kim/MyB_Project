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
import com.project.myapp.myb.notice.INoticeService;
import com.project.myapp.myb.notice.NoticeVO;

@Controller
public class ChildController {
   @Autowired
   IChildService childService;
   
   @Autowired
   IClassroomService classroomService;
   
   @Autowired
   IKindergartenService kindergartenService;
   
   @Autowired
   INoticeService noticeService;
   
   
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
   
   // 반&자녀 정보 등록 (0324 문수지 작성)
   @RequestMapping(value="/parent/mparent_select_class", method=RequestMethod.POST)
   public String kindergartenChildInsert(ChildVO child, HttpSession session) {
      childService.insertChild(child);
      session.invalidate();
      
      return "parent/mparent_login";
   }

   // Mypage에서 반&자녀 정보 등록 페이지로 이동 (0329 문수지 수정)
   @RequestMapping(value="/parent/mparent_select_class_mypage/{kindergartenId}", method=RequestMethod.GET)
   public String kindergartenMypageChildInsertForm(@PathVariable int kindergartenId, HttpSession session, Model model) {
      List<ClassroomVO> classroomList = classroomService.selectClassroomList(kindergartenId);
      model.addAttribute("classroomList", classroomList);
      KindergartenVO kindergarten = kindergartenService.selectKindergartenById(kindergartenId);
      model.addAttribute("kindergartenName", kindergarten.getKindergartenName());
      model.addAttribute("kindergarten", kindergarten);
      return "parent/mparent_select_class_mypage";
   }
   
   // 반&자녀 정보 Mypage에서 등록 (0329 문수지 수정)
   @RequestMapping(value="/parent/mparent_select_class_mypage", method=RequestMethod.POST)
   public String kindergartenMypageChildInsert(ChildVO child, Model model) {
      childService.insertChild(child);
      
      // 공지사항
        List<NoticeVO> noticelist = noticeService.getNoticeList();
        model.addAttribute("noticelist", noticelist);
      
      return "parent/mparent_web_main";
   }
}