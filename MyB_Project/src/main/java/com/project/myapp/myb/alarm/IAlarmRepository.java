package com.project.myapp.myb.alarm;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IAlarmRepository {
	
	// 부모 알람
	void insertAlarm(@Param("parentId") int parentId, @Param("alarmMessage") String alarmMessage, @Param("childId") int childId);
	void insertParentAlarm(@Param("parentId") int parentId, @Param("alarmMessage") String alarmMessage);
	void insertNoticeAlarm(@Param("parentId") int parentId, @Param("alarmMessage") String alarmMessage);
	void updateAlarmChecked(int parentId);
	List<AlarmVO> getAlarm(int parentId);
	int hasNewAlarm(@Param("parentId") int parentId);

	// 선생님 알람
	void insertTeacherAlarm(@Param("teacherId") int teacherId, @Param("alarmMessage") String alarmMessage);
	void updateTeacherAlarmChecked(int teacherId);
	List<AlarmVO> getTeacherAlarm(int teacherId);
	int hasNewTeacherAlarm(@Param("teacherId") int teacherId);

}
