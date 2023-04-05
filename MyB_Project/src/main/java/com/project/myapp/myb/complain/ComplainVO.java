package com.project.myapp.myb.complain;

import java.util.Date;

import lombok.Data;

/**
 * 컴플레인 정보를 담는 클래스입니다.
 * 
 * @author 문수지,손일형,김대영
 * @since 2023.04.04
 *
 */
@Data
public class ComplainVO {
	private int complainId;
	private String complainTitle;
	private String complainContent;
	private Date complainDate;
	private String complainStat;
	private int parentId;
	private int adminId;
	private int childId; 
	
	private String parentName;
	private String parentPhone;
}
