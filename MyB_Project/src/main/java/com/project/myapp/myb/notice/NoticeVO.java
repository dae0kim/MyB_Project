package com.project.myapp.myb.notice;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private int noticeId;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private int principalId;
}
