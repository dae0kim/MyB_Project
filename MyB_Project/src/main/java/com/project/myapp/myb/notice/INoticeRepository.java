package com.project.myapp.myb.notice;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface INoticeRepository {

	
	// (0329 합침 일형추가)
	// 공지 불러오기
	List<NoticeVO> getNoticeList();
	
	// (0329 합침 일형추가)
	//공지 상세
	NoticeVO setNoticeView(int noticeId);
	
	/* -----------------------------웹 기능----------------------------- */
	// 접속중인 원장이 작성한 모든 공지사항 가져오기
	List<NoticeVO> selectNoticeList(@Param("adminId") int adminId,@Param("start") int start,@Param("end") int end);
	
	// 전체 공지사항 개수 반환
	int selectTotalNoticeCount(int adminId);
	
	// 공지사항 작성하기
	void insertNotice(NoticeVO noticeVO);
	
	// 공지사항 상세정보 확인
	NoticeVO selectNoticeInfo(int noticeId);
	
	// 공지사항 수정하기
	void updateNotice(NoticeVO noticeVO);
	
	// 공지사항 삭제하기
	void deleteNotice(int noticeId);
}
