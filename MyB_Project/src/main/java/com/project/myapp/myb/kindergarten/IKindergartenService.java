package com.project.myapp.myb.kindergarten;

import java.util.List;

import com.project.myapp.myb.uploadfile.UploadFileVO;

public interface IKindergartenService {
	
	// 로그인 한 원장의 어린이집 반환
	KindergartenVO selectKindergarten(int adminId);

	// 어린이집 등록
	void insertKindergarten(KindergartenVO kindergartenVO);
	void insertKindergarten(KindergartenVO kindergartenVO,UploadFileVO file);
	
	// 어린이집 등록 요청 페이징
	List<KindergartenVO> selectKindergartenList(int page);
	
	// 어린이집 등록 요청사항 세부정보 확인
	KindergartenVO selectKindergartenInfo(int kindergartenId);
	UploadFileVO getFile(int fileId);
	
	// 어린이집 등록 승인
	void updateKindergartenApprove(int kindergartenId);
	
	// 어린이집 등록 거절
	void deleteKindergartenDisapprove(int kindergartenId);
	
	// 전체 어린이집 등록 요청 개수 출력
	int selectTotalKindergartenCount();
}
