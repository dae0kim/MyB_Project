package com.project.myapp.myb.alarm;

import java.util.Date;

import lombok.Data;

@Data
public class AlarmVO {
	private int alarmId;
	private int parentId;
	private int teacherId;
	private String alarmMessage;
	private Date alarmDate;
	private String alarmChecked;
}
