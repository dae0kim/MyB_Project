package com.project.myapp.myb.teacher;

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

	@Override
	public TeacherVO getTeacherInfo(String teacherId) {
		return teacherRepository.getTeacherInfo(teacherId);
	}

}
