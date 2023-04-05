package com.project.myapp.myb.kindergarten;

import java.util.List;
import java.util.Map;

import com.project.myapp.myb.uploadfile.UploadFileVO;

/**
 * 어린이집과 관련된 기능을 담는 서비스 인터페이스입니다.
 * 
 * @author 문수지,손일형,김대영
 * @since 2023.04.04
 *
 */
public interface IKindergartenService {
	
	// 어린이집 검색 (0323 문수지 작성)
	List<KindergartenVO> searchListByNameKeyword(String kindergartenNameKeyword, String kindergartenCity, String kindergartenGu);
	
	// 어린이집 정보 불어오기 (0324 문수지 작성)
	KindergartenVO selectKindergartenById(int kindergartenId);
	
	// (0329 합침 일형추가)
	KindergartenVO getKindergartenName(String kindergartenName);
	
	/* -----------------------------웹 기능 : 김대영----------------------------- */
	/**
	 * 접속한 원장 사용자의 어린이집 정보 반환을 위한 메서드입니다.
	 * 
	 * @param adminId 사용자 식별번호를 입력합니다.
	 * @return 해당 사용자가 등록한 어린이집 정보가 담긴 객체를 반환합니다.
	 */
	KindergartenVO selectKindergarten(int adminId);

	/**
	 * 어린이집 등록을 위한 메서드입니다.
	 * 
	 * @param kindergartenVO 어린이집 정보가 담긴 객체를 입력합니다.
	 */	
	void insertKindergarten(KindergartenVO kindergartenVO);
	
	/**
	 * 어린이집 등록을 위한 메서드입니다.
	 * 
	 * @param kindergartenVO 어린이집 정보가 담긴 객체와 파일 정보가 담긴 객체를 입력합니다.
	 */
	void insertKindergarten(KindergartenVO kindergartenVO,UploadFileVO file);
	
	/**
	 * 어린이집 등록 요청 목록을 출력하기 위한 메서드입니다.
	 * 
	 * @return 어린이집 등록 정보가 담긴 객체 리스트를 반환합니다.
	 */
	List<KindergartenVO> selectKindergartenList();
	
	/**
	 * 어린이집 등록 요청사항 세부정보 확인을 위한 메서드입니다.
	 * 
	 * @param kindergartenId 어린이집 식별번호를 입력합니다.
	 * @return 해당 어린이집의 정보가 담긴 객체를 반환합니다.
	 */
	KindergartenVO selectKindergartenInfo(int kindergartenId);
	
	/**
	 * 저장된 파일 정보 반환을 위한 메서드입니다.
	 * 
	 * @param fileId 파일 식별번호를 입력합니다.
 	 * @return 해당 파일 데이터가 담긴 객체를 반환합니다.
	 */
	UploadFileVO getFile(int fileId);
	
	/**
	 * 어린이집 등록 승인을 위한 메서드입니다. 
	 * 
	 * @param kindergartenId 어린이집 식별번호를 입력합니다.
	 */
	void updateKindergartenApprove(int kindergartenId);
	
	/**
	 * 어린이집 등록 거절을 위한 메서드입니다. 등록 요청시 업로드 된 어린이집 정보 데이터를 삭제합니다.
	 *  
	 * @param kindergartenId 어린이집 식별번호를 입력합니다.
	 */
	void deleteKindergartenDisapprove(int kindergartenId);
	
	/**
	 * 각 반별 결석 인원 반환을 위한 메서드입니다.
	 * 
	 * @param kindergartenId 어린이집 식별번호를 입력합니다.
	 * @return 반 이름, 결석 인원을 담은 맵 리스트를 반환합니다.
	 */
	List<Map<String, Object>> countAbsentList(int kindergartenId);

	/**
	 * 각 반의 총 인원 반환을 위한 메서드입니다.
	 * 
	 * @param kindergartenId 어린이집 식별번호를 입력합니다.
	 * @return 반 이름, 총 인원수를 담은 맵 리스트를 반환합니다.
	 */
	List<Map<String, Object>> countStudentList(int kindergartenId);

	/**
	 * 각 반의 출석 인원 반환을 위한 메서드입니다.
	 * 
	 * @param kindergartenId 어린이집 식별번호를 입력합니다.
	 * @return 반 이름, 출석 인원수를 담은 맵 리스트를 반환합니다.
	 */
	List<Map<String, Object>> countAttendanceList(int kindergartenId);

	/**
	 * 각 반의 결석 인원 중 질병과 인원수 반환을 위한 메서드입니다.
	 * 
	 * @param classroomId 반 식별번호를 입력합니다.
	 * @return 질병명, 환자수를 담은 맵 리스트를 반환합니다.
	 */
	List<Map<String, Object>> countClassroomDiseaseList(int classroomId);
}
