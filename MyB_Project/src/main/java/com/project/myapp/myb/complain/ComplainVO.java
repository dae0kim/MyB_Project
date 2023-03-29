package com.project.myapp.myb.complain;

import java.util.Date;

import lombok.Data;

@Data
public class ComplainVO {
	private int complainId;
	private String complainTitle;
	private String complainContent;
	private Date complainDate;
	private String complainStat;
	private int parentId;
	private int adminId;
	
	private String parentName;
	private String parentPhone;
}
