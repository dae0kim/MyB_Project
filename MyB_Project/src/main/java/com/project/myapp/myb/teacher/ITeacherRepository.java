package com.project.myapp.myb.teacher;

public interface ITeacherRepository {
	
	TeacherVO selectTeacher(String teacherEmail);
	TeacherVO getTeacherInfo(String teacherId);

}
