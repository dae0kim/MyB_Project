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

import com.project.myapp.myb.alarm.IAlarmService;
import com.project.myapp.myb.parent.IParentService;
import com.project.myapp.myb.teacher.ITeacherService;

/**
 * 공지사항과 관련된 기능을 담는 컨트롤러클래스입니다.
 * 
 * @author 손일형,김대영
 * @since 2023.04.04
 *
 */
@Controller
public class NoticeController {

	@Autowired
	INoticeService noticeService;
	
	@Autowired
	ITeacherService teacherService;
	
	@Autowired
	IParentService parentService;
	
	@Autowired
	IAlarmService alarmService;

	// (0329 합침 일형추가)
	// 공지사항 출력
	@RequestMapping(value = "/teacher/mteacher_notice_detail")
	public String noticeDetail(Model model) {

		List<NoticeVO> noticelist = noticeService.getNoticeList();
		model.addAttribute("noticelist", noticelist);

		System.out.println("noticelist : " + noticelist);

		return "/teacher/mteacher_notice_detail";
	}

	// (0329 합침 일형추가)
	// 공지사항 상세
	@RequestMapping(value = "/teacher/notice/{noticeId}")
	public String setNoticeView(@PathVariable int noticeId, Model model) {

		NoticeVO noticeview = noticeService.setNoticeView(noticeId);
		model.addAttribute("noticeview", noticeview);

		System.out.println("noticeview : " + noticeview);

		return "/teacher/mteacher_notice_detail_view";

	}

	// 부모
	// 공지사항 출력
	@RequestMapping(value = "/parent/mparent_notice_detail")
	public String parentNoticeDetail(Model model) {

		List<NoticeVO> noticelist = noticeService.getNoticeList();
		model.addAttribute("noticelist", noticelist);

		return "/parent/mparent_notice_detail";
	}

	// 부모
	// 공지사항 상세
	@RequestMapping(value = "/parent/notice/{noticeId}")
	public String setParentNoticeView(@PathVariable int noticeId, Model model) {

		NoticeVO noticeview = noticeService.setNoticeView(noticeId);
		model.addAttribute("noticeview", noticeview);

		return "/parent/mparent_notice_detail_view";

	}

	/* -----------------------------웹 기능 : 김대영----------------------------- */
	/**
	 * 공지사항 전체 조회를 위한 메서드입니다.
	 * 
	 * @param adminId 사용자 식별번호를 입력합니다.
	 * @param session 세션정보를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @return 사용자의 상태에 맞는 화면을 반환합니다.
	 */
	@RequestMapping(value = "/notice/list/{adminId}")
	public String selectNoticeList(@PathVariable int adminId, HttpSession session, Model model) {
		
		String stat = (String) session.getAttribute("kindergartenStat");
		
		if(stat != null) {
			if(stat.equals("Y")) {
				List<NoticeVO> noticeList = noticeService.selectNoticeList(adminId);
				model.addAttribute("noticeList", noticeList);
				return "/principal/notice/noticelist";
			}
		}else {
			return "redirect:/kindergarten/check";
		}
		return "redirect:/kindergarten/check";
	}	

	/**
	 * 공지사항 상세 정보 조회를 위한 메서드입니다.
	 * 
	 * @param noticeId 공지사항 식별번호를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @return 공지사항 상세정보 페이지를 반환합니다.
	 */
	@RequestMapping(value = "/notice/info/{noticeId}")
	public String selectNoticeInfo(@PathVariable int noticeId, Model model) {
		NoticeVO noticeVO = noticeService.selectNoticeInfo(noticeId);
		model.addAttribute("noticeVO", noticeVO);
		return "/principal/notice/noticeinfo";
	}

	/**
	 * 공지사항 입력 페이지 이동을 위한 메서드입니다.
	 * 
	 * @param model 모델객체를 입력합니다.
	 * @return 공지사항 등록화면을 반환합니다.
	 */
	@RequestMapping(value = "/notice/insert", method = RequestMethod.GET)
	public String insertNotice(Model model) {
		return "/principal/notice/noticeinsertform";
	}
	
	/**
	 * 공지사항 등록을 위한 메서드입니다.
	 * 
	 * @param noticeVO 공지사항 정보가 담긴 객체를 입력합니다.
	 * @param session 세션정보를 입력합니다.
	 * @return 공지사항 목록 화면으로 이동하라는 요청을 반환합니다.
	 */
	@RequestMapping(value = "/notice/insert", method = RequestMethod.POST)
	public String insertNotice(NoticeVO noticeVO,HttpSession session) {
		noticeService.insertNotice(noticeVO);
		int adminId = ((Integer)session.getAttribute("adminId")).intValue();
		// 알람메시지 보내기 (0403 문수지 추가)
		String alarmMessage="새로운 공지사항이 등록되었습니다.";
		
		List<Integer> teacherIds = teacherService.selectTeacherIdByAdmin(adminId); // 해당 유치원에 소속하는 teacherId 리스트 저장
		for(int teacherId : teacherIds) {
			alarmService.insertTeacherAlarm(teacherId, alarmMessage); // 선생님에게 알람 보내기
		}
		
		List<Integer> parentIds = parentService.selectParentIdByAdmin(adminId); // 해당 유치원에 소속하는 parentId 리스트 저장
		for(int parentId : parentIds) {
			alarmService.insertParentAlarm(parentId, alarmMessage); // 부모님에게 알람 보내기
		}
		return "redirect:/notice/list/"+adminId;
	}

	/**
	 * 공지사항 수정 페이지 이동을 위한 메서드입니다.
	 * 
	 * @param noticeId 공지사항 식별번호를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @return 공지사항 수정화면을 반환합니다.
	 */
	@RequestMapping(value = "/notice/update/{noticeId}", method = RequestMethod.GET)
	public String updateNotice(@PathVariable int noticeId, Model model) {
		NoticeVO noticeVO = noticeService.selectNoticeInfo(noticeId);
		model.addAttribute("noticeVO", noticeVO);
		return "/principal/notice/noticeupdate";
	}
	
	/**
	 * 공지사항 수정을 위한 메서드입니다.
	 * 
	 * @param noticeVO 수정된 공지사항 정보가 담긴 객체를 입력합니다.
	 * @return 공지사항 상세정보 화면으로 이동하라는 요청을 반환합니다.
	 */
	@RequestMapping(value = "/notice/update", method = RequestMethod.POST)
	public String updateNotice(NoticeVO noticeVO) {
		noticeService.updateNotice(noticeVO);
		return "redirect:/notice/info/" + noticeVO.getNoticeId();
	}

	/**
	 * 공지사항 삭제를 위한 메서드입니다.
	 * 
	 * @param noticeId 공지사항 식별번호를 입력합니다.
	 * @param session 세션정보를 입력합니다.
	 * @param request 요청정보를 입력합니다.
	 * @return 공지사항 목록 화면으로 이동하라는 요청을 반환합니다.
	 */
	@RequestMapping(value = "/notice/delete/{noticeId}")
	public String deleteTeacher(@PathVariable int noticeId,HttpSession session, HttpServletRequest request) {
		noticeService.deleteNotice(noticeId);
		int adminId = ((Integer)session.getAttribute("adminId")).intValue();
		return "redirect:/notice/list/"+adminId;
	}
}
