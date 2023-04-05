package com.project.myapp.myb.teacher;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ITeacherRepository {
	
	TeacherVO selectTeacher(String teacherEmail);
	
	// 로그인 체크부분 (0329 합침 일형추가)
	int emailChk(String teacherEmail);
	
	// (0329 합침 일형추가)
	int pwChk(@Param(value="teacherEmail")String teacherEmail, @Param(value="teacherPw")String teacherPw);
	
	// adminId에 따른 teacherId 가져오기 (0403 문수지)
	List<Integer> selectTeacherIdByAdmin(int adminId);
	
	/* -----------------------------웹 기능----------------------------- */
	//1. 교사 정보 등록 - 이름, 계정(email,pw), 연락처, 담당 반
	void insertTeacher(TeacherVO teacherVO);
	
	// 중복체크
	//int emailChk(String teacherEmail);
	int phoneChk(String teacherPhone);
	
	//2. 교사 목록 출력 - 현재 로그인 된 원장 아래 있는 선생님 정보만 필요
	List<TeacherVO> selectTeacherList(int adminId);
	//3. 교사 상세정보 조회
	TeacherVO selectTeacherInfo(int teacherId);
	//4. 교사 정보 수정
	void updateTeacher(TeacherVO teacher);
	//5. 교사 정보 삭제
	void deleteTeacher(int teacherId);

}
