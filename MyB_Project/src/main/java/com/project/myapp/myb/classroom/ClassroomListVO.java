package com.project.myapp.myb.classroom;

import lombok.Data;

/**
 * 반 상세정보를 담는 클래스입니다.
 * 
 * @author 김대영
 * @since 2023.04.04
 *
 */
@Data
public class ClassroomListVO {
	private int classroomId;
	private String classroomName;
	private String teacherName;
	private int count;
}
