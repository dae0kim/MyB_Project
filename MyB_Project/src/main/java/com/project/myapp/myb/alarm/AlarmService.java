package com.project.myapp.myb.alarm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * 알람 기능을 담는 서비스클래스입니다.
 * 
 * @author 문수지
 * @since 2023.04.03
 *
 */
@Service
public class AlarmService implements IAlarmService {

	@Autowired
	@Qualifier("IAlarmRepository")
	IAlarmRepository alarmRepository;

	@Override
	public void insertAlarm(int parentId, String alarmMessage, int childId) {
		alarmRepository.insertAlarm(parentId, alarmMessage, childId);
	}

	@Override
	public void insertParentAlarm(int parentId, String alarmMessage) {
		alarmRepository.insertParentAlarm(parentId, alarmMessage);
	}

	@Override
	public void updateAlarmChecked(int parentId) {
		alarmRepository.updateAlarmChecked(parentId);
	}

	@Override
	public List<AlarmVO> getAlarm(int parentId) {
		List<AlarmVO> alarm = alarmRepository.getAlarm(parentId);
	    return alarm;
	}

	@Override
	public boolean hasNewAlarm(int parentId) {
		int newAlarm = alarmRepository.hasNewAlarm(parentId);
	    return newAlarm>0;
	}

	@Override
	public void insertTeacherAlarm(int teacherId, String alarmMessage) {
		alarmRepository.insertTeacherAlarm(teacherId, alarmMessage);
	}
	
	@Override
	public void updateTeacherAlarmChecked(int teacherId) {
		alarmRepository.updateTeacherAlarmChecked(teacherId);
	}
	
	@Override
	public List<AlarmVO> getTeacherAlarm(int teacherId) {
		List<AlarmVO> alarm = alarmRepository.getTeacherAlarm(teacherId);
		return alarm;
	}
	
	@Override
	public boolean hasNewTeacherAlarm(int teacherId) {
		int newAlarm = alarmRepository.hasNewTeacherAlarm(teacherId);
		return newAlarm>0;
	}
	


}
