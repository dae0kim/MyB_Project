package com.project.myapp.myb.kindergarten;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class KindergartenController {
	
	@Autowired
	IKindergartenService kindergartenService;
	
	// 어린이집 등록 페이지 이동
	@RequestMapping(value="/kindergarten/insert", method=RequestMethod.GET)
	public String kindergartenForm() {
		return "/principal/kindergartenform";
	}
	
	// 어린이집 등록
	@RequestMapping(value="/kindergarten/insert", method=RequestMethod.POST)
	public String kindergartenInsert(KindergartenVO kindergartenVO, HttpSession session) {
		kindergartenService.insertKindergarten(kindergartenVO);
		return "redirect:/principal/home";
	}
}
