package com.project.myapp.myb.kindergarten;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.myapp.myb.admin.AdminVO;
import com.project.myapp.myb.admin.IAdminService;
import com.project.myapp.myb.uploadfile.UploadFileVO;

@Controller
public class KindergartenController {

	@Autowired
	IKindergartenService kindergartenService;

	@Autowired
	IAdminService adminService;

	// 어린이집 검색 페이지로 이동 (0323 문수지 작성)
	@RequestMapping(value = "/parent/mparent_select_kinder", method = RequestMethod.GET)
	public String kindergartenSearchForm() {
		return "parent/mparent_select_kinder";
	}

	// 어린이집 검색 (0323 문수지 작성)
	@RequestMapping(value = "/parent/mparent_select_kinder", method = RequestMethod.POST)
	public String kindergartenSearch(@RequestParam(required = false, defaultValue = "") String kindergartenNameKeyword,
			@Param(value = "kindergartenCity") String kindergartenCity,
			@Param(value = "kindergartenGu") String kindergartenGu, HttpSession session, Model model) {
		try {
			List<KindergartenVO> kindergartenList = kindergartenService.searchListByNameKeyword(kindergartenNameKeyword,
					kindergartenCity, kindergartenGu);
			model.addAttribute("kindergartenList", kindergartenList);
			model.addAttribute("kindergartenNameKeyword", kindergartenNameKeyword);
			model.addAttribute("kindergartenCity", kindergartenCity);
			model.addAttribute("kindergartenGu", kindergartenGu);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "parent/mparent_select_kinder";
	}

	// Mypage에서 어린이집 검색 페이지로 이동 (0329 문수지 수정)
	@RequestMapping(value = "/parent/mparent_select_kinder_mypage", method = RequestMethod.GET)
	public String kindergartenMypageSearchForm() {
		return "parent/mparent_select_kinder_mypage";
	}

	// Mypage에서 어린이집 검색 (0329 문수지 수정)
	@RequestMapping(value = "/parent/mparent_select_kinder_mypage", method = RequestMethod.POST)
	public String kindergartenMypageSearch(
			@RequestParam(required = false, defaultValue = "") String kindergartenNameKeyword,
			@Param(value = "kindergartenCity") String kindergartenCity,
			@Param(value = "kindergartenGu") String kindergartenGu, HttpSession session, Model model) {
		try {
			List<KindergartenVO> kindergartenList = kindergartenService.searchListByNameKeyword(kindergartenNameKeyword,
					kindergartenCity, kindergartenGu);
			model.addAttribute("kindergartenList", kindergartenList);
			model.addAttribute("kindergartenNameKeyword", kindergartenNameKeyword);
			model.addAttribute("kindergartenCity", kindergartenCity);
			model.addAttribute("kindergartenGu", kindergartenGu);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "parent/mparent_select_kinder_mypage";
	}

	/* -----------------------------웹 기능----------------------------- */
	// 어린이집 등록 상태 확인을 위한 페이지 이동
	@RequestMapping(value = "/kindergarten/check", method = RequestMethod.GET)
	public String kindergartenCheck() {
		return "/principal/kindergarten/kindergartencheck";
	}

	// 어린이집 등록 페이지 이동
	@RequestMapping(value = "/kindergarten/form", method = RequestMethod.GET)
	public String kindergartenForm(HttpSession session, HttpServletRequest request) {
		return "/principal/kindergarten/kindergarteninsertform";
	}

	// 어린이집 등록 양식 제출
	@RequestMapping(value = "/kindergarten/insert", method = RequestMethod.POST)
	public String kindergartenInsert(KindergartenVO kindergartenVO, BindingResult results,
			RedirectAttributes redirectAttrs, HttpSession session, HttpServletRequest request) {

		try {
			MultipartFile mfile = kindergartenVO.getFile();
			if (mfile != null && !mfile.isEmpty()) {
				UploadFileVO file = new UploadFileVO();
				file.setFileName(mfile.getOriginalFilename());
				file.setFileSize(mfile.getSize());
				file.setFileType(mfile.getContentType());
				file.setFileData(mfile.getBytes());
				kindergartenService.insertKindergarten(kindergartenVO, file);

				session.setAttribute("kindergartenStat", "N");

			} else {
				kindergartenService.insertKindergarten(kindergartenVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message", e.getMessage());
		}
		session.setAttribute("kindergartenId", kindergartenVO.getKindergartenId());
		return "/principal/kindergarten/kindergartencheck";
	}

	// 등록된 증명서류 가져오기
	@RequestMapping("/file/{fileId}")
	public ResponseEntity<byte[]> getFile(@PathVariable int fileId) {
		UploadFileVO file = kindergartenService.getFile(fileId);
		final HttpHeaders headers = new HttpHeaders();
		String[] mtypes = file.getFileType().split("/");
		headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
		headers.setContentLength(file.getFileSize());
		try {
			String encodedFileName = URLEncoder.encode(file.getFileName(), "UTF-8");
			headers.setContentDispositionFormData("attachment", encodedFileName);
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e);
		}
		return new ResponseEntity<byte[]>(file.getFileData(), headers, HttpStatus.OK);
	}

	// 어린이집 요청 목록 리스트 출력
	@RequestMapping("/kindergarten/request/list/{page}")
	public String getKindergartenList(@PathVariable int page, HttpSession session, Model model) {
		session.setAttribute("page", page);
		List<KindergartenVO> kindergartenList = kindergartenService.selectKindergartenList(page);
		model.addAttribute("kindergartenList", kindergartenList);
		int bbsCount = kindergartenService.selectTotalKindergartenCount();
		int totalPage = 0;
		if (bbsCount > 0) {
			totalPage = (int) Math.ceil(bbsCount / 10.0);
		}
		model.addAttribute("totalPageCount", totalPage);
		model.addAttribute("page", page);
		return "admin/kindergartenlist";
	}

	@RequestMapping("/kindergarten/request/list")
	public String getKindergartenList(HttpSession session, Model model) {
		return getKindergartenList(1, session, model);
	}

	// 어린이집 등록 요청 상세정보 조회
	@RequestMapping("/kindergarten/info/{kindergartenId}/{page}")
	public String getKindergartenDetails(@PathVariable int kindergartenId, @PathVariable int page, Model model) {
		KindergartenVO kindergartenVO = kindergartenService.selectKindergartenInfo(kindergartenId);
		model.addAttribute("kindergartenVO", kindergartenVO);
		model.addAttribute("page", page);
		return "admin/kindergarteninfo";
	}

	@RequestMapping("/kindergarten/info/{kindergartenId}")
	public String getKindergartenDetails(@PathVariable int kindergartenId, Model model) {
		return getKindergartenDetails(kindergartenId, 1, model);
	}

	// 어린이집 등록 승인
	@RequestMapping(value = "/kindergarten/approve/{kindergartenId}")
	public String updateKindergartenStatus(@PathVariable int kindergartenId, Model model) {
		kindergartenService.updateKindergartenApprove(kindergartenId);
		return "redirect:/kindergarten/info/{kindergartenId}";
	}

	// 어린이집 등록 거절
	@RequestMapping(value = "/kindergarten/disapprove/{kindergartenId}")
	public String deleteKindergartenStatus(@PathVariable int kindergartenId, Model model) {
		kindergartenService.deleteKindergartenDisapprove(kindergartenId);
		return "redirect:/kindergarten/request/list";
	}

}
