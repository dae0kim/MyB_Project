package com.project.myapp.myb.teacher;

import lombok.Data;

@Data
public class TeacherVO {
	private int teacherId;
	private String teacherName;
	private String teacherEmail;
	private String teacherPw;
	private String teacherPhone;
	private int principalId;
	private int classroomId;
	private int kindergartenId;
}
