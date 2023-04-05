package com.project.myapp.myb.complain;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.myapp.myb.child.ChildVO;
import com.project.myapp.myb.child.IChildService;
import com.project.myapp.myb.parent.IParentService;
import com.project.myapp.myb.parent.ParentVO;

/**
 * 컴플레인과 관련된 기능을 담는 컨트롤러클래스입니다.
 * 
 * @author 문수지,손일형,김대영
 * @since 2023.04.04
 *
 */
@Controller
public class ComplainController {
	
	@Autowired
	IComplainService complainService;
	
	@Autowired
	IParentService parentService;
	
	@Autowired
	IChildService childService;
	
	// 1:1문의하기로 이동
	@RequestMapping(value="/parent/mparent_sidemenu_qna")
	public String parentQna(HttpSession session, Model model) {
		String parentEmail = (String) session.getAttribute("parentEmail");
		ParentVO parent = parentService.selectParent(parentEmail);
		model.addAttribute("parent", parent);
		
		int parentId = parent.getParentId();
		List<ComplainVO> complainList = complainService.selectComplainList(parentId);
		model.addAttribute("complainList", complainList);
		
		return "parent/mparent_sidemenu_qna";
	}

	// 1:1문의 작성으로 이동
	@RequestMapping(value="/parent/mparent_sidemenu_qnawrite", method=RequestMethod.GET)
	public String parentQnaWriteForm(HttpSession session, Model model) {
		String parentEmail = (String) session.getAttribute("parentEmail");
		ParentVO parent = parentService.selectParent(parentEmail);
		model.addAttribute("parent", parent);
		List<ChildVO> childList = childService.selectAllChildList(parentEmail);
		model.addAttribute("childList", childList);
		return "parent/mparent_sidemenu_qnawrite";
	}

	// 1:1문의 작성
	@RequestMapping(value="/parent/mparent_sidemenu_qnawrite", method=RequestMethod.POST)
	public String parentQnaWrite(ComplainVO complain) {	
		complainService.insertComplain(complain); // 컴플레인 테이블에 정보 저장
		return "redirect:/parent/mparent_sidemenu_qna";
	}
	
	// 1:1문의 상세보기 이동
	@RequestMapping(value="/parent/mparent_sidemenu_qnadetail/{complainId}", method=RequestMethod.GET)
	public String parentQnaView(@PathVariable int complainId, HttpSession session, Model model) {
		ComplainVO complain = complainService.selectComplain(complainId);
		model.addAttribute("complain", complain);
		return "parent/mparent_sidemenu_qnadetail";
	}
	
	/* -----------------------------웹 기능 : 김대영----------------------------- */
	/**
	 * 원장 사용자의 어린이집에 등록된 모든 컴플레인 조회를 위한 메서드입니다.
	 * 
	 * @param adminId 사용자 식별번호를 입력합니다.
	 * @param session 세션정보를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @return 어린이집 등록이 끝난 사용자라면 컴플레인 목록 화면을, 아니라면 어린이집 등록 여부 확인 화면을 반환합니다.
	 */
	@RequestMapping(value = "/complain/list/{adminId}")
	public String selectComplainList(@PathVariable int adminId,HttpSession session, Model model) {
		
		String stat = (String) session.getAttribute("kindergartenStat");
		
		if(stat != null) {
			if(stat.equals("Y")) {
				List<ComplainVO> complainList = complainService.selectComplainList2(adminId);
				model.addAttribute("complainList", complainList);
				return "/principal/complain/complainlist";
			}
		}else {
			return "redirect:/kindergarten/check";
		}
		return "redirect:/kindergarten/check";
	}

	/**
	 * 컴플레인 상세정보 조회를 위한 메서드입니다.
	 * 
	 * @param complainId 컴플레인 식별번호를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @return 컴플레인 상세정보 페이지를 반환합니다.
	 */
	@RequestMapping(value = "/complain/info/{complainId}")
	public String selectComplainInfo(@PathVariable int complainId,  Model model) {
		ComplainVO complainVO = complainService.selectComplainInfo(complainId);
		ComplainDetailVO complainDetailVO = complainService.selectComplainDetail(complainId);

		model.addAttribute("complainVO", complainVO);
		model.addAttribute("complainDetailVO", complainDetailVO);
		return "/principal/complain/complaininfo";
	}	
	
	/**
	 * 컴플레인 상태 업데이트를 위한 메서드입니다.
	 * 
	 * @param complainId 컴플레인 식별번호를 입력합니다.
	 * @param session 세션정보를 입력합니다.
	 * @param request 요청정보를 입력합니다.
	 * @return 컴플레인 상세정보 페이지로 이동하라는 요청을 반환합니다.
	 */
	@RequestMapping(value = "/complain/update/{complainId}")
	public String updateComplain(@PathVariable int complainId,HttpSession session, HttpServletRequest request) {
		complainService.updateComplain(complainId);
		return "redirect:/complain/info/"+complainId;
	}
}
