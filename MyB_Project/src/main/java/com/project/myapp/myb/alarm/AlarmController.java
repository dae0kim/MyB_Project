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

/**
 * 알람 기능을 담은 컨트롤러클래스입니다.
 * 
 * @author 문수지
 * @since 2023.04.03
 *
 */
@Controller
public class AlarmController {
	
	@Autowired
	IAlarmRepository alarmRepository;
	
	@Autowired
	AlarmService alarmService;
	
	/**
	 * ajax 요청에 따른 부모 유저에게 알람이 왔을 경우 표시해주는 메서드입니다.
	 * 
	 * @param session 세션정보를 입력합니다.
	 * @return ajax 요청의 결과값을 반환합니다.
	 */
	@RequestMapping(value = "/checkalarm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Boolean> checkForNewAlarm(HttpSession session) {
	    int parentId = (Integer) session.getAttribute("parentId"); 
	    boolean hasNewAlarm = alarmService.hasNewAlarm(parentId);
	    Map<String, Boolean> result = new HashMap<>();
	    result.put("hasNewAlarm", hasNewAlarm);
	    return result;
	}
	
	/**
	 * ajax 요청에 따른 부모 유저의 알람 메시지를 읽음 상태로 처리해주는 메서드입니다.
	 * 
	 * @param parentId 부모 유저의 식별번호를 입력합니다.
	 */
	@RequestMapping(value = "/updatealarm", method = RequestMethod.POST)
	@ResponseBody
	public void updateAlarmChecked(@RequestParam int parentId) {
	    alarmService.updateAlarmChecked(parentId);
	}
	
	/**
	 * ajax 요청에 따른 교사 유저에게 알람이 왔을 경우 표시해주는 메서드입니다.
	 * 
	 * @param session 세션정보를 입력합니다.
	 * @return ajax 요청의 결과값을 반환합니다.
	 */
	@RequestMapping(value = "/checkteacheralarm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Boolean> checkForNewTeacherAlarm(HttpSession session) {
	    int teacherId = (Integer) session.getAttribute("teacherId"); 
	    boolean hasNewTeacherAlarm = alarmService.hasNewTeacherAlarm(teacherId);
	    Map<String, Boolean> result = new HashMap<>();
	    result.put("hasNewTeacherAlarm", hasNewTeacherAlarm);
	    return result;
	}
	
	/**
	 * ajax 요청에 따른 교사 유저의 알람 메시지를 읽음 상태로 처리해주는 메서드입니다.
	 * 
	 * @param teacherId 교사 유저의 식별번호를 입력합니다.
	 */
	@RequestMapping(value = "/updateteacheralarm", method = RequestMethod.POST)
	@ResponseBody
	public void updateTeacherAlarmChecked(@RequestParam int teacherId) {
	    alarmService.updateTeacherAlarmChecked(teacherId);
	}

}
