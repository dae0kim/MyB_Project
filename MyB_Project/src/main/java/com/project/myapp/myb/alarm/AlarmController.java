package com.project.myapp.myb.alarm;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AlarmController {
	
	@Autowired
	IAlarmRepository alarmRepository;
	
	@Autowired
	AlarmService alarmService;
	
	// 부모 알람 (0403 문수지)
	// 알람 올 경우
	@RequestMapping(value = "/checkalarm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Boolean> checkForNewAlarm(HttpSession session) {
	    int parentId = (Integer) session.getAttribute("parentId"); 
	    boolean hasNewAlarm = alarmService.hasNewAlarm(parentId);
	    Map<String, Boolean> result = new HashMap<>();
	    result.put("hasNewAlarm", hasNewAlarm);
	    return result;
	}
	
	// 알람 확인 시
	@RequestMapping(value = "/updatealarm", method = RequestMethod.POST)
	@ResponseBody
	public void updateAlarmChecked(@RequestParam int parentId) {
		System.out.println(parentId);
	    alarmService.updateAlarmChecked(parentId);
	}
	
	// 선생 알람 (0403 문수지)
	// 알람 올 경우
	@RequestMapping(value = "/checkteacheralarm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Boolean> checkForNewTeacherAlarm(HttpSession session) {
	    int teacherId = (Integer) session.getAttribute("teacherId"); 
	    boolean hasNewTeacherAlarm = alarmService.hasNewTeacherAlarm(teacherId);
	    Map<String, Boolean> result = new HashMap<>();
	    result.put("hasNewTeacherAlarm", hasNewTeacherAlarm);
	    return result;
	}
	
	// 알람 확인 시
	@RequestMapping(value = "/updateteacheralarm", method = RequestMethod.POST)
	@ResponseBody
	public void updateTeacherAlarmChecked(@RequestParam int teacherId) {
		System.out.println(teacherId);
	    alarmService.updateTeacherAlarmChecked(teacherId);
	}

}
