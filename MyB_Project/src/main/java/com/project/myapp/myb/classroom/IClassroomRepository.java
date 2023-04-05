package com.project.myapp.myb.classroom;

import java.util.List;

/**
 * 교실과 관련된 기능을 담는 레포지토리 인터페이스입니다.
 * 
 * @author 문수지,손일형,김대영
 * @since 2023.04.04
 *
 */
public interface IClassroomRepository {
	
	// 해당하는 어린이집의 반들 출력(0323 문수지 작성)
	List<ClassroomVO> selectClassroomList(int kindergartenId);
	
	// 어린이집 정보 불러오기(0327 문수지 작성)
	ClassroomVO selectClassroom(int classroomId);
	
	// (0329 합침 일형추가)
	ClassroomVO getTeacherClass(int teacherId);

	// (0329 합침 일형추가)
	ClassroomVO getClassName(String classroomName);	

	
	/* -----------------------------웹 기능 : 김대영----------------------------- */
	/**
	 * 원장 사용자의 유치원에 있는 반 이름 목록을 반환하는 메서드입니다.
	 *  
	 * @param adminId 사용자 식별번호를 입력합니다.
	 * @return 반 이름이 담긴 리스트를 반환합니다.
	 */
	List<ClassroomVO> getClassroomNameList(int adminId);
	
	/**
	 * 반 상세정보를 담은 객체를 반환하는 메서드입니다. 
	 * 
	 * @param classroomId 반 식별번호를 입력합니다.
	 * @return 해당 반의 상세정보를 담은 객체를 반환합니다.
	 */
	ClassroomListVO getClassroomInfo(int classroomId);
	
	/**
	 * 반 이름을 반환하는 메서드입니다.
	 * 
	 * @param classroomId 반 식별번호를 입력합니다.
	 * @return 해당 반의 이름을 반환합니다.
	 */
	String getClassroomName(int classroomId);
	
	/**
	 * 반 식별번호를 반환하는 메서드입니다.
	 * 
	 * @param classroomSeqVO 반 정보가 담긴 객체를 입력합니다.
	 * @return 특정 반의 식별번호를 반환합니다.
	 */
	int getClassroomSeq(ClassroomSeqVO classroomSeqVO);
	
	/**
	 * 반을 등록하는 메서드입니다.
	 * 
	 * @param classroom 반 정보를 담은 객체를 입력합니다.
	 */
	void insertClassroom(ClassroomVO classroom);

	/**
	 * 반 정보를 수정하는 메서드입니다.
	 * 
	 * @param classroom 수정된 반 정보를 담은 객체를 입력합니다.
	 */
	void updateClassroom(ClassroomVO classroom);
	
	/**
	 * 특정 어린이집의 반 개수를 출력하는 메서드입니다.
	 * 
	 * @param kindergartenId 어린이집 식별번호를 입력합니다.
	 * @return 해당 어린이집의 반 개수를 반환합니다.
	 */
	int getClassroomCount(int kindergartenId);
}
