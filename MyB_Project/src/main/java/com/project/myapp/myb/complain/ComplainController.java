package com.project.myapp.myb.complain;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ComplainController {
	
	@Autowired
	IComplainService complainService;
	
	// 공지사항 전체 조회
	@RequestMapping(value = "/complain/list/{adminId}/{page}")
	public String selectComplainList(@PathVariable int adminId,@PathVariable int page, HttpSession session, Model model) {
		
		String stat = (String) session.getAttribute("kindergartenStat");
		
		if(stat != null) {
			if(stat.equals("Y")) {
				session.setAttribute("page", page);
				List<ComplainVO> complainList = complainService.selectComplainList(adminId,page);
				model.addAttribute("complainList", complainList);
				int bbsCount = complainService.selectTotalComplainCount(adminId);
				int totalPage = 0;
				if(bbsCount > 0) {
					totalPage= (int)Math.ceil(bbsCount/10.0);
				}
				model.addAttribute("totalPageCount", totalPage);
				model.addAttribute("page", page);
				return "/principal/complain/complainlist";
			}
		}else {
			return "redirect:/kindergarten/check";
		}
		return "redirect:/kindergarten/check";
	}
	
	@RequestMapping("/complain/list/{adminId}")
	public String selectComplainList(@PathVariable int adminId,HttpSession session, Model model) {
		return selectComplainList(adminId,1,session,model);
	}

	// 공지사항 상세 정보 조회
	@RequestMapping(value = "/complain/info/{complainId}/{page}")
	public String selectComplainInfo(@PathVariable int complainId, @PathVariable int page,  Model model) {
		ComplainVO complainVO = complainService.selectComplainInfo(complainId);
		ComplainDetailVO complainDetailVO = complainService.selectComplainDetail(complainId);

		model.addAttribute("complainVO", complainVO);
		model.addAttribute("complainDetailVO", complainDetailVO);
		model.addAttribute("page", page);
		return "/principal/complain/complaininfo";
	}

	@RequestMapping(value = "/complain/info/{complainId}")
	public String selectNoticeInfo(@PathVariable int complainId,Model model) {
		return selectComplainInfo(complainId, 1, model);
	}	
	
	// 공지사항 삭제
	@RequestMapping(value = "/complain/update/{complainId}")
	public String deleteTeacher(@PathVariable int complainId,HttpSession session, HttpServletRequest request) {
		complainService.updateComplain(complainId);
		return "redirect:/complain/info/"+complainId;
	}
}
