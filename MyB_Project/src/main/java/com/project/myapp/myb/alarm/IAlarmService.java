package com.project.myapp.myb.alarm;

import java.util.List;

/**
 * 알람 기능을 담는 서비스 인터페이스입니다.
 * 
 * @author 문수지
 * @since 2023.04.03
 *
 */
public interface IAlarmService {
	
	/**
	 * 교사 사용자가 요청사항 답변등록 시 알람 메시지를 DB에 넣어주는 메서드입니다.
	 * 
	 * @param parentId 부모 사용자의 식별번호를 입력합니다.
	 * @param alarmMessage 알람 메시지를 입력합니다.
	 * @param childId 자녀의 식별번호를 입력합니다.
	 */
	void insertAlarm(int parentId, String alarmMessage, int childId);
	
	/**
	 * 원장 사용자가 공지사항 등록 시 알람 메시지를 DB에 넣어주는 메서드입니다.
	 * 
	 * @param parentId 부모 사용자의 식별번호를 입력합니다.
	 * @param alarmMessage 알람 메시지를 입력합니다.
	 */
	void insertParentAlarm(int parentId, String alarmMessage);
	
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
	 * @return 새로운 알람의 개수를 활용하여 새로운 알람 여부를 판별합니다.
	 */
	boolean hasNewAlarm(int parentId);
	
	/**
	 * 원장 사용자가 공지사항 등록 시 알람 메시지를 DB에 넣어주는 메서드입니다.
	 * 
	 * @param teacherId 교사 사용자의 식별번호를 입력합니다.
	 * @param alarmMessage 알람 메시지를 입력합니다.
	 */
	void insertTeacherAlarm(int teacherId, String alarmMessage);
	
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
	 * @return 새로운 알람의 개수를 활용하여 새로운 알람 여부를 판별합니다.
	 */
	boolean hasNewTeacherAlarm(int teacherId);
}
