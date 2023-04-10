package com.project.myapp.myb.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * 공지사항과 관련된 기능을 담는 서비스클래스입니다.
 * 
 * @author 손일형,김대영
 * @since 2023.04.04
 *
 */
@Service
public class NoticeService implements INoticeService {

	@Autowired
	@Qualifier("INoticeRepository")
	INoticeRepository noticeRepository;
	

	// (0329 합침 일형추가)
	@Override
	public NoticeVO setNoticeView(int noticeId) {
		// TODO Auto-generated method stub
		return noticeRepository.setNoticeView(noticeId);
	}
	
	@Override
	public List<NoticeVO> getNoticeList(int teacherId) {
		return noticeRepository.getNoticeList(teacherId);
	}
	
	/* -----------------------------웹 기능 : 김대영----------------------------- */
	@Override
	public List<NoticeVO> selectNoticeList(int adminId) {
		return noticeRepository.selectNoticeList(adminId);
	}

	@Override
	public void insertNotice(NoticeVO noticeVO) {
		noticeRepository.insertNotice(noticeVO);
	}

	@Override
	public NoticeVO selectNoticeInfo(int noticeId) {
		return noticeRepository.selectNoticeInfo(noticeId);
	}

	@Override
	public void updateNotice(NoticeVO noticeVO) {
		noticeRepository.updateNotice(noticeVO);
	}

	@Override
	public void deleteNotice(int noticeId) {
		noticeRepository.deleteNotice(noticeId);
	}



}
