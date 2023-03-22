package com.project.myapp.myb.parent;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ParentController {
   
   @Autowired
   IParentService parentService;
   
   @RequestMapping(value="/parent/mparent_terms")
   public String moveTerms() {
      return "parent/mparent_terms";
   }
   
   @RequestMapping(value="/parent/mparent_join", method=RequestMethod.GET)
   public String joinForm() {
      return "parent/mparent_join";
   }
   
   @RequestMapping(value="/parent/mparent_join", method=RequestMethod.POST)
   public String parentJoin(ParentVO parent, HttpSession session) {
      parentService.insertParent(parent);
      session.invalidate();
      return "parent/mparent_login";
   }
   
   @RequestMapping(value="/parent/mparent_login", method=RequestMethod.GET)
   public String parentLogin() {
      return "parent/mparent_login";
   }
   
   @RequestMapping(value="/parent/mparent_login", method=RequestMethod.POST)
   public String parentLogin(String parentEmail, String parentPw, HttpSession session, Model model) {
      ParentVO parent = parentService.selectParent(parentEmail);
      if(parent != null) {
         String dbPassword = parent.getParentPw();
         if(dbPassword == null) {
            model.addAttribute("message", "NOT_VALID_PARENT");
         } else {
            System.out.println(parentPw);
            if(dbPassword.equals(parentPw)) {
               session.setAttribute("parentEmail", parentEmail);
               session.setAttribute("parentRelation", parent.getParentRelation());
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
   
   @RequestMapping(value="/parent/mparent_logout", method=RequestMethod.GET)
   public String parentLogout(HttpSession session, HttpServletRequest request) {
      session.invalidate();
      return "mindex";
   }
   
   @RequestMapping(value="/parent/mparent_web_main")
   public String moveMain() {
      return "parent/mparent_web_main";
   }
   
}