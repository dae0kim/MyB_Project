package com.project.myapp.myb.teacher;

public interface ITeacherService {
	
	TeacherVO selectTeacher(String teacherEmail);
	TeacherVO getTeacherInfo(String teacherId);

}
