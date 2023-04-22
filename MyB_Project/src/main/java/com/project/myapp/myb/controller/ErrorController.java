package com.project.myapp.myb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {

	@GetMapping("/error404")
	public String Error404(HttpServletRequest request, HttpServletResponse res, Model model) {
		Device device = DeviceUtils.getCurrentDevice(request);
		model.addAttribute("code", "ERROR_404");
		if (device.isMobile()) {
			return "error/moblie_error/404";
		} else {
			return "error/web_error/404";
		}
	}
	
	@GetMapping("/error500")
	public String Error500(HttpServletRequest request, HttpServletResponse res, Model model) {
		Device device = DeviceUtils.getCurrentDevice(request);
		model.addAttribute("code", "ERROR_500");
		if (device.isMobile()) {
			return "error/moblie_error/500";
		} else {
			return "error/web_error/500";
		}
	}
	
	

}
