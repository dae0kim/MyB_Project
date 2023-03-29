package com.project.myapp.myb.kindergarten;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.myapp.myb.uploadfile.UploadFileVO;

public interface IKindergartenRepository {
	
	
	// 어린이집 검색 (0323 문수지 작성)
	List<KindergartenVO> searchListByNameKeyword(@Param("kindergartenNameKeyword") String kindergartenNameKeyword, @Param(value="kindergartenCity") String kindergartenCity, @Param(value="kindergartenGu") String kindergartenGu);
	// 어린이집 정보 불어오기 (0324 문수지 작성)
	KindergartenVO selectKindergartenById(int kindergartenId);

	// (0329 합침 일형추가)
	KindergartenVO getKindergartenName(String kindergartenName);
	
	/* -----------------------------웹 기능----------------------------- */
	// 로그인 한 원장의 어린이집 반환
	KindergartenVO selectKindergarten(int adminId);

	// 어린이집 등록
	void insertKindergarten(KindergartenVO kindergartenVO);
	void insertFileData(UploadFileVO file);
	
	// 어린이집 등록 요청 리스트 출력
	List<KindergartenVO> selectKindergartenList(@Param("start") int start,@Param("end") int end);
	
	// 어린이집 등록 요청사항 세부정보 확인
	KindergartenVO selectKindergartenInfo(int kindergartenId);
	UploadFileVO getFile(int fileId);
	
	// 어린이집 등록 승인
	void updateKindergartenApprove(int kindergartenId);
	
	// 어린이집 등록 거절
	void deleteFileData(int kindergartenId);
	void deleteKindergartenDisapprove(int kindergartenId);
	
	// 전체 어린이집 등록 요청 개수 출력
	int selectTotalKindergartenCount();
}
