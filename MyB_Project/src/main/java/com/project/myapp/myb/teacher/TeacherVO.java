package com.project.myapp.myb.teacher;

import lombok.Data;

/**
 * 교사정보를 담는 클래스입니다.
 * 
 * @author 손일형,김대영
 * @since 2023.04.04
 * 
 */
@Data
public class TeacherVO {
	private int teacherId;
	private String teacherName;
	private String teacherEmail;
	private String teacherPw;
	private String teacherPhone;
	private int adminId;
	private int classroomId;
	private int kindergartenId;
	
	private String classroomName;
}
