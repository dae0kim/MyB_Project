package com.project.myapp.myb.teacher;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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
	/*
	 * @Override public TeacherVO getTeacherInfo(String teacherId) { return
	 * teacherRepository.getTeacherInfo(teacherId); }
	 */

	// (0329 합침 일형추가)
	@Override
	public int emailChk(String teacherEmail) throws Exception {
		return teacherRepository.emailChk(teacherEmail);
	}

	// (0329 합침 일형추가)
	@Override
	public int pwChk(String teacherEmail, String teacherPw) throws Exception {
		return teacherRepository.pwChk(teacherEmail, teacherPw);
	}
	
	/* -----------------------------웹 기능----------------------------- */
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

	/*
	@Override
	public int emailChk(String teacherEmail) {
		return teacherRepository.emailChk(teacherEmail);
	}*/

	@Override
	public int phoneChk(String teacherPhone) {
		return teacherRepository.phoneChk(teacherPhone);
	}

}
