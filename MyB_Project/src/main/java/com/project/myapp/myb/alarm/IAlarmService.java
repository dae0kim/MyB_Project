package com.project.myapp.myb.alarm;

import java.util.List;

public interface IAlarmService {
	
	void insertAlarm(int parentId, String alarmMessage);
	void updateAlarmChecked(int parentId);
	List<AlarmVO> getAlarm(int parentId);
	boolean hasNewAlarm(int parentId);
	
	// 선생님 알람
	void insertTeacherAlarm(int teacherId, String alarmMessage);
	void updateTeacherAlarmChecked(int teacherId);
	List<AlarmVO> getTeacherAlarm(int teacherId);
	boolean hasNewTeacherAlarm(int teacherId);
}
