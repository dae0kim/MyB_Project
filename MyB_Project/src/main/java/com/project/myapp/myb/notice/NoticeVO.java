package com.project.myapp.myb.notice;

import java.util.Date;

import lombok.Data;

/**
 * 공지사항 정보를 담는 클래스입니다.
 * 
 * @author 손일형,김대영
 * @since 2023.04.04
 * 
 */
@Data
public class NoticeVO {
	private int noticeId;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private String noticeStat;
	private int adminId;
}
