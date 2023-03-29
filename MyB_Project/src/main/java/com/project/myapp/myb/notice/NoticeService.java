package com.project.myapp.myb.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class NoticeService implements INoticeService {

	@Autowired
	@Qualifier("INoticeRepository")
	INoticeRepository noticeRepository;
	
	@Override
	public List<NoticeVO> selectNoticeList(int adminId,int page) {
		int start = (page-1)*10-1;
		return noticeRepository.selectNoticeList(adminId,start, start+9);
	}
	
	@Override
	public int selectTotalNoticeCount(int adminId) {
		return noticeRepository.selectTotalNoticeCount(adminId);
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
