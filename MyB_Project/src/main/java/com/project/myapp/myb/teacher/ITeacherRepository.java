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
	
	/**
	 * 교사 로그인시 사용하는 메서드입니다
	 * 
	 * @param teacherEmail 교사 이메일을 입력합니다
	 * @return IF문에 따른 결과를 출력합니다
	 */
	TeacherVO selectTeacher(String teacherEmail);
	
	/**
	 * 교사의 비밀번호 일치 여부를 확인합니다
	 * 
	 * @param teacherEmail 이메일을 입력합니다
	 * @param teacherPw 비밀번호를 입력합니다
	 * @return 일치여부에 따른 결과를 표시합니다
	 */
	int pwChk(@Param(value="teacherEmail")String teacherEmail, @Param(value="teacherPw")String teacherPw);
	
	
	/**
	 * 관리자 식별번호에 따른 교사 식별번호를 가져오는 메서드입니다.
	 * 
	 * @param adminId 원장 식별번호를 입력합니다
	 * @return 교사 식별번호를 담은 객체를 출력합니다.
	 */
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
