package com.project.myapp.myb.teacher;

import java.util.List;

import org.apache.ibatis.annotations.Param;

/**
 * 교사와 관련된 기능을 담는 레포지토리 인터페이스입니다.
 * 
 * @author 손일형,김대영
 * @since 2023.04.04
 *
 */
public interface ITeacherRepository {
	
	TeacherVO selectTeacher(String teacherEmail);
	
	// 로그인 체크부분 (0329 합침 일형추가)
	int emailChk(String teacherEmail);
	
	// (0329 합침 일형추가)
	int pwChk(@Param(value="teacherEmail")String teacherEmail, @Param(value="teacherPw")String teacherPw);
	
	// adminId에 따른 teacherId 가져오기 (0403 문수지)
	List<Integer> selectTeacherIdByAdmin(int adminId);
	
	/* -----------------------------웹 기능 : 김대영----------------------------- */
	/**
	 * 교사정보 등록을 위한 메서드입니다.
	 * 
	 * @param teacherVO 교사정보가 담긴 객체를 입력합니다.
	 */
	void insertTeacher(TeacherVO teacherVO);

	/**
	 * 교사 목록 출력을 위한 메서드입니다.
	 *  
	 * @param adminId 사용자 식별번호를 입력합니다.
	 * @return 교사정보가 담긴 객체 리스트를 반환합니다.
	 */
	List<TeacherVO> selectTeacherList(int adminId);

	/**
	 * 교사 상세정보 조회를 위한 메서드입니다.
	 * 
	 * @param teacherId 교사 식별번호를 입력합니다.
	 * @return 해당 교사의 정보가 담긴 객체를 반환합니다.
	 */
	TeacherVO selectTeacherInfo(int teacherId);

	/**
	 * 교사 정보 수정을 위한 메서드입니다.
	 * 
	 * @param teacher 수정된 교사정보가 담긴 객체를 입력합니다.
	 */
	void updateTeacher(TeacherVO teacher);

	/**
	 * 교사 정보 삭제를 위한 메서드입니다.
	 * 
	 * @param teacherId 교사 식별번호를 입력합니다.
	 */
	void deleteTeacher(int teacherId);

}
