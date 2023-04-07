package com.project.myapp.myb.alarm;

import java.util.Date;

import lombok.Data;

/**
 * 알람 정보를 담는 클래스입니다.
 * 
 * @author 문수지
 * @since 2023.04.03
 *
 */
@Data
public class AlarmVO {
	private int alarmId;
	private int parentId;
	private int teacherId;
	private int childId;
	private String alarmMessage;
	private Date alarmDate;
	private String alarmChecked;
}
