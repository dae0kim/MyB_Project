package com.project.myapp.myb.request;

import java.util.Date;

import lombok.Data;

@Data
public class RequestVO {
	private int requestId;
	private Date requestDate;
	private String requestContent1;
	private String requestContent2;
	private String requestContent3;
	private String requestContent4;
	private String requestContent5;
	private String requestStat1;
	private String requestStat2;
	private String requestStat3;
	private String requestStat4;
	private String requestStat5;
	private String requestComment;	
	private int parentId;
	private int childId;
	private int classroomId;
}
