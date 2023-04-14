package com.project.myapp.myb.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.myapp.myb.device.IDeviceService;

/**
 * 사용자 정보 조회와 관련된 기능을 담는 컨트롤러 클래스입니다.
 * 
 * @author 김대영
 * @since 2023.04.04
 *
 */
@Controller
public class DeviceController {

	@Autowired
	IDeviceService deviceService;
	
	
	/**
	 * 사용자의 접속 기기 구분을 위한 메서드입니다.
	 * 
	 * @param request 요청정보를 입력합니다.
	 * @param model 모델객체를 입력합니다.
	 * @return 접속 기기에 맞는 메인 화면을 반환합니다.
	 */
	@RequestMapping(value="/")
	public String firstLoad(HttpServletRequest request,Model model){
			
	    Device device = DeviceUtils.getCurrentDevice(request);
	    if (device.isMobile()) {
	        System.out.println("모바일 장치입니다.");
	        return "/mindex";
	    } else if (device.isTablet()) {
	        System.out.println("태블릿 장치입니다.");
	        return "/index";
	    } else {
	        System.out.println("PC입니다.");
	        return "/index";
	    }
	}
	
	/**
	 * 이메일 중복 확인을 위한 메서드입니다.
	 * 
	 * @param email 이메일을 입력합니다.
	 * @return 중복 여부에 따라 fail,success를 반환합니다.
	 * @throws Exception 중복된 이메일의 경우 예외처리를 합니다.
	 */
	@RequestMapping(value="/device/userEmailChk", method=RequestMethod.POST)
    @ResponseBody
    public String userEmailCheck(String email) throws Exception {
		int count1 = deviceService.emailChkInAdmin(email);  
	    int count2 = deviceService.emailChkInParent(email);  
	    int count3 = deviceService.emailChkInTeacher(email);  
	
	    int result = count1 + count2 + count3;
	   
	    if(result != 0) {
	    	return "fail";	// 중복된 이메일
        } else {
        	return "success"; // 중복된 이메일X
	    }
    }
   
	/**
	 * 휴대폰 번호 중복 확인을 위한 메서드입니다.
	 * 
	 * @param phone 휴대폰 번호를 입력합니다.
	 * @return 중복 여부에 따라 fail,success를 반환합니다.
	 * @throws Exception 중복된 번호의 경우 예외처리를 합니다.
	 */
	@RequestMapping(value="/device/userPhoneChk", method=RequestMethod.POST)
    @ResponseBody
    public String userPhoneCheck(String phone) throws Exception {
		int count1 = deviceService.phoneChkInAdmin(phone);
	    int count2 = deviceService.phoneChkInParent(phone);
	    int count3 = deviceService.phoneChkInTeacher(phone);
	   
	    int result = count1 + count2 + count3;
	   
	    if(result != 0) {
		    return "fail";	// 중복된 폰번호
        } else {
	        return "success"; // 중복된 폰번호X
	    }
	}
}
