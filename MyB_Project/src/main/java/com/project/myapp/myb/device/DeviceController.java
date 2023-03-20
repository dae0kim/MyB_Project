package com.project.myapp.myb.device;

import javax.servlet.http.HttpServletRequest;

import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DeviceController {

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
}
