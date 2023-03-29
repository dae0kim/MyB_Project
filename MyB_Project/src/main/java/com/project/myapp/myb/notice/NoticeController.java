package com.project.myapp.myb.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NoticeController {
	
	@Autowired
	INoticeService noticeService;
	
	// 공지사항 전체 조회
	@RequestMapping(value = "/notice/list/{adminId}/{page}")
	public String selectNoticeList(@PathVariable int adminId,@PathVariable int page, HttpSession session, Model model) {
		
		String stat = (String) session.getAttribute("kindergartenStat");
		
		if(stat != null) {
			if(stat.equals("Y")) {
				session.setAttribute("page", page);
				List<NoticeVO> noticeList = noticeService.selectNoticeList(adminId,page);
				model.addAttribute("noticeList", noticeList);
				int bbsCount = noticeService.selectTotalNoticeCount(adminId);
				int totalPage = 0;
				if(bbsCount > 0) {
					totalPage= (int)Math.ceil(bbsCount/10.0);
				}
				model.addAttribute("totalPageCount", totalPage);
				model.addAttribute("page", page);
				return "/principal/notice/noticelist";
			}
		}else {
			return "redirect:/kindergarten/check";
		}
		return "redirect:/kindergarten/check";
	}
	
	@RequestMapping("/notice/list/{adminId}")
	public String selectNoticeList(@PathVariable int adminId,HttpSession session, Model model) {
		return selectNoticeList(adminId,1,session,model);
	}

	// 공지사항 상세 정보 조회
	@RequestMapping(value = "/notice/info/{noticeId}/{page}")
	public String selectNoticeInfo(@PathVariable int noticeId, @PathVariable int page,  Model model) {
		NoticeVO noticeVO = noticeService.selectNoticeInfo(noticeId);
		model.addAttribute("noticeVO", noticeVO);
		model.addAttribute("page", page);
		return "/principal/notice/noticeinfo";
	}

	@RequestMapping(value = "/notice/info/{noticeId}")
	public String selectNoticeInfo(@PathVariable int noticeId,Model model) {
		return selectNoticeInfo(noticeId, 1, model);
	}

	// 공지사항 입력 페이지 이동
	@RequestMapping(value = "/notice/insert", method = RequestMethod.GET)
	public String insertNotice(Model model) {
		return "/principal/notice/noticeinsertform";
	}
	
	// 공지사항 등록
	@RequestMapping(value = "/notice/insert", method = RequestMethod.POST)
	public String insertNotice(NoticeVO noticeVO,HttpSession session) {
		noticeService.insertNotice(noticeVO);
		int adminId = ((Integer)session.getAttribute("adminId")).intValue();
		return "redirect:/notice/list/"+adminId;
	}

	// 공지사항을 수정 페이지 이동
	@RequestMapping(value = "/notice/update/{noticeId}", method = RequestMethod.GET)
	public String updateNotice(@PathVariable int noticeId, Model model) {
		NoticeVO noticeVO = noticeService.selectNoticeInfo(noticeId);
		model.addAttribute("noticeVO", noticeVO);
		return "/principal/notice/noticeupdate";
	}
	
	// 공지사항 수정
	@RequestMapping(value = "/notice/update", method = RequestMethod.POST)
	public String updateNotice(NoticeVO noticeVO) {
		noticeService.updateNotice(noticeVO);
		return "redirect:/notice/info/" + noticeVO.getNoticeId();
	}

	// 공지사항 삭제
	@RequestMapping(value = "/notice/delete/{noticeId}")
	public String deleteTeacher(@PathVariable int noticeId,HttpSession session, HttpServletRequest request) {
		noticeService.deleteNotice(noticeId);
		int adminId = ((Integer)session.getAttribute("adminId")).intValue();
		return "redirect:/notice/list/"+adminId;
	}
}
