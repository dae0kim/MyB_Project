package com.project.myapp.myb.notice;

import java.util.List;

/**
 * 공지사항과 관련된 기능을 담는 서비스 인터페이스입니다.
 * 
 * @author 손일형,김대영
 * @since 2023.04.04
 *
 */
public interface INoticeService {

	// (0329 합침 일형추가)
	// 공지 불러오기
	List<NoticeVO> getNoticeList(int teacherId);
	
	// (0329 합침 일형추가)
	//공지 상세
	NoticeVO setNoticeView(int noticeId);
	
	/* -----------------------------웹 기능 : 김대영----------------------------- */
	/**
	 * 접속중인 원장이 작성한 모든 공지사항을 가져오기위한 메서드입니다.
	 * 
	 * @param adminId 사용자 식별번호를 입력합니다.
	 * @return 공지사항 객체 리스트를 반환합니다.
	 */
	List<NoticeVO> selectNoticeList(int adminId);
	
	/**
	 * 공지사항을 작성하기위한 메서드입니다.
	 * 
	 * @param noticeVO 공지사항 정보가 담긴 객체를 입력합니다.
	 */
	void insertNotice(NoticeVO noticeVO);
	
	/**
	 * 공지사항 상세정보 확인을 위한 메서드입니다.
	 * 
	 * @param noticeId 공지사항 식별번호를 입력합니다.
	 * @return 해당 공지사항의 정보가 담긴 객체를 반환합니다.
	 */
	NoticeVO selectNoticeInfo(int noticeId);
	
	/**
	 * 공지사항 수정을 위한 메서드입니다.
	 * 
	 * @param noticeVO 수정된 정보가 담긴 공지사항 객체를 입력합니다.
	 */
	void updateNotice(NoticeVO noticeVO);
	
	/**
	 * 공지사항 삭제를 위한 메서드입니다.
	 * 
	 * @param noticeId 공지사항 식별번호를 입력합니다.
	 */
	void deleteNotice(int noticeId);
}
