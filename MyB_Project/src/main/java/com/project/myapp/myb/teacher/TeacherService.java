package com.project.myapp.myb.teacher;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * 교사와 관련된 기능을 담는 서비스클래스입니다.
 * 
 * @author 손일형,김대영
 * @since 2023.04.04
 *
 */
@Service
public class TeacherService implements ITeacherService {
	
	@Autowired
	@Qualifier("ITeacherRepository")
	ITeacherRepository teacherRepository;

	@Override
	public TeacherVO selectTeacher(String teacherEmail) {
		return teacherRepository.selectTeacher(teacherEmail);
	}

	// (0329 합침 일형추가)
	@Override
	public int pwChk(String teacherEmail, String teacherPw) throws Exception {
		return teacherRepository.pwChk(teacherEmail, teacherPw);
	}
	
	@Override
	public List<Integer> selectTeacherIdByAdmin(int adminId) {
		return teacherRepository.selectTeacherIdByAdmin(adminId);
	}
	
	/* -----------------------------웹 기능 : 김대영----------------------------- */
	@Override
	public void insertTeacher(TeacherVO teacherVO) {
		teacherRepository.insertTeacher(teacherVO);
	}

	@Override
	public List<TeacherVO> selectTeacherList(int adminId) {
		return teacherRepository.selectTeacherList(adminId);
	}

	@Override
	public TeacherVO selectTeacherInfo(int teacherId) {
		return teacherRepository.selectTeacherInfo(teacherId);
	}

	@Override
	public void updateTeacher(TeacherVO teacher) {
		teacherRepository.updateTeacher(teacher);
	}

	@Override
	public void deleteTeacher(int teacherId) {
		teacherRepository.deleteTeacher(teacherId);
	}

}
