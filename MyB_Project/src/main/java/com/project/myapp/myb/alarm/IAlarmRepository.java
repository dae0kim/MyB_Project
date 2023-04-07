package com.project.myapp.myb.alarm;

import java.util.List;

import org.apache.ibatis.annotations.Param;

/**
 * 알람 기능을 담는 레포지토리 인터페이스입니다.
 * 
 * @author 문수지
 * @since 2023.04.03
 *
 */
public interface IAlarmRepository {
	
	/**
	 * 교사 사용자가 요청사항 답변등록 시 알람 메시지를 DB에 넣어주는 메서드입니다.
	 * 
	 * @param parentId 부모 사용자의 식별번호를 입력합니다.
	 * @param alarmMessage 알람 메시지를 입력합니다.
	 * @param childId 자녀의 식별번호를 입력합니다.
	 */
	void insertAlarm(@Param("parentId") int parentId, @Param("alarmMessage") String alarmMessage, @Param("childId") int childId);
	
	/**
	 * 원장 사용자가 공지사항 등록 시 알람 메시지를 DB에 넣어주는 메서드입니다.
	 * 
	 * @param parentId 부모 사용자의 식별번호를 입력합니다.
	 * @param alarmMessage 알람 메시지를 입력합니다.
	 */
	void insertParentAlarm(@Param("parentId") int parentId, @Param("alarmMessage") String alarmMessage);

	/**
	 * 부모 사용자가 알람을 확인하면 알람 상태를 읽음으로 처리해주는 메서드입니다.
	 * 
	 * @param parentId 부모 사용자의 식별번호를 입력합니다.
	 */
	void updateAlarmChecked(int parentId);
	
	/**
	 * 부모 사용자의 알람 목록을 출력해주는 메서드입니다.
	 * 
	 * @param parentId 부모 사용자의 식별번호를 입력합니다.
	 * @return 해당 식별번호를 가진 부모의 알람 객체 리스트를 반환합니다.
	 */
	List<AlarmVO> getAlarm(int parentId);
	
	/**
	 * 부모 사용자의 새로운 알람 여부를 확인하는 메서드입니다.
	 * 
	 * @param parentId 부모 사용자의 식별번호를 입력합니다.
	 * @return 새로운 알람의 개수를 반환합니다.
	 */
	int hasNewAlarm(@Param("parentId") int parentId);

	/**
	 * 원장 사용자가 공지사항 등록 시 알람 메시지를 DB에 넣어주는 메서드입니다.
	 * 
	 * @param teacherId 교사 사용자의 식별번호를 입력합니다.
	 * @param alarmMessage 알람 메시지를 입력합니다.
	 */
	void insertTeacherAlarm(@Param("teacherId") int teacherId, @Param("alarmMessage") String alarmMessage);
	
	/**
	 * 교사 사용자가 알람을 확인하면 알람 상태를 읽음으로 처리해주는 메서드입니다.
	 * 
	 * @param teacherId 교사 사용자의 식별번호를 입력합니다.
	 */
	void updateTeacherAlarmChecked(int teacherId);
	
	/**
	 * 교사 사용자의 알람 목록을 출력해주는 메서드입니다.
	 * 
	 * @param teacherId 교사 사용자의 식별번호를 입력합니다.
	 * @return 해당 식별번호를 가진 교사의 알람 객체 리스트를 반환합니다.
	 */
	List<AlarmVO> getTeacherAlarm(int teacherId);
	
	/**
	 * 교사 사용자의 새로운 알람 여부를 확인하는 메서드입니다.
	 * 
	 * @param teacherId 교사 사용자의 식별번호를 입력합니다.
	 * @return 새로운 알람의 개수를 반환합니다.
	 */
	int hasNewTeacherAlarm(@Param("teacherId") int teacherId);

}
