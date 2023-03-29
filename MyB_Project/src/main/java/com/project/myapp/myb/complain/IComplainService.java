package com.project.myapp.myb.complain;

import java.util.List;

public interface IComplainService {
	
	
	// 1:1문의 작성
	void insertComplain(ComplainVO complain);
	// 1:1문의 리스트 불러오기
	List<ComplainVO> selectComplainList(int parentId);
	// 1:1문의 상세보기 (0328 문수지 작성)
	ComplainVO selectComplain(int complainId);
	
	/* -----------------------------웹 기능----------------------------- */
	// 접속중인 원장 어린이집의 모든 컴플레인 리스트 가져오기
	List<ComplainVO> selectComplainList2(int adminId,int page);
	// 전체 공지사항 개수 반환
	int selectTotalComplainCount(int adminId);
	
	// 공지사항 상세정보 확인
	ComplainVO selectComplainInfo(int complainId);
	ComplainDetailVO selectComplainDetail(int complainId);
	
	// 공지사항 수정하기
	void updateComplain(int complainId);
}
