package com.project.myapp.myb.classroom;

import java.util.List;

public interface IClassroomService {
	
	
	// 해당하는 어린이집의 반들 출력(0323 문수지 작성)
	List<ClassroomVO> selectClassroomList(int kindergartenId);
	// 어린이집 정보 불러오기(0327 문수지 작성)
	ClassroomVO selectClassroom(int classroomId);
	
	// (0329 합침 일형추가)
	ClassroomVO getTeacherClass(int teacherId);
	// (0329 합침 일형추가)
	ClassroomVO getClassroomId(int teacherId);
	// (0329 합침 일형추가)
	ClassroomVO getClassName(String classroomName);
	
	/* -----------------------------웹 기능----------------------------- */
	// 반 이름 목록 리스트 출력
	List<ClassroomVO> getClassroomNameList(int adminId);
	
	// 반 상세정보 출력
	ClassroomListVO getClassroomInfo(int classroomId);
	
	// 반 이름 출력
	String getClassroomName(int classroomId);
	
	// 반 시퀀스id
	int getClassroomSeq(ClassroomSeqVO classroomSeqVO);
	
	// 반 등록
	void insertClassroom(ClassroomVO classroom);
	// 반 수정(이름만 수정 가능)
	void updateClassroom(ClassroomVO classroom);
	
	// 접속중인 원장 어린이집의 반 개수 반환
	int getClassroomCount(int kindergartenId);
}
